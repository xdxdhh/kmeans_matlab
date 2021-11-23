function [] = assign_to_cluster(obj)

    string_compare = strcmp('Centroid1', obj.Data.Properties.VariableNames);
    start_index = find(string_compare==1);
    last_col = (['Centroid',num2str(obj.Cluster_num)]);
    string_compare = strcmp(last_col, obj.Data.Properties.VariableNames);
    stop_index = find(string_compare==1);

    for j = 1:obj.N
        [~, idx] = min(obj.Data{j,start_index:stop_index});
        obj.Data.('Centroid_status')(j) = idx;
    end
end