function [struct_of_bones] = find_all_non_zero_bones(struct_of_coordinates_3d, size_of_element);
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

names = fieldnames(struct_of_coordinates_3d);
[m,n] = size(names);

for i=1:m
    bone_num = sprintf('bone%d',i); 
    bone_coor = struct_of_coordinates_3d.(bone_num);
    [p,q] = size(bone_coor);
     
    if p > size_of_element
        x = bone_coor(:,1);
        y = bone_coor(:,2);
       
        
        struct_of_bones.(bone_num)=[x,y];
        
    end
        
        
        
        
        
end

