myDir = uigetdir; %gets directory
myFiles = dir(fullfile(myDir,'*.jpg')); %gets all jpg files in struct
myFolder = 'C:\Users\ryanm\Desktop\University aka School\FYP\Data Sets\snapshots\';

factor = 10;
for k = 1:length(myFiles)
  baseFileName = myFiles(k).name;
  %fullFileName = fullfile(myFolder, baseFileName);
  I = imread(strcat(myFolder,baseFileName));
  imshow(I);
  A = I;
  
  A = crop(I);
  proceed = 0;
% do not move on until enter key is pressed
  while proceed == 0
     pause; % wait for a keypress
     tmp=get(gcf,'CurrentKey'); 
     if strcmp(tmp, 'a') 
         proceed=1;
     elseif strcmp(tmp, 'b')
         A = crop(I);
     else
         
     end
  end
  imshow(A);
  
  B = warp(A);
  proceed=0;
% do not move on until enter key is pressed
  while proceed == 0
     pause; % wait for a keypress
     tmp=get(gcf,'CurrentKey'); 
     if strcmp(tmp, 'a') 
         proceed=1; 
     elseif strcmp(tmp, 'b')
         B = warp(A);
     else
         
     end
  end
  
  imshow(B);
  
  C = crop(B);
  proceed=0;
% do not move on until enter key is pressed
  while proceed == 0
     pause; % wait for a keypress
     tmp=get(gcf,'CurrentKey'); 
     if strcmp(tmp, 'a') 
         proceed=1; 
     elseif strcmp(tmp, 'b')
         C = crop(B);
     else
         
     end
  end
  
  savepath = strcat('C:\Users\ryanm\Desktop\University aka School\FYP\Data Sets\Warp Database\', baseFileName);
  savepath = savepath(1:end-4);
  savepath = strcat(savepath, '.bmp');
  imwrite(C, savepath);
  
end


