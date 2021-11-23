function [] = iterate(obj)
    iteration_num = 1;
    while iteration_num <= obj.Iter_num
        one_step(obj, iteration_num);
        if obj.Centroids == obj.Previous_centroids % check stop condition = centroids are not changing
            break;
        end
    iteration_num = iteration_num + 1;  
    obj.Previous_centroids = obj.Centroids;
    end

    count_inertia(obj);

end