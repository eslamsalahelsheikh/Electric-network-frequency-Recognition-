labels = cellstr(num2str(equalSize_size'));
plot(1:length(equalSize_error),equalSize_error,'b--o');
text(1:length(equalSize_error),equalSize_error,labels,'VerticalAlignment','bottom','HorizontalAlignment','right');

figure(5)
labels = cellstr(num2str(equalSize_size'));
plot(equalSize_size,equalSize_error,'b--o');

figure(2);
for i=1:44
    label = cellstr([num2str(i)]);
    if(1)
        plot(1:nepoch,historyTestError(i,:),'Color',i*0.02*[1,1,1]);
        text(nepoch,historyTestError(i,end),label,'VerticalAlignment','bottom','HorizontalAlignment','right');
    end
    hold on;
end

figure(11)
plot(1:44,finalTestError,'b--o');
