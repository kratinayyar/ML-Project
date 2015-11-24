function model = getSlidingWindowAverageModel(trainData, windowSize, windowIncrement)


threshold = max(trainData(:,1));
n = length(trainData(:,1));
weightVector = ones(windowSize,1);

for i = 1 : windowSize
    weightVector(i) = i;
end

globalAverage = 0;
for slidingWindowDataIndex = 6 : windowIncrement : n - windowSize + 1
    %Pick the windowSize worth of data
    slidingWindowData = trainData(slidingWindowDataIndex:slidingWindowDataIndex + windowSize - 1,:);
    %Average the value in a variable
    %Calculate the new weighted average
    slidingWindowData(:,1) = slidingWindowData(:,1);% .* weightVector;
    currentAverage = mean(slidingWindowData(:,1));
    %if the currentPoint is an anomaly, set threshold to
    %abs(newAverage - oldAverage) if the difference is less
    %than the threshold.
    if(slidingWindowData(windowSize,2) == 1)
        localThreshold =  currentAverage - globalAverage;
        if(localThreshold <= threshold)
            threshold = localThreshold;
        end
    else
        currentAverage = mean(slidingWindowData(slidingWindowData(:,2) == 0));
        %if(currentAverage ~= 0)
            globalAverage = currentAverage;
        %end
    end
    
end

model.threshold = threshold;
