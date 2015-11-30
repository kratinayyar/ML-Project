%First comment
clear;

%Just a place holder for the training data
trainData = zeros(1000, 2);
testData = zeros(1,1);

%% Run the threshold based algorithm
%thresholdModel = getThresholdWorkflowModel(trainData); 

%Run through all the test data

%Vary or tune model parameters

%Calculate accuracy based on the model

%Record accuracy

%Plot the parameters vs accuracy curve

%Select the best model parameters based on accuracy

%% Run the Sliding window weighted average algorithm

bestSlidingWindowAccuracy = 0;
bestWindowSize = 1; %Vary this
bestWindowIncrement = 1;
bestNormalizingRatio = 1;
normalizingRatiosStartPoint = 0.9;
normalizingRatiosEndPoint = 1.4;
windowSizes = 50;


%fileContents = importdata('Pattern61.xlsx');
%trainData = fileContents.data;


fileContents = importdata('Pattern61.csv');
trainData = fileContents.data;

% fileContents = importdata('combinedData.csv');
% trainData = fileContents(1:3000,2:3);

plotData = zeros(windowSizes,2);
bestMultipliers = zeros(windowSizes,1);

for windowSize  = 1 : windowSizes
    slidingWindowModel = getSlidingWindowAverageModel(trainData,windowSize, bestWindowIncrement);
    slidingWindowModel.windowSize = windowSize;
    slidingWindowModel.windowIncrement = bestWindowIncrement;
    %Run through all the test data
    
    
    %Vary or tune model parameters
    
    %Calculate accuracy based on the model
    multiplier = slidingWindowModel.multiplier;
    bestLocalAccuracy = 0;
    %for localMultiplier = 1: 1
    for localMultiplier = normalizingRatiosStartPoint: 0.1:normalizingRatiosEndPoint
        slidingWindowModel.multiplier = multiplier * localMultiplier;
        slidingWindowPredictions = getSlidingWindowAveragePredictions(trainData,slidingWindowModel);
        % A scalar accuracy score
        slidingWindowAccuracy = getAccuracyScore(slidingWindowPredictions, trainData);
        if(isnan(slidingWindowAccuracy))
            slidingWindowAccuracy = 0;
        end
        if(slidingWindowAccuracy > bestLocalAccuracy)
            bestLocalAccuracy = slidingWindowAccuracy;
            bestMultipliers(windowSize) = localMultiplier;
        end
    end
    
    
    %Record accuracy
    if(bestLocalAccuracy > bestSlidingWindowAccuracy)
        bestSlidingWindowAccuracy = bestLocalAccuracy;
        bestWindowSize = windowSize;
    end
    plotData(windowSize,1) = windowSize;
    plotData(windowSize,2) = bestLocalAccuracy;
end

%Plot the parameters vs accuracy curve
plot(plotData(:,1),plotData(:,2));


%Select the best model parameters based on accuracy

bestSlidingWindowAccuracy 
bestWindowSize

%% Run the FFT based algorithm
fftModel = getFFTModel(trainData);

%Run through all the test data

%Vary or tune model parameters

%Calculate accuracy based on the model

%Record accuracy

%Plot the parameters vs accuracy curve

%Select the best model parameters based on accuracy