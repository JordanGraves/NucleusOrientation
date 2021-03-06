folder = uigetdir();
fileList = ICanHasFiles(folder);

nuclei = Nucleus.empty;

filename = strcat(folder,'/');
filename = strcat(filename,fileList(i));

I=imread(filename,'tif');
[labelarray I] = processImage(I);
s=regionprops(labelarray,'Centroid');

for i=2:length(fileList)
    filename = fileList(i);
    I=imread(filename);
    %I=imcomplement(I); %centroid only works for white shapes
    I=im2double(I);
    I=rgb2gray(I);
    I = medfilt2(I);
    I=I(:,:,1);
    labelarray=bwlabel(I);
end

