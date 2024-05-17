function resultado = compressao_e_descompressao(imagem1, imagem2)
    % Aplicação do filtro de mediana na imagem1
    medianImage = medfilt2(imagem1);

    % Cálculo do residuo
    residuo = imagem2 - uint8(medianImage);

    % Criação do dicionário de Huffman
    huffman_dict = huffmandict(0:255, hist(residuo(:), 0:255)/numel(residuo));

    % Compressão do residuo
    residuo_comprimido = huffmanenco(residuo(:), huffman_dict);

    % Descompressão do residuo
    residuo_descomprimido = huffmandeco(residuo_comprimido, huffman_dict);
    residuo_descomprimido = reshape(residuo_descomprimido, size(medianImage));

    % Reconstrução da imagem original
    imagem_reconstruida = uint8(residuo_descomprimido + double(medianImage));

     % Armazenando os resultados em uma estrutura
    resultado.imagem_reconstruida = imagem_reconstruida;
    resultado.residuo = residuo;
end
