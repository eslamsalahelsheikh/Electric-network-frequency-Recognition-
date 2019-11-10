% ------------------------------ loading images in X matrix
% clear all; clc; %clear workspace and command window
% load('power_audio.mat');
%load('ex7faces.mat');   % last 5000 * 1024
X = training_data_features(:,1:end-1);  % A = 600000*42  >> A' = 42*600000
% X = X(:,1:1000);
fprintf('\n Size of X : %d * %d\n',size(X,1), size(X,2))
[nENFs, nFeatures] = size(X);
% ------------------------------ normalizing images (z score = (x - u)/SD)
mu = mean(X); 
sigma = std(X);
X = X - (ones(nENFs,1) * mu  );
X = X ./ (ones(nENFs,1) *sigma);
% ------------------------------ plotting sample of faces
%igure(1);
%subplot(1,2,1) % second subplot
%displayData(X(1:36,:)); % sample size = 36
% ------------------------------ 
%TEMP = X'*X;
covariance = (1/(nENFs-1))*((X')*(X));  %calculate the covariance matrix of X (mean of each column=0)

[U, S] = eig(covariance); %U = eigen vectors of covariance , S = eigen values of covariance (in diagonal matrix)
S = diag(S);         %get the eigen values from diagonal of S
%---- sort the variances in decreasing order
[dummy,new_indices] = sort(S,'descend');   
S = S(new_indices);     
U = U(:,new_indices);

%Visualize the top 36 eigenvectors found [the new basis]
%{
figure(2);
displayData(U(:, 1:36)');    %print sample of the principle components
%}
%------------------------------- 
% pick smallest value of K satisfying the requested (variance reatined)
prompt = '\nEnter the percentage of the variance to retain : ';   %% enter it 1
variance_retained = input(prompt);  %reading variance_retained value from User

for K=1:nFeatures
    VR = sum(S(1:K)) / sum(S);    %calculate the variance retained
    if(VR >= variance_retained)   break; end
end

fprintf('\nNumber of principal components retained = %d\n',K);
fprintf('\nCompression Ratio = %f\n',K/nFeatures); %%%
% ------------------------------ Project images R^1024 on R^k space 

Z = X * U(:, 1:K); %%% @ Zaafarany >> this is what we want 
Z=[Z training_data_features(:,end)];
% ------------------------------ recover images [to be able to visualize Z]
%X_recovered = Z * U(:, 1:K)';


%figure(1);
%subplot(1,2,2) % second subplot
%displayData(X_recovered(1:36,:));
%--------------------------------