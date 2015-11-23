function model = getSlidingWindowAverageModel(trainData, windowSize, windowIncrement)


threshold = max(trainData(:,1));
n = length(trainData(:,1));

globalAverage = 0;
for slidingWindowDataIndex = 1 : windowIncrement : n - windowSize
    %Pick the windowSize worth of data
    slidingWindowData = trainData(slidingWindowDataIndex:slidingWindowDataIndex + windowSize,:);
    %Average the value in a variable
    %Calculate the new average
    currentAverage = mean(slidingWindowData(:,1));
    %if the currentPoint is an anomaly, set threshold to
    %abs(newAverage - oldAverage) if the difference is less
    %than the threshold.
    if(slidingWindowData(windowSize,2) == 1)
        localThreshold =  globalAverage - currentAverage;
        if(localThreshold < threshold)
            threshold = localThreshold;
        end
    end
    globalAverage = currentAverage;
end
    
model.threshold = threshold;
