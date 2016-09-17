% load data
load sampledata2;

% prob 2
num_cancer = sum(data(:, 3))
num_drink_6plus = sum(data(:, 2)>5)
num_50plus = sum(data(:,1)>50)
num_20minus = sum(data(:, 1)<20)

% prob 3
cancer_indices = find(data(:, 3) == 1.0);
histogram(data(cancer_indices, 1), [15, 25, 35, 45, 55, 65, 75]);

% prob 4
nocancer_indices = find(data(:, 3) == 0.0);
histogram(data(nocancer_indices, 1), [15, 25, 35, 45, 55, 65]);

% prob 5
cancer_younger = sum(data(cancer_indices, 1) < 35);
cancer_older = sum(data(cancer_indices, 1) > 35);
cancer_younger > cancer_older

cancer_younger = sum(data(cancer_indices, 1) < 45);
cancer_older = sum(data(cancer_indices, 1) > 45);
cancer_younger < cancer_older

cancer_younger = sum(data(cancer_indices, 1) < 30);
cancer_older = sum(data(cancer_indices, 1) > 60);
cancer_younger > cancer_older

cancer_younger = sum(data(cancer_indices, 1) < 25);
cancer_older = sum(data(cancer_indices, 1) > 55);
cancer_younger < cancer_older

% prob 6
fract_cancer_35plus = sum(data(cancer_indices, 1) > 35) / length(data(cancer_indices, 1));
round(fract_cancer_35plus * 100, 2)

% prob 7
fract_25minus = sum(data(:, 1) < 25) / length(data(:, 1));
round(fract_25minus * 100, 2)

% prob 8
over3drinks_indices = find(data(:, 2) > 3);
fract_over3drinks_cancer = ...
    sum(data(over3drinks_indices, 3) == 1.0) / length(data(over3drinks_indices, 1));
round(fract_over3drinks_cancer * 100, 3)
