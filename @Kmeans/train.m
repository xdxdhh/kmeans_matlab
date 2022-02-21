function [Result_classes, inertia] = train(obj, max_iter, plot)
    if ~exist('plot', 'var')
        obj.Plot_status = false;
    elseif plot == true || plot == false
        obj.Plot_status = plot;
    else
        error("plot parameter should be true/false")
    end


    for i=1:max_iter
        obj.Data = obj.Data(:,1:obj.Dimensions);
        clear obj.Animation_array;
        clear Centroids;
        clear Previous_centroids; 
        centroids_init(obj);
        first_centroids(obj);
        iterate(obj);
        if count_inertia(obj) <= obj.Inertia
            obj.Inertia = count_inertia(obj);
            Result_classes = obj.Data{:,obj.Dimensions+1}; %store only column of classes
            Result_graph = obj.Animation_array;
        end
    end


    if obj.Plot_status == true
        f = figure('Name','K Means Algorithm', 'NumberTitle','off');
        f.Position = [100 100 740 600];
        [t,~] = title('K means algorithm');
        t.FontSize = 40;
        t.FontWeight = 'bold';
        movie(Result_graph,5,1)
    end 

    inertia = obj.Inertia;
end