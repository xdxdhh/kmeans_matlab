function [inertia] = count_inertia(obj)
    inertia = 0;
    for j = 1:obj.N %podivej se na kazdy radek
        cluster = obj.Data.('Centroid_status')(j); %get belonging cluster
        col = ['Centroid',num2str(cluster)];
        inertia = inertia + (obj.Data.(col)(j))^2;
    end
    %obj.Inertia = inertia;
end