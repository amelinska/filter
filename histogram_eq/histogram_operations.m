
load s100;
original_image = s100;
original_image = (original_image/max(original_image(:)));


%save('original.tif',original_image);


[thresh, original_thresholded_2classes] = multithresholding(original_image,2);
%save('original_thresholded_2classes.tif',original_thresholded_2classes);
bone = original_thresholded_2classes == 1;

[thresh, original_thresholded_3classes] = multithresholding(original_image,3);
%save('original_thresholded_3classes.tif',original_thresholded_3classes);

            %-----------histogram_operations-------
original_image_histogram = imhist(original_image);
%equalisation
image_equaled = histeq(original_image); 
image_histogram_equaled = imhist(image_equaled);

%local_equalisation
%image_local_histogram_equaled = local_hist_eq(original_image);

%stretching
LOW_HIGH = stretchlim(original_image);
image_stretched = imadjust(original_image,LOW_HIGH);
image_stretched_histogram = imhist(image_stretched);
            %------------plot--------------------

figure, 
subplot(4,1,1), bar(original_image_histogram),title('original_image_histogram');
subplot(4,1,2), bar(image_histogram_equaled),title('image_histogram_equaled');
subplot(4,1,3), bar(image_stretched_histogram), title('image_stretched_histogram');
%subplot(4,1,4), bar(image_local_histogram_equaled), title('image_local_histogram_equaled');
            %----------profils--------------------------
figure, 
imshow(original_image);
[x,y]=ginput(2);
x1 = x(1,:);
y1 = y(1,:);
x2 = x(2,:);
y2 = y(2,:);
close all

original_image_profile = improfile(original_image,x,y);
image_equaled_profile = improfile(image_equaled,x,y);
image_stretched_profile = improfile(image_stretched,x,y);
%image_local_histogram_equaled_profile = improfile(image_local_histogram_equaled,x,y);

figure, 
subplot(4,1,1), plot(original_image_profile), title('original_image_profile') ;
subplot(4,1,2), plot(image_equaled_profile), title('image_equaled_profile');
subplot(4,1,3), plot(image_stretched_profile), title('image_stretched_profile');
%subplot(4,1,4), plot(image_local_histogram_equaled_profile), title('image_local_histogram_equaled_profile');

%----------------------threshold for histogram changed images-------

[thresh, original_thresholded_2classes] = multithresholding(original_image,2);
[thresh, histogram_equaled_thresholded_2classes] = multithresholding(image_equaled,2);
%[thresh, local_histogram_equaled_thresholded_2classes] = multithresholding(histogram_equaled_thresholded_2classes,2);
[thresh, histogram_stretched_thresholded_2classes] = multithresholding(image_stretched,2);

figure, 
subplot(3,1,1), imshow(original_thresholded_2classes), title('original_thresholded_2classes');
subplot(3,1,2), imshow(histogram_equaled_thresholded_2classes), title('histogram_equaled_thresholded_2classes');
subplot(3,1,3), imshow(histogram_stretched_thresholded_2classes), title('histogram_stretched_thresholded_2classes');


figure, 
%subplot(3,1,1), imshow(original_thresholded_2classes);
subplot(3,1,1), imshow(abs(original_thresholded_2classes-histogram_equaled_thresholded_2classes)), title('abs(original_thresholded_2classes-histogram_equaled_thresholded_2classes');
subplot(3,1,2), imshow(abs(original_thresholded_2classes-histogram_stretched_thresholded_2classes)), title('abs(original_thresholded_2classes-histogram_stretched_thresholded_2classes)');
$subplot(3,1,3), imshow(abs(original_thresholded_2classes-local_histogram_equaled_thresholded_2classes)), title('abs(original_thresholded_2classes-histogram_stretched_thresholded_2classes)');



