function [matchpoint,match_num] = feature_match(feature1,feature2)
% this function returns all match feature pairs between two images (feature
% sets)
    match_num = 0;
    Row = size(feature1,1);
    numFeature = size(feature1,2);
    matchpoint_t = zeros(Row,4);
    T = 0.5;
    

    if ~(isempty(feature1) || isempty(feature2))
        for i = 1:size(feature1,1)
               close_1st = 10000;
               close_2nd = 10000;
               for j = 1:size(feature2,1)
                   f1 = feature1(i,3:numFeature);
                   f2 = feature2(j,3:numFeature);
                   d = sum(f1 ~= f2);

                   if (d < close_2nd)
                      close_2nd = d;
                   end
                   if (d < close_1st)   
                      close_2nd = close_1st;
                      close_1st = d;
                      mp = j;
                   end
               end

               
               if (close_1st/close_2nd) < T
                  if (feature1(i,1) == 0) && (feature1(i,2) == 0)
                      continue
                  else
                      match_num = match_num + 1;
                      matchpoint_t(match_num,1) = feature1(i,1);
                      matchpoint_t(match_num,2) = feature1(i,2);
                      matchpoint_t(match_num,3) = feature2(mp,1);
                      matchpoint_t(match_num,4) = feature2(mp,2);
                  end
               end
        end
    end


    
    if (match_num > 0)
       matchpoint = zeros(match_num,4);
       for i = 1:match_num
          matchpoint(i,1) = matchpoint_t(i,1);
          matchpoint(i,2) = matchpoint_t(i,2);
          matchpoint(i,3) = matchpoint_t(i,3);
          matchpoint(i,4) = matchpoint_t(i,4); 
       end       
    end
    
    if (match_num == 0) 
       matchpoint = [0 0 0 0];
    end