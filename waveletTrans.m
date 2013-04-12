function [parameters] = waveletTrans( imagefile )
    
    im = imread(imagefile);
    im1=reshape(im,1,[]);
    im1=double(im1);

    [C,L] = wavedec(im1,3,'db1');

    cA3 = appcoef(C,L,'db1',3);
    [cD1,cD2,cD3] = detcoef(C,L,[1,2,3]);


    sA1=std(cA3);
    sA2=mean(cA3);
    sD1=std(cD1);
    sD2=std(cD2);
    sD3=std(cD3);

    parameters=[sA1 sA2 sD1 sD2 sD3];