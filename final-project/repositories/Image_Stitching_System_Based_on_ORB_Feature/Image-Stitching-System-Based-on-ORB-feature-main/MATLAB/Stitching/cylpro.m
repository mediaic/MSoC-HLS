% parameters:
% f: focal length

function T1=cylpro(img,f,display)
    if nargin < 3
       display = -1;
    end
    
    fprintf('Project image\n')
    [H,W,r]=size(img); 
    xc=H/2;
    yc=W/2; 

    for y=1:W
        angle=atan((y-yc)/f);
        y1=uint16(f*angle+yc-20); 
        if  y1==0  y1=1;   end 
        for x=1:H        
            tanx=(x-xc)/((y-yc)^2+f^2)^0.5;
            x1=uint16(f*tanx+xc); 
            if  x1==0  x1=1;  end 
            T1(x1,y1,:)=img(x,y,:);
        end
    end 

    %if display>0
    %    imshow(T1);
    %end
end