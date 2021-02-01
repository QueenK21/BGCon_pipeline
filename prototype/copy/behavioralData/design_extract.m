%scene, face localizing 

load('data_FS_scan1.mat'); dMat1 = designMat; 
load('data_FS_scan2.mat'); dMat2 = designMat; 
n1 = length(dMat1); n2 = length(dMat2); 

face_row = 0; scene_row = 0; 
for i = 1:n1
    if dMat1(2, i) == 1 %face block 
        if dMat1(3, i) == 0 %no repetition (remove catch trial) 
            face_row = face_row + 1; 
            face_sc1(face_row, 1) = dMat1(5, i); 
            face_sc1(face_row, 2) = 0.5; 
            face_sc1(face_row, 3) = 1; 
        end
    else %scene block 
        if dMat1(3, i) == 0 %no repetition (remove catch trial) 
            scene_row = scene_row + 1; 
            scene_sc1(scene_row, 1) = dMat1(5, i); 
            scene_sc1(scene_row, 2) = 0.5; 
            scene_sc1(scene_row, 3) = 1; 
        end
    end 
end
face_row = 0; scene_row = 0; 
for i = 1:n2
    if dMat2(2, i) == 1 %face block 
        if dMat2(3, i) == 0 %no repetition (remove catch trial) 
            face_row = face_row + 1; 
            face_sc2(face_row, 1) = dMat2(5, i); 
            face_sc2(face_row, 2) = 0.5; 
            face_sc2(face_row, 3) = 1; 
        end
    else %scene block 
        if dMat2(3, i) == 0 %no repetition (remove catch trial) 
            scene_row = scene_row + 1; 
            scene_sc2(scene_row, 1) = dMat2(5, i); 
            scene_sc2(scene_row, 2) = 0.5; 
            scene_sc2(scene_row, 3) = 1; 
        end
    end 
end
 
if not(isfolder('../design/FS/run1'))
    mkdir('../design/FS/run1')
end
if not(isfolder('../design/FS/run2'))
    mkdir('../design/FS/run2')
end
save('face.txt', 'face_sc1', '-ascii', '-double', '-tabs');
save('scene.txt', 'scene_sc1', '-ascii', '-double', '-tabs');
movefile face.txt ../design/FS/run1; movefile scene.txt ../design/FS/run1; 
save('face.txt', 'face_sc2', '-ascii', '-double', '-tabs');
save('scene.txt', 'scene_sc2', '-ascii', '-double', '-tabs');
movefile face.txt ../design/FS/run2; movefile scene.txt ../design/FS/run2; 

