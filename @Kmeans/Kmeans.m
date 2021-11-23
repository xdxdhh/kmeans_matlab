classdef Kmeans < handle
    properties (Access = private)
        %user defined properties:
        Data
        Cluster_num {mustBeNumeric}
        Iter_num {mustBeNumeric}
        %helpful properties
        Dimensions
        Plot_status
        Animation_array = struct('cdata',[],'colormap',[]); %pridat dopredu jeji rozmery
        N
        Centroids
        Previous_centroids
        Colors = ["white",  "red", "blue", "yellow", "green", "#FF8D85", "#B8B8B8", "#96C3EB", "#6ACCBC", "cyan", "#FF9933","magenta"];
        Inertia
    end
    methods (Access = private)

        function [] = display_attrs(obj)
            disp("Number of Clusters: " )
            disp(obj.Cluster_num)
            disp("Number of Iterations : " )
            disp(obj.Iter_num)
            disp("Data dimensions: " )
            disp(size(obj.Data));
        end
        
    
        centroids_init(obj);
        first_centroids(obj);
        count_distances(obj);
        update_centroids(obj);
        assign_to_cluster(obj); 
        scatter_plot_with_centroids(obj, iteration_num);

        one_step(obj, iteration_num);
        iterate(obj);
        inertia = count_inertia(obj);

        function [] = show_data_table(obj)
            disp(obj.Data);
        end
    end

    methods (Access = public)
        function obj = Kmeans(data, cluster_num, iter_num)
            obj.Cluster_num = cluster_num;
            obj.Iter_num = iter_num;
            obj.Data = data;
            obj.Dimensions = size(data,2);
            obj.N = size(data,1);
            obj.Centroids = zeros(obj.Cluster_num, obj.Dimensions);
            obj.Previous_centroids = obj.Centroids;
            obj.Inertia = inf;

        end
        [Result_classes, inertia] = train(obj, max_iter, plot);
    end
end