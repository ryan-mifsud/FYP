myFolder = 'C:\Users\ryanm\Desktop\University aka School\FYP\Data Sets\Database\Testing\HR\';
myFiles = dir(fullfile(myFolder,'*.bmp')); %gets all bmp files in struct
saveLoc = 'C:\Users\ryanm\Desktop\University aka School\FYP\Data Sets\Database\Testing\LR\';

factor = 3;
for k = 1:length(myFiles)
  
  
  baseFileName = myFiles(k).name;
  %fullFileName = fullfile(myFolder, baseFileName);
  I = imread(strcat(myFolder,baseFileName));
  
  A = imresize(I, 1/factor);
  B = imresize(A, [50, 250]);
  
  savepath = strcat(saveLoc, baseFileName);
  imwrite(B, savepath);
  
end