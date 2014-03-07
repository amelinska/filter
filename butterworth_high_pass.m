function butterworth_high_pass(im,fc)

close all;
 %fc=    %Cutoff frequency
n=1;
[m,n] = size(im);
cx = round(m/2);
cy = round(n/2);

imf=fftshift(fft2(im));
H=zeros(m,n);
for i = 1 : m
    for j =1 : n
        
        %d = (i-cx).^2 + (j-cy).^ 2;
        %H(i,j) = 1/(1+((d/fc/fc).^(2*n)));
        d = sqrt((i).^2 + (j).^ 2);
        H(i,j) = 1/(1+((sqrt(2) -1)*(d/fc).^(2*n)));
              
    end;
end;
outf = imf .* H;
out = abs(ifft2(outf));

figure, imshow(im,[]),title('Original Image')
figure,imshow(uint8(out)),title('High-pass Filterd Image')

end

