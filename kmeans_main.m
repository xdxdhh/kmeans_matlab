function [] = kmeans_main()

    data = get_data('Iris.csv', '/home/xdxdhh/skola/MPT/k_means', [2,3]);

    cd('/home/xdxdhh/skola/MPT/k_means/k_means_class_version')

    k_means = Kmeans(data, 3, 5); %data, pocet clusteru, pocet iteraci

    [res, inertia] = k_means.train(3, false); %pocet pokusu pro vyber nejlepsiho, true/false obrazek

    disp(res);
    disp("inertia:");
    disp(inertia);
end