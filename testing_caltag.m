I = imread('test/test1.png');
%I = imrotate (I, 270); 
I =imread('SampleImages/IMG_0784.jpg');
[wPt_90,iPt_90] = caltag( I, 'test/output.mat', true);
figure, imshow(I), hold on, scatter(iPt_90(:,2), iPt_90(:,1), 'r')
coorx=find(wPt_90(:,1)>0); 
coory = find(wPt_90(:,2)>0);
cooridx = intersect(coorx, coory);
coor_adj = wPt_90(cooridx,:);
f=max(coor_adj);
coor = (coor_adj(:,1)-1)*f(1)+(coor_adj(:,2));
coor_ipt = iPt_90(cooridx,:); 
text(coor_ipt(:,2)-15,coor_ipt(:,1)-15,cellfun(@num2str, num2cell(coor), 'UniformOutput', false),'Color','blue','FontSize',14)