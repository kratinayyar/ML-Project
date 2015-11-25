function accuracyScore = getAccuracyScore(predictions, data)

alpha = 0;
postiveDataIndexes = find(data(:,2) == 1);
truePositives = sum(predictions(postiveDataIndexes)) + alpha;
totalPositives = sum(predictions  == 1) + alpha;
precision = truePositives/totalPositives;
expectedPositives = length(postiveDataIndexes) + alpha;
recall = truePositives/expectedPositives;

accuracyScore = 2 * precision * recall/(precision + recall);
