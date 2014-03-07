%biomechanics_2014

clear all

load s100;
shorting =0.9;  % usuniecie smieci na brzegach
size_of_element = 2;
plotoption = 0;


original_image = s100;
original_image = (original_image/max(original_image(:)));

[x_size,y_size]= size(original_image);
original_image = original_image(1:floor(shorting*x_size),1:floor(shorting*y_size));

[diff, bone_from_original, struct_of_bones_before, struct_of_bones_after]  = compare_images(original_image, size_of_element, plotoption);

image_equaled = histeq(original_image); 
[equaled_diff, bone_from_equaled, equaled_struct_of_bones_before, equaled_struct_of_bones_after]  = compare_images(image_equaled, size_of_element, plotoption);



LOW_HIGH = stretchlim(original_image);

image_stretched = imadjust(original_image,LOW_HIGH);
[stretched_diff, bone_from_stretched, stretched_struct_of_bones_before, stretched_struct_of_bones_after]  = compare_images(image_stretched, size_of_element, plotoption);
