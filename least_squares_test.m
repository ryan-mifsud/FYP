path1 = 'C:\Users\ryanm\Desktop\University aka School\FYP\Data Sets\Database\Learning\LR\';
path2 = 'C:\Users\ryanm\Desktop\University aka School\FYP\Data Sets\Database\Learning\HR\';
myFiles1 = dir(fullfile(path1,'*.bmp')); %gets all bmp files in struct
myFiles2 = dir(fullfile(path2,'*.bmp')); %gets all bmp files in struct

tmpDirectory = strcat(path1, myFiles1(1).name);
Ilr = double(imread(tmpDirectory));
Ilr = Ilr(:);

for k = 2:length(myFiles1)
    
    baseFileName = myFiles1(k).name;
    tmpdir = strcat(path1, baseFileName);
    tmp = double(imread(tmpdir));
    B = tmp(:);
    
    Ilr = [Ilr B];
    
end


tmpDirectory = strcat(path2, myFiles2(1).name);
Ihr = double(imread(tmpDirectory));
Ihr = Ihr(:);

for k = 2:length(myFiles2)
    
    baseFileName2 = myFiles2(k).name;
    tmpdir2 = strcat(path2, baseFileName2);
    tmp2 = double(imread(tmpdir2));
    B2 = tmp2(:);
    
    Ihr = [Ihr B2];
    
end

Ilr_t = transpose(Ilr);
var_1 = Ilr_t*Ilr; %multiplying the LR matrix by its transpose
inv_var_1 = pinv(var_1);
var_2 = Ihr_t*Ilr; %multiplying the HR matrix by its LR matrix transpose
w = inv_var_1*var_2;


test_image = double(imread('P1010001.bmp'));
test_image = imresize(test_image, [480 480]);
test_image = w*test_image; %problem here... matrix dimensions must agree... we have 50x250 vs 480x480
test_image = imresize(test_image, [50 250]);
imshow(test_image);




