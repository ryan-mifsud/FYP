myDir = uigetdir; 
myFiles = dir(fullfile(myDir,'*.jpg')); 
myFolder = 'C:\Users\ryanm\Desktop\University aka School\FYP\Data Sets\License Plate Database\';
factor = 1;
for k = 1:100
      
  baseFileName = myFiles(k).name;

  I = imread(strcat(myFolder,baseFileName));
  imshow(I);
  X = zeros(10);
  Y = [1 2 3 4 5 6 7 8 9 10];
  for count = 1:10
     
      factor = count;
      A = imresize(I, 1/factor);
      B = imresize(A, [50 250]);

      [peaksnr, snr] = psnr(B, I);
      
      X(factor) = peaksnr; 
      
  end
  
  figure;
  plt = plot(Y, X);
  title(baseFileName)
  xlabel('Scale - 1/n') % x-axis label
  ylabel('PSNR - dB') % y-axis label
  pause(1);
  S = baseFileName;
  S = S(1:end-4);
  name = strcat(S, '.fig');
  savefig(name);
  
end