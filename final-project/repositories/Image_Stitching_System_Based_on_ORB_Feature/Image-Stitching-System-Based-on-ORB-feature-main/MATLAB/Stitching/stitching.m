function imgr=stitching(imgs,stiching_matrix)
    imgNum=size(imgs,2);
    imgOffset=zeros(1,2,imgNum); % record offset in imgr for every img
    hasOffset=zeros(1,imgNum);   % record if the offset of one img is determined
    hasOffset(1)=1;
    % for all img(row of stiching_matrix), determine the offset of its neighbor
    % Skip if the neighbor has already been determined.
    
    while(~isempty(find((hasOffset==0),1)))
        for imgId=1:imgNum
            if(~hasOffset(imgId))
                continue;
            end
            neighbors=stiching_matrix(imgId,:);
            ind=1;
            while ind<size(neighbors,2)
                neighborId=neighbors(ind);
                nx=neighbors(ind+1);
                ny=neighbors(ind+2);
                if neighborId==0 
                    break; 
                end
                if(hasOffset(neighborId)==1)
                    ind=ind+3;
                    continue;
                end
                imgOffset(1,1,neighborId)=imgOffset(1,1,imgId)+nx;
                imgOffset(1,2,neighborId)=imgOffset(1,2,imgId)+ny;

                hasOffset(neighbors(ind))=1;
                ind=ind+3;
            end
        end
    end
    
    % Calculate the true offset by setting minimum offset to 1
    imgOffset(:,1,:)=imgOffset(:,1,:)-min(imgOffset(:,1,:))+1;
    imgOffset(:,2,:)=imgOffset(:,2,:)-min(imgOffset(:,2,:))+1;

    %Calculate the size of imgr
    [H W s]=size(imgs{1});
    RH=max(imgOffset(:,1,:))+H;
    RW=max(imgOffset(:,2,:))+W;

    imgr=zeros(RH,RW,s);
    
    
    x=1:H;
    y=1:W;
    
    
    for i=1:imgNum
        ori=imgs{i};
        dx=imgOffset(1,1,i);
        dy=imgOffset(1,2,i);
        
        newPatch=zeros(RH,RW,3);
        newPatch(x+dx,y+dy,:)=double(ori(x,y,:));
                
        addNew=((imgr==0) & (newPatch~=0));
        addPatch=((imgr~=0) & (newPatch~=0));
        
        oriWeight=zeros(RH,RW,3);
        patchWeight=zeros(RH,RW,3);
        [r c v]=find(addPatch(:,:,1)~=0);
        [rn cn vn]=find(addNew(:,:,1)~=0);
        if(~isempty(r) && ~isempty(c))
            ps=min(c);
            pw=max(c)-ps;
            psn=min(cn);
            lw=0;
            if(ps<psn) 
                lw=1-lw;
            end
            oriWeight(1:RH,ps:ps+pw,:)=repmat(linspace(lw,1-lw,pw+1),[RH,1,3]);
            patchWeight=1-oriWeight;
        end
        imgr(addNew)=newPatch(addNew);

        if(~isempty(imgr(addPatch)))
             imgr(addPatch)=...
             imgr(addPatch).*oriWeight(addPatch)+newPatch(addPatch).*patchWeight(addPatch);
        end
    end
    

    figure
    imshow(uint8(imgr));
end