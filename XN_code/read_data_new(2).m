function [z1, z2] =  read_data_new(filename)
    the_file = fopen([filename, '_I.txt']);
    C = textscan(the_file,'%f ');
    I = C{1};
    fclose(the_file);
    the_file = fopen([filename, '_Q.txt']);
    C = textscan(the_file,'%f ');
    Q = C{1};
    fclose(the_file);
    if length(I) ~= length(Q)
        min_len = min(length(I), length(Q));
        I = I(1:min_len);
        Q = Q(1:min_len);
    end
    z = complex(I,Q);
    clear I Q;
 
    devices = 3; % number of receivers
    samples = 500; %number of samples per cycle
    l = floor(length(z) / devices);
    z1 = zeros(1,l);
    z2 = zeros(1,l);
    %z3 = zeros(1,l);
    index = 1;
    for i = 1 : samples : l
        z1(i:i+samples-1) = z(index:index+samples-1);
        index = index + samples;
        z2(i:i+samples-1) = z(index:index+samples-1);
        index = index + samples;
%         z3(i:i+samples-1) = z(index:index+samples-1);
%         index = index + samples;
    end
end