function psnr_value = calculate_psnr(dist_video_path)
    ref_vid = VideoReader("raw_ref.avi");
    dist_vid = dist_video_path;
    
    psnr_values = [];
    
    while hasFrame(ref_vid) && hasFrame(dist_vid)
        ref_frame = readFrame(ref_vid);
        dist_frame = readFrame(dist_vid);
        
        if size(ref_frame, 3) == 3
            ref_frame = rgb2gray(ref_frame);
        end
        
        if size(dist_frame, 3) == 3
            dist_frame = rgb2gray(dist_frame);
        end

        psnr_value = psnr(dist_frame, ref_frame);
        psnr_values = [psnr_values, psnr_value];
    end
    psnr_value = psnr_values;
end

function ssim_value = calculate_ssim(dist_video_path)
    ref_vid = VideoReader("raw_ref.avi");
    dist_vid = dist_video_path;
    
    ssim_values = [];
    
    while hasFrame(ref_vid) && hasFrame(dist_vid)
        ref_frame = readFrame(ref_vid);
        dist_frame = readFrame(dist_vid);
        
        if size(ref_frame, 3) == 3
            ref_frame = rgb2gray(ref_frame);
        end
        
        if size(dist_frame, 3) == 3
            dist_frame = rgb2gray(dist_frame);
        end

        ssim_value = ssim(dist_frame, ref_frame);
        ssim_values = [ssim_values, ssim_value];
    end
    ssim_value = ssim_values;
end

function immse_value = calculate_immse(dist_video_path)
    ref_vid = VideoReader("raw_ref.avi");
    dist_vid = dist_video_path;
    
    immse_values = [];
    
    while hasFrame(ref_vid) && hasFrame(dist_vid)
        ref_frame = readFrame(ref_vid);
        dist_frame = readFrame(dist_vid);
        
        if size(ref_frame, 3) == 3
            ref_frame = rgb2gray(ref_frame);
        end
        
        if size(dist_frame, 3) == 3
            dist_frame = rgb2gray(dist_frame);
        end

        immse_value = immse(dist_frame, ref_frame);
        immse_values = [immse_values, immse_value];
    end
    immse_value = immse_values;
end

function piqe_value = calculate_piqe(dist_video_path)
    dist_vid = dist_video_path;
    
    piqe_values = [];
    
    while hasFrame(dist_vid)
        dist_frame = readFrame(dist_vid);
        
        if size(dist_frame, 3) == 3
            dist_frame = rgb2gray(dist_frame);
        end

        piqe_value = piqe(dist_frame);
        piqe_values = [piqe_values, piqe_value];
    end
    piqe_value = piqe_values;
end
