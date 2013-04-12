clear all
clc
close all
reply='y';

HumanFacesTrainDatabasePath ={ 'C:\Users\PG\Downloads\internship\Imgdataset\female' , 'C:\Users\PG\Downloads\internship\Imgdataset\male','C:\Users\PG\Downloads\internship\Imgdataset\malestaff'};
AvatarFacesTrainDatabasePath ={ 'C:\Users\PG\Downloads\internship\Imgdataset\AvatarFaces'};

HumanFacesTestDatabasePath= 'C:\Users\PG\Downloads\internship\Imgdataset\TestData';
AvatarFacesTestDatabasePath= 'C:\Users\PG\Downloads\internship\Imgdataset\AvatarTestData';

disp('Enter Your choice ');
choice=input('1]AvtarFaces 2]HumanFaces');
switch choice
   case 1
        reply = input('Do you want Train SVM again  y/n [y]: ', 's');
        if reply=='y' || reply=='Y'
            TrainingFunction(AvatarFacesTrainDatabasePath,4);
            
        end
        
            runTest('currentAvatarFaceTrainingData.mat',AvatarFacesTestDatabasePath);

   case 2
        reply = input('Do you want Train SVM again  y/n [y]: ', 's');
        if reply=='y' || reply=='Y'
            TrainingFunction(HumanFacesTrainDatabasePath,20);
        end
            runTest('currentHumanFaceTrainingData.mat',HumanFacesTestDatabasePath);
      
    otherwise
        disp('Wronge No');
        
end

       

        

        
