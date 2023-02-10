clc;clear;
fplot(@(n) [1, n*log(n), n, n^2, 2^n], [2 10])
ylim([0 50])
tic
timerVal = tic