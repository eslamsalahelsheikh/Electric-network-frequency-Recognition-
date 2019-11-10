function [ y ] = singleENF_to_meanENf( x )

% This function takes input x has 30 single ENFs of the same grid
% each ENF in a row,
% and generates output y has 10 mean ENFs each in a row

x = x(1:30,:);

%% Step = 1
y(1,:) = mean(x(1:10,:));
y(2,:) = mean(x(11:20,:));
y(3,:) = mean(x(21:30,:));

%% Step = 2
y(4,:) = mean(x(1:2:20,:));
y(5,:) = mean(x(2:2:20,:));
y(6,:) = mean(x(11:2:30,:));
y(7,:) = mean(x(12:2:30,:));

%% Step = 3
y(8,:) = mean(x(1:3:30,:));
y(9,:) = mean(x(2:3:30,:));
y(10,:) = mean(x(3:3:30,:));

end

