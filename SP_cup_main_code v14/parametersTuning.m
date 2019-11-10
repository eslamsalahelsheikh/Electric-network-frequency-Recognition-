
function [nNeronsL1,alpha,weightPenalty,dropoutFraction,Number_of_sweeps,nn] = parametersTuning()
%% ========================================================================
clc
nNeronsL1 = 500;
alpha = 0.08;
weightPenalty =0.03;
dropoutFraction = 0;
Number_of_sweeps =350;
approxTimePerTrial = 0.3; %mins
nTrials = length(nNeronsL1)*length(alpha)*length(weightPenalty)*length(dropoutFraction);
totalApproxTime = nTrials * approxTimePerTrial;
fprintf('Estimated time of parameters tuning = %d mins\n\n',round(totalApproxTime));
pause(3)
%% ========================================================================
trials = zeros(nTrials,6); % 6 = 5 parameters + 1 error
i = 1;
for p1 = nNeronsL1
    for p2 = alpha
        for p3 = weightPenalty
            for p4 = dropoutFraction
                for p5=Number_of_sweeps
                [er,nn] = trainNN(p1,p2,p3,p4,p5);
                trials(i,:) = [p1,p2,p3,p4,p5,er];
                i=i+1;
                end
            end
        end
    end
end
[minError,idx] = min(trials(:,6));
bestParameters = trials(idx,1:5);

display(minError);
fprintf('Best Parameters:\n');
fprintf('nNeronsL1       = %d\n',bestParameters(1));
fprintf('alpha           = %d\n',bestParameters(2));
fprintf('weightPenalty   = %d\n',bestParameters(3));
fprintf('dropoutFraction = %d\n',bestParameters(4));

nNeronsL1=bestParameters(1);
alpha=bestParameters(2);
weightPenalty=bestParameters(3);
dropoutFraction=bestParameters(4);
Number_of_sweeps=bestParameters(5);
save('best_parameters');
[~,nn] = trainNN(bestParameters(1),bestParameters(2),bestParameters(3),bestParameters(4),bestParameters(5));
%%=========================================================================
end
