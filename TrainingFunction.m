               
function []=TrainingFunction (trainingPath,ipg)



TrainDatabasePath =trainingPath;
ImagesPerGroup=ipg;

TrainingData=[];
TotalImages=0;


AllFolderNames={};
for k=1:size(TrainDatabasePath,2)
    
    containts=dir(TrainDatabasePath{k});
    folders={};

    for i=3:size(containts,1)

            name=strcat(TrainDatabasePath{k},'\',containts(i).name);
            folders=vertcat(folders,name);

    end
    
    AllFolderNames=vertcat(AllFolderNames,folders);

    for i=1:size(folders,1 )

          files=dir( folders{i} );

             for j=3:size(files,1)
                 TrainImage =strcat(folders{i},'\',files(j).name)
                 waveletpara=waveletTrans(TrainImage);
                  TrainingData=[TrainingData ; waveletpara];
                  TotalImages=TotalImages+1;
             end

    end

end

Group=zeros(1,TotalImages);
for i=1:TotalImages
Group(i)=floor((i-1)/ImagesPerGroup)+1;
end

if ipg==20
    save('currentHumanFaceTrainingData.mat','TrainingData','Group','AllFolderNames' );

else 
    save('currentAvatarFaceTrainingData.mat','TrainingData','Group','AllFolderNames' );
end


