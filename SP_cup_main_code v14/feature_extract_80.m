function [Features_matrix,number_of_features] = feature_extract(signal)
for z=1:size(signal,1)
    s=signal(z,:);
    Features=[];
    Features(1) = mean(s);
    Features(2) = log(var(s));
    Features(3) = log(range(s));
    a=abs(fft(s,120));
    b=abs(dct(s,120));
    b=[b(1:5)];     %effective dct coeff
    
    m = [log(abs(moment(s,3))) log(abs(moment(s,4))) log(abs(moment(s,5))) log(abs(moment(s,6))) log(abs(moment(s,7))) log(abs(skewness(s))) kurtosis(s)];
%     m=[m(2) m(4:5) m(7)];    %effective high order, rest have problems
    
    Features=[Features b m(2) m(5)];
    
    level=7;
    [C,L] = wavedec(s,level,'db5');
    Reconstructed_approx = wrcoef('a',C,L,'db5',6);
    x(1) = log(var(Reconstructed_approx));
    D1 = wrcoef('d',C,L,'db5',1);
    x(2) = log(var(D1));
    D2 = wrcoef('d',C,L,'db5',2);
    x(3) = log(var(D2));
    D3 = wrcoef('d',C,L,'db5',3);
    x(4) = log(var(D3));
    D4 = wrcoef('d',C,L,'db5',4);
    x(5) = log(var(D4));
    D5 = wrcoef('d',C,L,'db5',5);
    x(6) = log(var(D5));
    D6 = wrcoef('d',C,L,'db5',6);
    x(7) = log(var(D6));
    % [a,v] = arcov(s,2);
    % Features(14) = a(2);
    % Features(15) = a(3);
    % Features(16) = log(v);
    Features = [Features x];
    
    histogram = hist(s);
    
    Features = [Features histogram];
    
        [a,v] = armcov(s,2);
        
    Features=[Features a(3)];
    
    [C,L] = wavedec(s,5,'db5');%sym4
    s1=abs(fft(C));
    maxim=max(s1);
    Features=[Features maxim];
    
    Features(isinf(Features)) = 0;
    Features(isnan(Features)) = 0;
    
    number_of_features=length(Features);
    Features_matrix(z,:)=Features;
end

end
