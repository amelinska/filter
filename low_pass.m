load s100;
original = s100;
m=100;
close all;
for i = 1:10:m
titlestring1 = sprintf('Original Central element in mask %d ', i);
titlestring2 = sprintf('Filtered Central element in mask %d ', i);
%h= [-1 -1 -1; -1 i -1; -1 -1 -1];
%h= [1 2*i 1;  2*i 4*i 2*i; 1 2*i 1];
%h= [-0.17 0.67 0.17;0.67 -3.33 0.67; 0.17 0.67 0.17];

filtered = imfilter(original,h);

figure,
subplot(221);
imshow(original,[]), title(titlestring1)
subplot(222);
imshow(filtered,[]), title(titlestring2)
 x=[401 309];
 y=[145 459];
 
p=improfile(original,x,y);
subplot(223)
plot(p)
 
p2=improfile(filtered,x,y);
subplot(224)
plot(p2)
 
end
