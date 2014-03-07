function [diff, bone, struct_of_bones_before, struct_of_bones_after] = compare_images(original_image, size_of_element, plotoption)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here



%save('original.tif',original_image);
[thresh, thresholded] = multithresholding(original_image,2);
%save('original_thresholded_2classes.tif',original_thresholded_2classes);
bone = thresholded == 1;
%save('bone.tif',original_image);
[struct_of_bones_before, c] = find_all_bones_coorinates(bone);
number_of_bones_before = length(fieldnames(struct_of_bones_before));

[struct_of_bones_after] = find_all_non_zero_bones(struct_of_bones_before, size_of_element);
number_of_bones_after = length(fieldnames(struct_of_bones_after));
diff = number_of_bones_before - number_of_bones_after;

if plotoption == 1
plot_region_growing_bones(struct_of_bones_before, bone)
plot_region_growing_bones(struct_of_bones_after, bone)

end

