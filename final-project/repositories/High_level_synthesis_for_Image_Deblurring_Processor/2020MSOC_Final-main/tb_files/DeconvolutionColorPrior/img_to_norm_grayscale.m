function I_norm_gray = img_to_norm_grayscale(I)
% 	img_to_norm_grayscale	Converts an image matrix to a normalized grayscale matrix in the range [0, 1]
% 		I_norm_gray = img_to_norm_grayscale(I)
% 	
% 		Inputs:
% 				I				Input image in float or integer datatype with multiple channels
% 
% 		Outputs:
% 				I_norm_gray		Converted single channel double image matrix in the range [0, 1]
%
%	Author:		Felix Heide

%convert to single channel
if size(I,3) > 1 
	I = rgb2gray(I);
end 

%check for datatype
if isfloat(I) 
	I_norm_gray = mat2gray(I); %use maximum and minimum number in array for normalizing to [0, 1]. This is the best we can do without further knowledge.
elseif isinteger(I)
	%Get minimum and maximum of integer image
	max_int_img = double(intmax(class(I)));
	min_int_img = double(intmin(class(I)));
	range = max_int_img - min_int_img;
	
	%Scale to range
	I_norm_gray = (double(I) - min_int_img)./range;
else
	error('Normalization could not be performed because of datatype');
end



