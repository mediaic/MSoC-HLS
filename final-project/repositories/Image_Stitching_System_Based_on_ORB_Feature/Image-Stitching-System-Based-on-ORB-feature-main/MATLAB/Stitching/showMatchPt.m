 for i = 1:size(filenames,2)
    for j = 1: size(filenames,2)
        if (j>i)
            match_point_matrix = feature_match_matrix{i,j};
            img1 = imgs{i}; img1 = rgb2gray(img1);
            img2 = imgs{j}; img2 = rgb2gray(img2);
            matchpt1 = [match_point_matrix(:,2), match_point_matrix(:,1)];  % col-major for display
            matchpt2 = [match_point_matrix(:,4), match_point_matrix(:,3)];  % col-major for display
            
            figure
            subplot(1,2,1)
            imshow(img1); hold on;
            andemande = plot(matchpt1(:,1), matchpt1(:,2), 'g+');
            set(andemande,'LineWidth',2);
            title(['img ',num2str(i)]);
            subplot(1,2,2)
            imshow(img2); hold on;
            andemande = plot(matchpt2(:,1), matchpt2(:,2), 'g+');
            set(andemande,'LineWidth',2);
            title(['img ',num2str(j)]);
        end      
    end
 end