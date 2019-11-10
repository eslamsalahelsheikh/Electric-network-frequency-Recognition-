
function [F_A,F_B,F_C,F_D,F_E,F_F,F_G,F_H,F_I,Practice,Testing,mu,sigma] = Normalize_features_2(f_A,f_B,f_C,f_D,f_E,f_F,f_G,f_H,f_I,Practice,Testing)
mu    = mean([f_A;f_B;f_C;f_D;f_E;f_F;f_G;f_H;f_I]);
sigma = std([f_A;f_B;f_C;f_D;f_E;f_F;f_G;f_H;f_I]);
F_A   = normalize(f_A, mu,sigma);
F_B   = normalize(f_B, mu,sigma);
F_C   = normalize(f_C, mu,sigma);
F_D   = normalize(f_D, mu,sigma);
F_E   = normalize(f_E, mu,sigma);
F_F   = normalize(f_F, mu,sigma);
F_G   = normalize(f_G, mu,sigma);
F_H   = normalize(f_H, mu,sigma);
F_I   = normalize(f_I, mu,sigma);
Practice = normalize(Practice, mu,sigma);
Testing = normalize(Testing, mu,sigma);
% ==========================================
%{
matrix_mean= [mean(f_A); mean(f_B); mean(f_C); mean(f_D); mean(f_E); mean(f_F) ;mean(f_G); mean(f_H); mean(f_I) ; Practice] ;
mu= mean(matrix_mean);


f_A=f_A-repmat(mu,size(f_A,1),1);
f_B=f_B-repmat(mu,size(f_B,1),1);
f_C=f_C-repmat(mu,size(f_C,1),1);
f_D=f_D-repmat(mu,size(f_D,1),1);
f_E=f_E-repmat(mu,size(f_E,1),1);
f_F=f_F-repmat(mu,size(f_F,1),1);
f_G=f_G-repmat(mu,size(f_G,1),1);
f_H=f_H-repmat(mu,size(f_H,1),1);
f_I=f_I-repmat(mu,size(f_I,1),1);
Practice=Practice-repmat(mu,size(Practice,1),1);


matrix_max= [max(abs(f_A)); max(abs(f_B)); max(abs(f_C)); max(abs(f_D)); max(abs(f_E)); max(abs(f_F)); max(abs(f_G)); max(abs(f_H)); max(abs(f_I));max(abs(Practice)) ];
maxima= max(matrix_max);


F_A=f_A.* (100 ./ repmat(maxima,size(f_A,1),1));
F_B=f_B.* (100 ./ repmat(maxima,size(f_B,1),1));
F_C=f_C.* (100 ./ repmat(maxima,size(f_C,1),1));
F_D=f_D.* (100 ./ repmat(maxima,size(f_D,1),1));
F_E=f_E.* (100 ./ repmat(maxima,size(f_E,1),1));
F_F=f_F.* (100 ./ repmat(maxima,size(f_F,1),1));
F_G=f_G.* (100 ./ repmat(maxima,size(f_G,1),1));
F_H=f_H.* (100 ./ repmat(maxima,size(f_H,1),1));
F_I=f_I.* (100 ./ repmat(maxima,size(f_I,1),1));
Practice=Practice.* (100 ./ repmat(maxima,size(Practice,1),1));
%}


% =============================================================

end
