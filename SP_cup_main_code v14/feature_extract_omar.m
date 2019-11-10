function [Features_matrix,number_of_features] = feature_extract(signal)
for z=1:size(signal,1)
    s=signal(z,:);
    Features=[];
    Features(1) = mean(s);
    Features(2) = log(var(s));
    Features(3) = log(range(s));
    a=abs(fft(s,120));
    b=abs(dct(s,120));
    m = [log10(moment(s,3)) log10(moment(s,4)) log10(moment(s,5)) log10(moment(s,6)) log10(moment(s,7)) log10(skewness(s)) kurtosis(s)];
m=abs(m);
    Features=[Features];
    
    level=9;
    [C,L] = wavedec(s,level,'db5');
    Reconstructed_approx = wrcoef('a',C,L,'db5',9);
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
   D7 = wrcoef('d',C,L,'db5',7);
    x(8) = log(var(D7));
   D8 = wrcoef('d',C,L,'db5',8);
    x(9) = log(var(D8));
    % [a,v] = arcov(s,2);
%     Features(14) = a(2);
%     Features(15) = a(3);
%     Features(16) = log10(v);
    Features = [Features x];
    
    histogram = hist(s);
    
    Features = [Features histogram];
    
    Features(isinf(Features)) = 0;
    Features(isnan(Features)) = 0;
    
    number_of_features=length(Features);
    Features_matrix(z,:)=Features;
end

end
