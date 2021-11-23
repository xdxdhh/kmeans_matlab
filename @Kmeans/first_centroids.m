function [] = first_centroids(obj)
    columns = 1:obj.Dimensions;
    for i = 1:obj.Cluster_num 
        rand = randi([1 obj.N],1); %check if this centroid already exists:
        while nnz(ismember(obj.Centroids, [obj.Data{rand,columns}], 'rows')) == 1 
            rand = randi([1 obj.N],1);
        end
        obj.Data.('Centroid_status')(rand) = i;
        col_name = (['Centroid',num2str(i)]);
        obj.Data.(col_name)(rand) = 1;
        obj.Centroids(i,:) = [obj.Data{rand, columns}];
        obj.Previous_centroids = obj.Centroids;
    end
end 