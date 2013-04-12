function []=runTest(loadfile,testdata)

LoadFileName=loadfile;
TestDatabasePath = testdata;

load (LoadFileName);

reply='y';

while reply=='y' || reply=='Y'

[filename, pathname] =uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Test Img', TestDatabasePath)
     
CheckImage = strcat(pathname,filename);
im = imread(CheckImage);
figure,imshow(im);
title('Test Image');

TestData= waveletTrans(CheckImage);

output=multisvm( TrainingData,Group,TestData );
str = strcat('Matched image is :  ');
disp(str)
files=dir( AllFolderNames{output} );
MachedImage = strcat(AllFolderNames{output},'\',files(3).name);
im = imread(MachedImage);
figure,imshow(im);
title('Equivalent Image');
output

reply = input('Do you want test more? y/n [y]: ', 's');
if isempty(reply)
    reply = 'y';
end

end
