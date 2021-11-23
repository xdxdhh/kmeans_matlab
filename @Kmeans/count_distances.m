function [data] = count_distances(obj) 
    columns = 1:obj.Dimensions;
    for i = 1:obj.Cluster_num % iterate all types of centroids
        for j = 1:obj.N % j iteruje pres radKy
            row_vector = [obj.Data{j,columns}];
            col_name = (['Centroid',num2str(i)]);
            obj.Data.(col_name)(j) = norm(row_vector-obj.Centroids(i,:));
        end
    end
end