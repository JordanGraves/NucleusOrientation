function [ files ] = ICanHasFiles( folder )
    files=dir(folder);
    files=struct2dataset(files);    
    files=string(files.name);
    files=files(files~='.' & files~='..' & files~='.DS_Store');
end