 
close all 
clear
clc
tic()
%% ENF Extraction
% % % % this imports and splits training data ,, run only once ,, this section
% % % % takes about 8 minutes at frequency resolution of 2^16 ,, or you can just
% % % % leave it commented
% % 
% % addpath(genpath('C:\Users\hp\Desktop\ENF\data'))
% % [~,~,~,~,~,~,~,~,~,ENF_A,ENF_B,ENF_C,ENF_D,ENF_E,ENF_F,ENF_G,ENF_H,ENF_I,~,Practice_ENF,~,Testing_ENF,~] = load_data();
 
%% Data Importing
%-------------------------
% load('state.mat')
% load('state_5_sec.mat')
% load('state_10_sec.mat')
% load('state_10_sec_overlap.mat')

% load('state_1min_example.mat')
load('state1.mat')
% load('state2.mat')

%% ENF Manipulation
% ENF_A = singleENF_to_meanENf(ENF_A);
% ENF_B = singleENF_to_meanENf(ENF_B);
% ENF_C = singleENF_to_meanENf(ENF_C);
% ENF_D = singleENF_to_meanENf(ENF_D);
% ENF_E = singleENF_to_meanENf(ENF_E);
% ENF_F = singleENF_to_meanENf(ENF_F);
% ENF_G = singleENF_to_meanENf(ENF_G);
% ENF_H = singleENF_to_meanENf(ENF_H);
% ENF_I = singleENF_to_meanENf(ENF_I);
% ENF_A = Regular(ENF_A);
% ENF_B = Regular(ENF_B);
% ENF_C = Regular(ENF_C);
% ENF_D = Regular(ENF_D);
% ENF_E = Regular(ENF_E);
% ENF_F = Regular(ENF_F);
% ENF_G = Regular(ENF_G);
% ENF_H = Regular(ENF_H);
% ENF_I = Regular(ENF_I);
%% Features Extract
% -------------------

f_A=feature_extract(ENF_A);
f_B=feature_extract(ENF_B);
f_C=feature_extract(ENF_C);
f_D=feature_extract(ENF_D);
f_E=feature_extract(ENF_E);
f_F=feature_extract(ENF_F);
f_G=feature_extract(ENF_G);
f_H=feature_extract(ENF_H);
f_I=feature_extract(ENF_I);
Practice_features=feature_extract(Practice_ENF);
Testing_features=feature_extract(Testing_ENF);
 
 
%% normalize features :
%----------------------
 
 [F_A,F_B,F_C,F_D,F_E,F_F,F_G,F_H,F_I,Practice_features,Testing_features,mu,maxima] = Normalize_features(f_A,f_B,f_C,f_D,f_E,f_F,f_G,f_H,f_I,Practice_features,Testing_features);
% [F_A,F_B,F_C,F_D,F_E,F_F,F_G,F_H,F_I,Practice_features,Testing_features,mu,maxima] = Normalize_features_2(f_A,f_B,f_C,f_D,f_E,f_F,f_G,f_H,f_I,Practice_features,Testing_features);
 
 
%% visualizing
 
ENF_A_transpose=ENF_A';ENF_B_transpose=ENF_B';ENF_C_transpose=ENF_C';ENF_D_transpose=ENF_D';ENF_E_transpose=ENF_E';
ENF_F_transpose=ENF_F';ENF_G_transpose=ENF_G';ENF_H_transpose=ENF_H';ENF_I_transpose=ENF_I';
ENF_Practice_tranpose=Practice_ENF';ENF_Testing_tranpose=Testing_ENF';
% figure;subplot(9,1,1);plot(ENF_A_transpose(:));title('Grid_A ENF');
% subplot(9,1,2);plot(ENF_B_transpose(:));title('Grid_B ENF');
% subplot(9,1,3);plot(ENF_C_transpose(:));title('Grid_C ENF');
% subplot(9,1,4);plot(ENF_D_transpose(:));title('Grid_D ENF');
% subplot(9,1,5);plot(ENF_E_transpose(:));title('Grid_E ENF');
% subplot(9,1,6);plot(ENF_F_transpose(:));title('Grid_F ENF');
% subplot(9,1,7);plot(ENF_G_transpose(:));title('Grid_G ENF');
% subplot(9,1,8);plot(ENF_H_transpose(:));title('Grid_H ENF');
% subplot(9,1,9);plot(ENF_I_transpose(:));title('Grid_I ENF');
% figure;plot(ENF_Practice_tranpose(:));title('Practice data ENF');
% figure;plot(ENF_Testing_tranpose(:));title('Testing data ENF');
% plot_rows(Practice_ENF);
% plot_rows(Testing_ENF);


%% feature_extract(ENF_A_transpose)
figure;
hold on;plot(mean(F_A));
hold on;plot(mean(F_B));
hold on;plot(mean(F_C));
hold on;plot(mean(F_D));
hold on;plot(mean(F_E));
hold on;plot(mean(F_F));
hold on;plot(mean(F_G));
hold on;plot(mean(F_H));
hold on;plot(mean(F_I));

%plot_rows(Practice_data_features);
%% Export


F_A = [F_A ones(size(F_A,1),1)];
F_B = [F_B 2*ones(size(F_B,1),1)];
F_C = [F_C 3*ones(size(F_C,1),1)];
F_D = [F_D 4*ones(size(F_D,1),1)];
F_E = [F_E 5*ones(size(F_E,1),1)];
F_F = [F_F 6*ones(size(F_F,1),1)];
F_G = [F_G 7*ones(size(F_G,1),1)];
F_H = [F_H 8*ones(size(F_H,1),1)];
F_I = [F_I 9*ones(size(F_I,1),1)];


number_of_features=size(F_A,2)-1;
training_data_features = [F_A;F_B;F_C;F_D;F_E;F_F;F_G;F_H;F_I];
training_features=training_data_features(:,1:number_of_features) ;
training_data_classes=training_data_features(:,number_of_features+1) ;
Practice_data_features =  Practice_features;
ENF=[ENF_A;ENF_B;ENF_C;ENF_D;ENF_E;ENF_F;ENF_G;ENF_H;ENF_I];
 
save('data_features.mat','training_features','training_data_classes','Practice_data_features','Testing_features');
save('data_ENF.mat','ENF','Practice_ENF','Testing_ENF');
save('all_data.mat')
 
%% Create model
 
load('data_features.mat','training_features','training_data_classes','Practice_data_features','Testing_features');
load('data_ENF.mat','ENF','Practice_ENF','Testing_ENF');
 
%% import data for comparison 
 
 
%% split , get features and normalize for new data
 
% just an example how to apply to test data:
%-----------------------------------------------
% [test_x,Fs] = audioread('test_x.wav');
% test_x=calc_dominant(test_x,Fs);
% test_x=feature_extract(test_x);
% 
% test_x=(test_x - mu).* (100 ./ maxima);
%%  apply to model: result and confidence ratio
 
 
%% parameters tuning and prediction 
 
% [nNeronsL1,alpha,weightPenalty,dropoutFraction,Number_of_sweeps,nn]=parametersTuning();
% % nnpredict(nn, b,0.4);
% % Test_ENF_similarity(k,nn , 0.4 , mu,maxima)
% clc
% [er,~] = trainNN(nNeronsL1,alpha,0,dropoutFraction,Number_of_sweeps);
% 
toc

[trainedClassifier, validationAccuracy] = linearClassifier(training_data_features)
%  [trainedClassifier, validationAccuracy] = baggClassifier(training_data_features)