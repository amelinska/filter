function [ rgbImage ] = gray2rgb(image)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Agray = mat2gray(image,[0 255]);
rgbImage = repmat(Agray,[1 1 3]);
figure,imshow(Agray,[]);
rgbImage = cat(3,Agray,Agray,Agray);
end

