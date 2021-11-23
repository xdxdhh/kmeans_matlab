function [data] = get_data(filename, path, cols)
    data = import_csv(filename, path);
    data = data(:,cols);
end


function [data] = import_csv(filename,path)
    cd(path);
    data = readtable(filename);
end