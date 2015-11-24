function accuracyScore = getAccuracyScore(predictions, data)


postiveDataIndexes = data(:,2) == 1;
truePositives = sum(predictions(postiveDataIndexes));
totalPositives = sum(predictions  == 1);
precision = truePositives/totalPositives;
expectedPositives = sum(data(:,2)  == 1);
recall = truePositives/expectedPositives;

accuracyScore = 2 * precision * recall/(precision + recall);
