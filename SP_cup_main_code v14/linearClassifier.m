function [trainedClassifier, validationAccuracy] = linearClassifier(training_data_features)


Predictors=training_data_features(:,1:end-1);
Response=training_data_features(:,end);

 number_of_bags=204;   %for 76 
template = templateSVM('KernelFunction', 'linear', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
trainedClassifier = fitcecoc(Predictors, Response, 'Learners', template, 'Coding', 'onevsone', 'ClassNames', [1 2 3 4 5 6 7 8 9]);
% trainedClassifier = fitensemble(Predictors, Response, 'Bag', number_of_bags, 'Tree', 'Type', 'Classification', 'ClassNames', [1 2 3 4 5 6 7 8 9]);

partitionedModel = crossval(trainedClassifier, 'KFold', 5);
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
  
% [validationPredictions, validationScores] = kfoldPredict(partitionedModel);

end