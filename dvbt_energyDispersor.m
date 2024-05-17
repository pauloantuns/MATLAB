Kbch = 256; %Quantidade de bits a ser embralhados

entrada = randi([0,1], 1, Kbch); %Sequencia aleatória de bits 0 e 1

sequencia_embaralhada = dvb_scrambler(entrada);

saida = dvb_scrambler(sequencia_embaralhada);

if isequal(entrada,saida)
	disp("A sequência original foi recuperada.");
else
	disp("A sequência não foi recuperada");
end


function scrambled_sequence = dvb_scrambler(input_sequence)
    %Parâmetros do padrão DVB-T
    polynomial = [1 0 0 0 0 0 0 0 0 0 0 0 0 1 1]; %Polinômio gerador do PRBS (1 + X^14 + X^15)
    initial_state = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0]; %Estado inicial do registro de deslocamento

    %Inicialização
    register = initial_state; %Define o estado inicial no registrador
    scrambled_sequence = zeros(size(input_sequence)); %Cria variavel de saída com o tamanho da entrada

    for i = 1:length(input_sequence)
        %Calcula o próximo bit do registro de deslocamento
        next_bit = mod(sum(register(polynomial == 1)), 2);

        %Salva o bit de saida (ou bit embaralhado)
        scrambled_sequence(i) = xor(input_sequence(i), next_bit);

        %Desloca o registro para a direita e insere next_bit no MSB
        register = [next_bit register(1:end-1)];
    end

    %Garante que o tamanho do resultado seja o mesmo que o tamanho da entrada
    scrambled_sequence = scrambled_sequence(1:length(input_sequence));
end
