function [] = scatter_plot_with_centroids(obj, current_iteration)
    f = figure('visible','off');
    f.Position = [100 100 740 600];
    
 

    if obj.Dimensions == 2
        %interaktivni vypocet limit grafu 
        % vezmu minimum a maximum v dane dimenzi, na obe strany pridam range / nejakym zlomkem
        max_x = max(obj.Data.(1));
        min_x = min(obj.Data.(1));
        range_x = max_x - min_x;
        max_y = max(obj.Data.(2));
        min_y = min(obj.Data.(2));
        range_y = max_y - min_y;
        x_lims = [min_x - range_x/length(obj.Data.(1)) max_x + range_x/length(obj.Data.(1))];
        y_lims = [min_y - range_y/length(obj.Data.(2)) max_y + range_y/length(obj.Data.(2))];
        
%{
 x_lims = [1 7];
        y_lims = [2 6]; 
%}

        plot_data = [obj.Data.(1) obj.Data.(2)]; 
        class_scatter_plot(obj, plot_data , obj.Data.Centroid_status, [x_lims; y_lims]);
        scatter(obj.Centroids(:,1), obj.Centroids(:,2), 350, 'LineWidth',10,'MarkerFaceColor', 'magenta', 'Marker', 'X');
   
    elseif obj.Dimensions == 3
        plot_data = [obj.Data.(1) obj.Data.(2) obj.Data.(3)];
        class_scatter_plot(obj, plot_data , obj.Data.Centroid_status, [[4 8]; [2 5]; [1 7]]);
        scatter3(obj.Centroids(:,1), obj.Centroids(:,2), obj.Centroids(:,3), 250, 'LineWidth',10, 'MarkerFaceColor', 'magenta', 'Marker', 'X');
    else
        error("Dimensions must be 2 or 3") 
    end

    label = (['Iteration ',num2str(current_iteration)]);
    text(.7,.9,label,'FontSize',30,'Units','normalized');

    obj.Animation_array(current_iteration) = getframe;
    hold off;
end