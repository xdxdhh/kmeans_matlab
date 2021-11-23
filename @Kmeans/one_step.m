function [] = one_step(obj, current_iteration)
    count_distances(obj);
    assign_to_cluster(obj);
    if obj.Plot_status == true
        scatter_plot_with_centroids(obj, current_iteration);
    end
    update_centroids(obj);
end