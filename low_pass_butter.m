%function [ output_args ] = low_pass_butter(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%load s100

figure, subplot(221), imshow(s100,[]);
title('Original s100ge');

s100fft = fftshift(fft2(fftshift(s100)));

% Fourier Spectrum of Image
s100fft2 = fft2(s100);

s100fft3 = fftshift(s100fft2);
s = size(s100);
ma=max(max((s100fft)));
maxr = 0.5*sqrt(s(1)^2+s(2)^2);
cutoff1 = maxr*30;
cutoff2 = maxr*120;

c=1;

for i = 1 : s(1)
    for j = 1 : s(2)
        r = sqrt((i-1-s(1)/2)^2+(j-1-s(2)/2)^2);
        if r < 100
            z(i,j) = 0;
        elseif r > 220
            z(i,j) = 0;
        else
            z(i,j) = 255;
        end
    end
    
end


subplot(222) 
s100fft=s100fft.*z/255;
s100_out = fftshift(ifft2(fftshift(s100fft)));
s100_out =s100_out-s100;
[fa, fm] =fftshow(s100_out,'abs');
title('Filtered s100 (Ideal)');
subplot(223)
fftshow(s100fft3,'log');
title('Fourier Spectrum of Image')
subplot(224)
fftshow(z,'log');
title('Filtered');

%end

