function [] = class_scatter_plot(obj, xyz, classes_col, lims)
    %lims ve formatu [[1 2]; [3 4]]
    classes = unique(classes_col);
    if size(xyz, 2) == 3
        x =  xyz(:,1);
        y =  xyz(:,2);
        z =  xyz(:,3);
        for i = 1:length(classes)
            scatter3(x(ismember(classes_col, classes(i))), y(ismember(classes_col, classes(i))),z(ismember(classes_col, classes(i))), 150, 'MarkerFaceColor',obj.Colors(classes(i)+1));
            xlim(lims(1,:));
            ylim(lims(2,:));
            zlim(lims(3,:));
            drawnow
            hold on;
        end
    elseif size(xyz, 2) == 2
        x =  xyz(:,1);
        y =  xyz(:,2);
        for i = 1:length(classes)
            scatter(x(ismember(classes_col, classes(i))), y(ismember(classes_col, classes(i))), 150, 'MarkerFaceColor',obj.Colors(classes(i)+1));
            
%{
 xlim(lims(1,:));
            disp("lim:");
            disp(lims(1,:))
            ylim(lims(2,:)); 
%}
            xlim auto
            ylim auto
            hold on;
        end
    else
        error("Class scatter plot only supports 2D and 3D inputs.");
    end
end


