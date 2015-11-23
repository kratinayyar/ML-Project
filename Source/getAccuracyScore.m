function accuracyScore = getAccuracyScore(predictions, data)

n = length(data(:,1));
matches = sum(predictions(:) == data(:,2));
accuracyScore = (matches/n) * 100;