function [F_A,F_B,F_C,F_D,F_E,F_F,F_G,F_H,F_I,ENF_A,ENF_B,ENF_C,ENF_D,ENF_E,ENF_F,ENF_G,ENF_H,ENF_I,Practice_features,Practice_ENF,Testing_features,Testing_ENF,number_of_features] = load_data()

% this function imports dataset , get dominant frequencies of segments and
% get features .... it is applied for every single example separately
% because they might be of unequal lengths, which is the case for our data
% set
% it returns a matrix of features for every class; each of the matrices has
% row vectors of features ; and every row is for an example

% it is assumed that sounds have same fs
% ==========================================


display('preprocessing data ...');
[A_1,number_of_features,ENF_A_1,Fs] = preprocess('Train_Grid_A_P1.wav');
[A_2,~,ENF_A_2,~] = preprocess('Train_Grid_A_P2.wav');
[A_3,~,ENF_A_3,~] = preprocess('Train_Grid_A_P3.wav');
[A_4,~,ENF_A_4,~] = preprocess('Train_Grid_A_P4.wav');
[A_5,~,ENF_A_5,~] = preprocess('Train_Grid_A_P5.wav');
[A_6,~,ENF_A_6,~] = preprocess('Train_Grid_A_P6.wav');
[A_7,~,ENF_A_7,~] = preprocess('Train_Grid_A_P7.wav');
[A_8,~,ENF_A_8,~] = preprocess('Train_Grid_A_P8.wav');
[A_9,~,ENF_A_9,~] = preprocess('Train_Grid_A_P9.wav');
[A_10,~,ENF_A_10,~] = preprocess('Train_Grid_A_A1.wav');
[A_11,~,ENF_A_11,~] = preprocess('Train_Grid_A_A2.wav');

display('---------------------');
display('grid A done :)');
display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);display([['Remaining Time about : ' num2str(round((8+2.7)*0.8*(toc/60)))] ' minutes']);

[B_1,~,ENF_B_1,~] = preprocess('Train_Grid_B_P1.wav');
[B_2,~,ENF_B_2,~] = preprocess('Train_Grid_B_P2.wav');
[B_3,~,ENF_B_3,~] = preprocess('Train_Grid_B_P3.wav');
[B_4,~,ENF_B_4,~] = preprocess('Train_Grid_B_P4.wav');
[B_5,~,ENF_B_5,~] = preprocess('Train_Grid_B_P5.wav');
[B_6,~,ENF_B_6,~] = preprocess('Train_Grid_B_P6.wav');
[B_7,~,ENF_B_7,~] = preprocess('Train_Grid_B_P7.wav');
[B_8,~,ENF_B_8,~] = preprocess('Train_Grid_B_P8.wav');
[B_9,~,ENF_B_9,~] = preprocess('Train_Grid_B_P9.wav');
[B_10,~,ENF_B_10,~] = preprocess('Train_Grid_B_P10.wav');
[B_11,~,ENF_B_11,~] = preprocess('Train_Grid_B_A1.wav');
[B_12,~,ENF_B_12,~] = preprocess('Train_Grid_B_A2.wav');

display('---------------------');
display('grid B done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[C_1,~,ENF_C_1,~] = preprocess('Train_Grid_A_P1.wav');
[C_2,~,ENF_C_2,~] = preprocess('Train_Grid_C_P2.wav');
[C_3,~,ENF_C_3,~] = preprocess('Train_Grid_C_P3.wav');
[C_4,~,ENF_C_4,~] = preprocess('Train_Grid_C_P4.wav');
[C_5,~,ENF_C_5,~] = preprocess('Train_Grid_C_P5.wav');
[C_6,~,ENF_C_6,~] = preprocess('Train_Grid_C_P6.wav');
[C_7,~,ENF_C_7,~] = preprocess('Train_Grid_C_P7.wav');
[C_8,~,ENF_C_8,~] = preprocess('Train_Grid_C_P8.wav');
[C_9,~,ENF_C_9,~] = preprocess('Train_Grid_C_P9.wav');
[C_10,~,ENF_C_10,~] = preprocess('Train_Grid_C_P10.wav');
[C_11,~,ENF_C_11,~] = preprocess('Train_Grid_C_P11.wav');
[C_12,~,ENF_C_12,~] = preprocess('Train_Grid_C_A1.wav');
[C_13,~,ENF_C_13,~] = preprocess('Train_Grid_C_A2.wav');

display('---------------------');
display('grid C done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[D_1,~,ENF_D_1,~] = preprocess('Train_Grid_D_P1.wav');
[D_2,~,ENF_D_2,~] = preprocess('Train_Grid_D_P2.wav');
[D_3,~,ENF_D_3,~] = preprocess('Train_Grid_D_P3.wav');
[D_4,~,ENF_D_4,~] = preprocess('Train_Grid_D_P4.wav');
[D_5,~,ENF_D_5,~] = preprocess('Train_Grid_D_P5.wav');
[D_6,~,ENF_D_6,~] = preprocess('Train_Grid_D_P6.wav');
[D_7,~,ENF_D_7,~] = preprocess('Train_Grid_D_P7.wav');
[D_8,~,ENF_D_8,~] = preprocess('Train_Grid_D_P8.wav');
[D_9,~,ENF_D_9,~] = preprocess('Train_Grid_D_P9.wav');
[D_10,~,ENF_D_10,~] = preprocess('Train_Grid_D_P10.wav');
[D_11,~,ENF_D_11,~] = preprocess('Train_Grid_D_P11.wav');
[D_12,~,ENF_D_12,~] = preprocess('Train_Grid_D_A1.wav');
[D_13,~,ENF_D_13,~] = preprocess('Train_Grid_D_A2.wav');

display('---------------------');
display('grid D done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);
[E_1,~,ENF_E_1,~] = preprocess('Train_Grid_E_P1.wav');
[E_2,~,ENF_E_2,~] = preprocess('Train_Grid_E_P2.wav');
[E_3,~,ENF_E_3,~] = preprocess('Train_Grid_E_P3.wav');
[E_4,~,ENF_E_4,~] = preprocess('Train_Grid_E_P4.wav');
[E_5,~,ENF_E_5,~] = preprocess('Train_Grid_E_P5.wav');
[E_6,~,ENF_E_6,~] = preprocess('Train_Grid_E_P6.wav');
[E_7,~,ENF_E_7,~] = preprocess('Train_Grid_E_P7.wav');
[E_8,~,ENF_E_8,~] = preprocess('Train_Grid_E_P8.wav');
[E_9,~,ENF_E_9,~] = preprocess('Train_Grid_E_P9.wav');
[E_10,~,ENF_E_10,~] = preprocess('Train_Grid_E_P10.wav');
[E_11,~,ENF_E_11,~] = preprocess('Train_Grid_E_P11.wav');
[E_12,~,ENF_E_12,~] = preprocess('Train_Grid_E_A1.wav');
[E_13,~,ENF_E_13,~] = preprocess('Train_Grid_E_A2.wav');
display('---------------------');
display('grid E done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[F_1,~,ENF_F_1,~] = preprocess('Train_Grid_F_P1.wav');
[F_2,~,ENF_F_2,~] = preprocess('Train_Grid_F_P2.wav');
[F_3,~,ENF_F_3,~] = preprocess('Train_Grid_F_P3.wav');
[F_4,~,ENF_F_4,~] = preprocess('Train_Grid_F_P4.wav');
[F_5,~,ENF_F_5,~] = preprocess('Train_Grid_F_P5.wav');
[F_6,~,ENF_F_6,~] = preprocess('Train_Grid_F_P6.wav');
[F_7,~,ENF_F_7,~] = preprocess('Train_Grid_F_P7.wav');
[F_8,~,ENF_F_8,~] = preprocess('Train_Grid_F_P8.wav');
[F_9,~,ENF_F_9,~] = preprocess('Train_Grid_F_A1.wav');
[F_10,~,ENF_F_10,~] = preprocess('Train_Grid_F_A2.wav');
display('---------------------');
display('grid F done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[G_1,~,ENF_G_1,~] = preprocess('Train_Grid_G_P1.wav');
[G_2,~,ENF_G_2,~] = preprocess('Train_Grid_G_P2.wav');
[G_3,~,ENF_G_3,~] = preprocess('Train_Grid_G_P3.wav');
[G_4,~,ENF_G_4,~] = preprocess('Train_Grid_G_P4.wav');
[G_5,~,ENF_G_5,~] = preprocess('Train_Grid_G_P5.wav');
[G_6,~,ENF_G_6,~] = preprocess('Train_Grid_G_P6.wav');
[G_7,~,ENF_G_7,~] = preprocess('Train_Grid_G_P7.wav');
[G_8,~,ENF_G_8,~] = preprocess('Train_Grid_G_P8.wav');
[G_9,~,ENF_G_9,~] = preprocess('Train_Grid_G_P9.wav');
[G_10,~,ENF_G_10,~] = preprocess('Train_Grid_G_P10.wav');
[G_11,~,ENF_G_11,~] = preprocess('Train_Grid_G_P11.wav');
[G_12,~,ENF_G_12,~] = preprocess('Train_Grid_G_A1.wav');
[G_13,~,ENF_G_13,~] = preprocess('Train_Grid_G_A2.wav');

display('---------------------');
display('grid G done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);
[H_1,~,ENF_H_1,~] = preprocess('Train_Grid_H_P1.wav');
[H_2,~,ENF_H_2,~] = preprocess('Train_Grid_H_P2.wav');
[H_3,~,ENF_H_3,~] = preprocess('Train_Grid_H_P3.wav');
[H_4,~,ENF_H_4,~] = preprocess('Train_Grid_H_P4.wav');
[H_5,~,ENF_H_5,~] = preprocess('Train_Grid_H_P5.wav');
[H_6,~,ENF_H_6,~] = preprocess('Train_Grid_H_P6.wav');
[H_7,~,ENF_H_7,~] = preprocess('Train_Grid_H_P7.wav');
[H_8,~,ENF_H_8,~] = preprocess('Train_Grid_H_P8.wav');
[H_9,~,ENF_H_9,~] = preprocess('Train_Grid_H_P9.wav');
[H_10,~,ENF_H_10,~] = preprocess('Train_Grid_H_P10.wav');
[H_11,~,ENF_H_11,~] = preprocess('Train_Grid_H_P11.wav');
[H_12,~,ENF_H_12,~] = preprocess('Train_Grid_H_A1.wav');
[H_13,~,ENF_H_13,~] = preprocess('Train_Grid_H_A2.wav');

display('---------------------');
display('grid H done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

[I_1,~,ENF_I_1,~] = preprocess('Train_Grid_I_P1.wav');
[I_2,~,ENF_I_2,~] = preprocess('Train_Grid_I_P2.wav');
[I_3,~,ENF_I_3,~] = preprocess('Train_Grid_I_P3.wav');
[I_4,~,ENF_I_4,~] = preprocess('Train_Grid_I_P4.wav');
[I_5,~,ENF_I_5,~] = preprocess('Train_Grid_I_P5.wav');
[I_6,~,ENF_I_6,~] = preprocess('Train_Grid_I_P6.wav');
[I_7,~,ENF_I_7,~] = preprocess('Train_Grid_I_P7.wav');
[I_8,~,ENF_I_8,~] = preprocess('Train_Grid_I_P8.wav');
[I_9,~,ENF_I_9,~] = preprocess('Train_Grid_I_P9.wav');
[I_10,~,ENF_I_10,~] = preprocess('Train_Grid_I_P10.wav');
[I_11,~,ENF_I_11,~] = preprocess('Train_Grid_I_P11.wav');
[I_12,~,ENF_I_12,~] = preprocess('Train_Grid_I_A1.wav');
[I_13,~,ENF_I_13,~] = preprocess('Train_Grid_I_A2.wav');

display('---------------------');
display('grid I done :)');display([['Elapsed Time : ' num2str(toc/60)] ' minutes']);

save('data_18.mat');
% load('data_18.mat');


ENF_A=[ENF_A_1;ENF_A_2;ENF_A_3;ENF_A_4;ENF_A_5;ENF_A_6;ENF_A_7;ENF_A_8;ENF_A_9;ENF_A_10;ENF_A_11];
ENF_B=[ENF_B_1;ENF_B_2;ENF_B_3;ENF_B_4;ENF_B_5;ENF_B_6;ENF_B_7;ENF_B_8;ENF_B_9;ENF_B_10;ENF_B_11;ENF_B_12];
ENF_C=[ENF_C_1;ENF_C_2;ENF_C_3;ENF_C_4;ENF_C_5;ENF_C_6;ENF_C_7;ENF_C_8;ENF_C_9;ENF_C_10;ENF_C_11;ENF_C_12;ENF_C_13];
ENF_D=[ENF_D_1;ENF_D_2;ENF_D_3;ENF_D_4;ENF_D_5;ENF_D_6;ENF_D_7;ENF_D_8;ENF_D_9;ENF_D_10;ENF_D_11;ENF_D_12;ENF_D_13];
ENF_E=[ENF_E_1;ENF_E_2;ENF_E_3;ENF_E_4;ENF_E_5;ENF_E_6;ENF_E_7;ENF_E_8;ENF_E_9;ENF_E_10;ENF_E_11;ENF_E_12;ENF_E_13];
ENF_F=[ENF_F_1;ENF_F_2;ENF_F_3;ENF_F_4;ENF_F_5;ENF_F_6;ENF_F_7;ENF_F_8;ENF_F_9;ENF_F_10];
ENF_G=[ENF_G_1;ENF_G_2;ENF_G_3;ENF_G_4;ENF_G_5;ENF_G_6;ENF_G_7;ENF_G_8;ENF_G_9;ENF_G_10;ENF_G_11;ENF_G_12;ENF_G_13];
ENF_H=[ENF_H_1;ENF_H_2;ENF_H_3;ENF_H_4;ENF_H_5;ENF_H_6;ENF_H_7;ENF_H_8;ENF_H_9;ENF_H_10;ENF_H_11;ENF_H_12;ENF_H_13];
ENF_I=[ENF_I_1;ENF_I_2;ENF_I_3;ENF_I_4;ENF_I_5;ENF_I_6;ENF_I_7;ENF_I_8;ENF_I_9;ENF_I_10;ENF_I_11;ENF_I_12;ENF_I_13];


F_A=[A_1;A_2;A_3;A_4;A_5;A_6;A_7;A_8;A_9;A_10;A_11];
F_B=[B_1;B_2;B_3;B_4;B_5;B_6;B_7;B_8;B_9;B_10;B_11;B_12];
F_C=[C_1;C_2;C_3;C_4;C_5;C_6;C_7;C_8;C_9;C_10;C_11;C_12;C_13];
F_D=[D_1;D_2;D_3;D_4;D_5;D_6;D_7;D_8;D_9;D_10;D_11;D_12;D_13];
F_E=[E_1;E_2;E_3;E_4;E_5;E_6;E_7;E_8;E_9;E_10;E_11;E_12;E_13];
F_F=[F_1;F_2;F_3;F_4;F_5;F_6;F_7;F_8;F_9;F_10];
F_G=[G_1;G_2;G_3;G_4;G_5;G_6;G_7;G_8;G_9;G_10;G_11;G_12;G_13];
F_H=[H_1;H_2;H_3;H_4;H_5;H_6;H_7;H_8;H_9;H_10;H_11;H_12;H_13];
F_I=[I_1;I_2;I_3;I_4;I_5;I_6;I_7;I_8;I_9;I_10;I_11;I_12;I_13];


Practice_features=zeros(50,number_of_features);
Practice_ENF=zeros(50,size(ENF_A,2));
for i=1:50
  [Practice_features(i,:),~,Practice_ENF(i,:),~] = preprocess([['Practice_' num2str(i)] '.wav']);    
end

display('---------------------');
display('practice data done :)');
% =============================================================
Testing_features=zeros(100,number_of_features);
Testing_ENF=zeros(100,size(ENF_A,2));
for i=1:100
  [Testing_features(i,:),~,Testing_ENF(i,:),~] = preprocess([['Test_' num2str(i)] '.wav']);    
end

display('Testing data done :)');
% =============================================================

save('state.mat')


end
