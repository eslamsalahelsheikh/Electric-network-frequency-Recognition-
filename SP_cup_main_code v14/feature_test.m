% this is a platform to test features on Grids A,C,I
close all
clc

B=get_feature(ENF_B);
D=get_feature(ENF_D);
E=get_feature(ENF_E);
F=get_feature(ENF_F);
G=get_feature(ENF_G);
H=get_feature(ENF_H);

m=min([length(B) length(D) length(E) length(F) length(G) length(H)]);

plot(B(1:m));hold on;plot(D(1:m));hold on;plot(E(1:m));hold on;plot(F(1:m));hold on;plot(G(1:m));hold on;plot(H(1:m))
legend('B','D','E','F','G','H')