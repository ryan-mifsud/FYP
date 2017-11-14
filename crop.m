function B = crop(A)

    imshow(A); 
    
    rect = getrect;
    X_Cut_Min = rect(1,1);
    Y_Cut_Min = rect(1,2);
    X_Cut_Max = rect(1,3);
    Y_Cut_Max = rect(1,4); 
    B = imcrop(A,[X_Cut_Min Y_Cut_Min X_Cut_Max Y_Cut_Max]);
    B = imresize(B, [50 250]);
    imshow(B);

end