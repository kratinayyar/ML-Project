function predictions = getSlidingWindowAveragePredictions(trainData, model)

threshold = model.threshold;
multiplier = model.multiplier;
n = length(trainData(:,1));
windowIncrement = model.windowIncrement;
windowSize = model.windowSize;

globalAverage = 0;
predictions = zeros(n,1);
for slidingWindowDataIndex = 1 : windowIncrement : n - windowSize
    %Pick the windowSize worth of data
    slidingWindowData = trainData(slidingWindowDataIndex:slidingWindowDataIndex + windowSize,:);
    %Average the value in a variable
    %Calculate the new average
    currentAverage = mean(slidingWindowData(slidingWindowData(:,2) == 0));
    %if the currentAverage - globalAverage > threshold, it is an anomaly
    if(globalAverage == 0)
        globalAverage = currentAverage;
    end
    
    if(currentAverage - globalAverage >= currentAverage * multiplier)
        predictions(slidingWindowDataIndex) = 1;
    else
        currentAverage = mean(slidingWindowData(slidingWindowData(:,2) == 0));
        globalAverage = currentAverage;
    end
    
        
    
end



