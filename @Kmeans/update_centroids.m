function [] = update_centroids(obj)
    for i = 1:obj.Cluster_num
        sums = zeros(1,obj.Dimensions); 
        count = 0;
        for j = 1:obj.N
            if obj.Data.('Centroid_status')(j) == i
                for k = 1:length(sums)
                    sums(k) = sums(k) + obj.Data{j,k};
                end
            count = count + 1;
            end
        end
        obj.Centroids(i,:) = sums/count;
    end
end