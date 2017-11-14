myFolder = 'C:\Users\ryanm\Desktop\University aka School\FYP\Data Sets\Grayscale Database\';
myFiles = dir(fullfile(myFolder,'*.bmp')); %gets all bmp files in struct

for k = 1:length(myFiles)
  
  
  baseFileName = myFiles(k).name;
  %fullFileName = fullfile(myFolder, baseFileName);
  I = imread(strcat(myFolder,baseFileName));
  
  new_I = rgb2gray(I);
  
  savepath = strcat(myFolder, baseFileName);
  imwrite(new_I, savepath);
  
end
