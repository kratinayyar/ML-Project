%First comment
clear;

%Just a place holder for the training data
trainData = zeros(1000, 2);
testData = zeros(1,1);

%% Run the threshold based algorithm
thresholdModel = getThresholdWorkflowModel(trainData); 

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

windowSizes = 50;

fileContents = importdata('Pattern61.xlsx');
trainData = fileContents.data;

for windowSize  = 6 :windowSizes
    slidingWindowModel = getSlidingWindowAverageModel(trainData,windowSize, bestWindowIncrement);
    slidingWindowModel.windowSize = windowSize;
    slidingWindowModel.windowIncrement = bestWindowIncrement;
    %Run through all the test data
    
    
    %Vary or tune model parameters
    
    %Calculate accuracy based on the model
    slidingWindowPredictions = getSlidingWindowAveragePredictions(trainData,slidingWindowModel);
    
    % A scalar accuracy score
    slidingWindowAccuracy = getAccuracyScore(slidingWindowPredictions, trainData);
    
    %Record accuracy
    if(slidingWindowAccuracy > bestSlidingWindowAccuracy)
        bestSlidingWindowAccuracy = slidingWindowAccuracy;
        bestWindowSize = windowSize;
    end
    
end

bestSlidingWindowAccuracy 
bestWindowSize
%Plot the parameters vs accuracy curve


%Select the best model parameters based on accuracy

%% Run the FFT based algorithm
fftModel = getFFTModel(trainData);

%Run through all the test data

%Vary or tune model parameters

%Calculate accuracy based on the model

%Record accuracy

%Plot the parameters vs accuracy curve

%Select the best model parameters based on accuracy