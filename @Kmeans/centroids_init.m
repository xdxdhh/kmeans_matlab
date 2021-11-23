function [] = centroids_init(obj)
    obj.Data.Centroid_status = zeros(obj.N,1);
    for i = 1:obj.Cluster_num
        label = (['Centroid',num2str(i)]);
        obj.Data.(label) = zeros(obj.N,1);
    end
end