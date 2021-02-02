function stitching_matrix = RANSAC(feature_match_matrix,stitching_matrix)
    data=[1,4,7];
    for i = 1:size(feature_match_matrix,1)
        for j = data
           if (stitching_matrix(i,j) ~= 0 ) 
              matchpoint = feature_match_matrix{i,stitching_matrix(i,j)};
              fit_x = 0; 
              fit_y = 0;
              max_agree = 0;
              for k = 1:size(matchpoint,1)
                 tx = matchpoint(k,1)-matchpoint(k,3);
                 ty = matchpoint(k,2)-matchpoint(k,4);
                 agree = 0;
                 for l = 1 : size(matchpoint,1)
                    if (((matchpoint(l,3) + tx - matchpoint(l,1))^2 + (matchpoint(l,4) + ty-matchpoint(l,2))^2) < 1)
                       agree = agree + 1;
                    end
                 end
                 if (agree > max_agree)
                    max_agree = agree;
                    fit_x = tx; 
                    fit_y = ty;            
                 end      
              end
              if ( stitching_matrix(i,j) > i)                     
                 stitching_matrix(i,j+1) = fit_x;
                 stitching_matrix(i,j+2) = fit_y;
                 if (j==1)
                    stitching_matrix(i,10) = max_agree;
                 elseif (j==4)
                    stitching_matrix(i,11) = max_agree;
                 elseif (j==7)
                    stitching_matrix(i,12) = max_agree;                    
                 end
              else
                 stitching_matrix(i,j+1) = -fit_x;
                 stitching_matrix(i,j+2) = -fit_y;
                 if (j==1)
                    stitching_matrix(i,10) = max_agree;
                 elseif (j==4)
                    stitching_matrix(i,11) = max_agree;
                 elseif (j==7)
                    stitching_matrix(i,12) = max_agree;                    
                 end                
              end
           end           
        end        
        if (stitching_matrix(i,10) == 1 && stitching_matrix(i,12) > 1 )
           stitching_matrix(i,1) = stitching_matrix(i,7);
           stitching_matrix(i,2) = stitching_matrix(i,8);
           stitching_matrix(i,3) = stitching_matrix(i,9);
           stitching_matrix(i,10) = stitching_matrix(i,12);
        elseif (stitching_matrix(i,11) == 1 && stitching_matrix(i,12) > 1 )
           stitching_matrix(i,4) = stitching_matrix(i,7);
           stitching_matrix(i,5) = stitching_matrix(i,8);
           stitching_matrix(i,6) = stitching_matrix(i,9);
           stitching_matrix(i,11) = stitching_matrix(i,12);
        end
        if (stitching_matrix(i,10) == 1)    
           stitching_matrix(i,1) = 0;
           stitching_matrix(i,2) = 0;
           stitching_matrix(i,3) = 0;
        end
        if (stitching_matrix(i,11) == 1)    
           stitching_matrix(i,4) = 0;
           stitching_matrix(i,5) = 0;
           stitching_matrix(i,6) = 0;
        end        
    end
    temp = zeros(size(feature_match_matrix,1),6);
    for i = 1:size(feature_match_matrix,1)
        for j = 1:6
           temp(i,j) = stitching_matrix(i,j);           
        end
    end
    stitching_matrix = temp;
    
end