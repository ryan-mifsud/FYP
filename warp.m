function B = warp(A)

  imshow(A);
  
  [x,y] = ginput(4);
  tmpVec = [1 1; 250 1; 250 50; 1 50];
  tmpVec2 = [x(1) y(1); x(2) y(2); x(3) y(3); x(4) y(4)];
  tform = estimateGeometricTransform(tmpVec2,tmpVec,'affine');
  B = imwarp(A, tform);
  imshow(B);
  
end