clc,clear;

framesPath = 'Blur/';    
videoName = 'Blur.avi';                      
fps = 30;                                          
startFrame = 1;                                
endFrame = 66;                               
if(exist('videoName','file'))  
    delete videoName.avi            
end  
aviobj=VideoWriter(videoName);       
aviobj.FrameRate=fps;   
open(aviobj);                                  
                 
for  i=startFrame:endFrame    
        fileName=sprintf('%01d',i);       
        frames=imread([framesPath,fileName,'.jpg']);  
        writeVideo(aviobj,frames);  
end
close(aviobj);         

framesPath = 'Deconv/';    
videoName = 'Deconv.avi';                      
fps = 30;                                          
startFrame = 1;                                
endFrame = 66;                               
if(exist('videoName','file'))  
    delete videoName.avi            
end  
aviobj=VideoWriter(videoName);       
aviobj.FrameRate=fps;   
open(aviobj);                                  
                 
for  i=startFrame:endFrame    
        fileName=sprintf('%01d',i);       
        frames=imread([framesPath,fileName,'.jpg']);  
        writeVideo(aviobj,frames);  
end
close(aviobj);