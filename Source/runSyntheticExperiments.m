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
bestWindowSize = 1;



slidingWindowModel = getSlidingWindowAverageModel(trainData);

%Run through all the test data


%Vary or tune model parameters

%Calculate accuracy based on the model
slidingWindowPredictions = getSlidingWindowAverageModelPredictions(testData);

%Record accuracy

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