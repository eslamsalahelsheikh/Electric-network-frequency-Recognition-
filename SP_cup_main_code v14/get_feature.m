function [feature_vector] = get_feature (ENF)
feature_vector=zeros(1,size(ENF,1));

for i=1:size(ENF,1)
    s=ENF(i,:);
    threshold= 0.012; 
%     feature = length(find(s<59.98));

    threshold= 0.015; 
%     feature = length(find(example>(60-threshold)&example<60+(threshold)));
    feature = mean(s);

    
   feature_vector(i) = feature;
end

end