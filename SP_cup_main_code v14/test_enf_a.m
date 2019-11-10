

[H_1,ENF_H_1,~] = preprocess('Train_Grid_H_P1.wav');
[H_2,ENF_H_2,~] = preprocess('Train_Grid_H_P2.wav');
[H_3,ENF_H_3,~] = preprocess('Train_Grid_H_P3.wav');
[H_4,ENF_H_4,~] = preprocess('Train_Grid_H_P4.wav');
[H_5,ENF_H_5,~] = preprocess('Train_Grid_H_P5.wav');
[H_6,ENF_H_6,~] = preprocess('Train_Grid_H_P6.wav');
[H_7,ENF_H_7,~] = preprocess('Train_Grid_H_P7.wav');
[H_8,ENF_H_8,~] = preprocess('Train_Grid_H_P8.wav');
[H_9,ENF_H_9,~] = preprocess('Train_Grid_H_P9.wav');
[H_10,ENF_H_10,~] = preprocess('Train_Grid_H_P10.wav');
[H_11,ENF_H_11,~] = preprocess('Train_Grid_H_P11.wav');
[H_12,ENF_H_12,~] = preprocess('Train_Grid_H_A1.wav');
[H_13,ENF_H_13,~] = preprocess('Train_Grid_H_A2.wav');


ENF_H=[ENF_H_1;ENF_H_2;ENF_H_3;ENF_H_4;ENF_H_5;ENF_H_6;ENF_H_7;ENF_H_8;ENF_H_9;ENF_H_10;ENF_H_11;ENF_H_12;ENF_H_13];

% ENF_H=[ENF_H_1;ENF_H_2;ENF_H_3;ENF_H_4;ENF_H_5;ENF_H_6;ENF_H_7;ENF_H_8;ENF_H_9;ENF_H_10;ENF_H_11];

ENF_H_transpose=ENF_H';
plot(ENF_H_transpose(:));