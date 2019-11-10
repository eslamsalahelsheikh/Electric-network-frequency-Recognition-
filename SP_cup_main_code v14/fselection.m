tic
datasetTable=training_data_features;
% [trainedClassifier, validationAccuracy, partitionedModel] = trainClassifier(datasetTable);
% error=1-validationAccuracy
Predictors=datasetTable(:,1:end-1);
Response=datasetTable(:,end);

% c = cvpartition(y,'k',5);
% opts = statset('display','iter');
% fun = @(XT,yT,Xt,yt)...
%       (criterion(XT,yT));
%   [fs,history] = sequentialfs(fun,Predictors,Response,'cv',c,'options',opts);
%   
  %% we will now choose best features , ISA ^^ 
 total_partial_predictors = [];
 total_error = 1;
 best_features_indices=[];
  for i = 1:size(Predictors,2)
        partial_predictors = [total_partial_predictors Predictors(:,i)];
        
    [error,trainedClassifier] = criterion(partial_predictors,Response) ; 
    if error < total_error
        total_error = error;
        best_features_indices =  [best_features_indices i];
        total_partial_predictors = partial_predictors;
        best_trainedClassifier =trainedClassifier;
    end    
    i
  end
  
  dimensionality_reduction_percentage = length(best_features_indices)/size(Predictors,2)*100
  best_accuracy=1-total_error
  best_Practice_data_features=Practice_data_features(:,best_features_indices);
  [yfit,score] = predict(best_trainedClassifier, best_Practice_data_features);a=char(yfit+64);a'
  
 
%   nones=[];
%   for  threshold = 0.32:0.01:0.4
threshold = 0.4;
  class = zeros(50,1);
  confidence = zeros(50,1);
  number_of_nones=0;
  for j =  1:size(score,1)
      example_score=score(j,:);
      confidence(j) = max(example_score);
      class(j) = find(example_score==confidence(j), 1 );
    if confidence(j)<threshold
   class(j) =14;
   number_of_nones = number_of_nones+1;
    end
  end
%     nones= [nones number_of_nones];
%   end
% plot(0.32:0.01:0.4,nones)
number_of_nones
  class=char(class+64);class'

  toc

  
  