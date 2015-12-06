function predictions = getSlidingWindowAveragePredictions(trainData, model)

%threshold = model.threshold;
multiplier = model.multiplier;
n = length(trainData(:,1));
windowIncrement = model.windowIncrement;
windowSize = model.windowSize;

globalAverage = 0;
predictions = zeros(n,1);
predictions(1:windowSize - 1,1) = 0;
for slidingWindowDataIndex = 1 : windowIncrement : n - windowSize + 1
    %Pick the windowSize worth of data
    slidingWindowData = trainData(slidingWindowDataIndex:slidingWindowDataIndex + windowSize - 1,:);
    %Average the value in a variable
    %Calculate the new average
    currentAverage = mean(slidingWindowData(:,1));
    sigma = var(slidingWindowData(:,1));
    %if the currentAverage - globalAverage > threshold, it is an anomaly
    if(globalAverage == 0)
        globalAverage = currentAverage;
    end
    
    if(currentAverage - globalAverage >= sigma * multiplier)
        predictions(slidingWindowDataIndex + windowSize - 1) = 1;
    else
        currentAverage = mean(slidingWindowData(:,1));
        globalAverage = currentAverage;
    end
end



