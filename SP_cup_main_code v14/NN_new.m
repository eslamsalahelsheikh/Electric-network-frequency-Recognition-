%% ========================================================================
clc;clear;close all;
error=[];
 b=100:50:500;
for j=b
    addpath('NN');
addpath('util');
load('data_features.mat')
display('training ...');
rng('default');  % For reproducibility

n = size(training_features,2);                          %we used only the first 15 features
m = size(training_features,1);   %number of training examples

train_y = zeros(m,9);
for i=1:m
   train_y(i,training_data_classes(i)) = 1;
end
train_x = training_features(:,1:n);
test_x = Practice_data_features(:,1:n);

%shuffling
permRows = randperm(size(train_x,1));
train_x = train_x(permRows,:);
train_y = train_y(permRows,:);
training_data_classes = training_data_classes(permRows);
%% ========================================================================
rng('default');  % For reproducibility

nn = nnsetup([n 500 9]);
    
nn.activation_function              = 'tanh_opt';   %  Activation functions of hidden layers: 'sigm' (sigmoid) or 'tanh_opt' (optimal tanh).
nn.learningRate                     = 0.08;            %  learning rate Note: typically needs to be lower when using 'sigm' activation function and non-normalized inputs.
nn.momentum                         = 0.5;          %  Momentum
nn.scaling_learningRate             = 1;            %  Scaling factor for the learning rate (each epoch)
nn.weightPenaltyL2                  = 0.03;            %  L2 regularization
nn.nonSparsityPenalty               = 0;            %  Non sparsity penalty
nn.sparsityTarget                   = 0.05;         %  Sparsity target
nn.inputZeroMaskedFraction          = 0;            %  Used for Denoising AutoEncoders
nn.dropoutFraction                  = 0;            %  Dropout level (http://www.cs.toronto.edu/~hinton/absps/dropout.pdf)
nn.testing                          = 0;            %  Internal variable. nntest sets this to one.
nn.output                           = 'sigm';   

opts.numepochs =  j;   %  Number of full sweeps through data
opts.batchsize = m;      %  Take a mean gradient step over this many samples

%% ========================================================================
% training
rng('default');  % For reproducibility

[nn, L] = nntrain(nn, train_x, train_y, opts);
labels = nnpredict(nn, train_x);
bad = find(labels ~= training_data_classes);
er = length(bad)/length(training_data_classes);
display(er);

for i=1:9
    classEr(i) = sum(training_data_classes(bad) ==i);
    badModeLabels(i) = mode(labels(training_data_classes(bad) ==i));
end

% plot(classEr,'')
%hold on;
%plot(1:9,badModeLabels,'ro')
gridsNames = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I'];
labels = nnpredict(nn, test_x);
gridsNames(labels);
error=[error er];
end
figure;plot(b,error);grid on;grid minor;
