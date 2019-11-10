 threshold=0.25;
[Practice_data_classes,Practice_data_confidence] = predict_grid(Practice_data_features,trainedClassifier,threshold);
Practice_data_classes'
% for i=1:50
% nominal= Practice_data_features(i,1);
% if nominal>0
% yfit(i)=predict(trainedClassifier_60hz,Practice_data_features(i,:));
% else
% yfit(i)=predict(trainedClassifier_50hz,Practice_data_features(i,:));
% end
% end
yfit=predict(trainedClassifier,Practice_data_features);
a=char(yfit+64);
a'