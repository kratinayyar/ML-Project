function weightVector = getWeightVector( windowSize )
weightVector = ones(windowSize,1);
for i = 1 : windowSize
    weightVector(i) =  windowSize - i + 1;
end
end

