% test the timing of p14 and ex74

numRuns = 1000;

p14;   % Warm-up run to initialize JIT compilation
tic; 
for i = 1:numRuns
    p14;
end
elapsedTime = toc;
averageTime = elapsedTime / numRuns

ex74
tic; 
for i = 1:numRuns
    ex74;
end
elapsedTime = toc;
averageTime = elapsedTime / numRuns % 2~4x faster