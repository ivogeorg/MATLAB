% load data
data = imread('flash4.jpg', 'jpg');

% transpose and reorder
data = data';
data = data(512:-1:1, :);

% prob 1

% divide into flash and no flash, and average
flash = mean(data(235:297, :));
noflash = mean(data([1:234, 298:512], :));

% normalize fluorescence
baseline = mean(data(415:435, :));
R_flash = flash ./ baseline; % unitless
R_noflash = noflash ./ baseline; % unitless

% calculate Ca2+for the two cases
Ca2plus_baseline = 150; % nM
K_D = 1000; % nM

Ca2plus_flash = K_D * R_flash ./ (K_D / Ca2plus_baseline - R_flash + 1);
Ca2plus_noflash = K_D * R_noflash ./ (K_D / Ca2plus_baseline - R_noflash + 1);

% plot on the same figure
figure
hold on
plot(1:634, Ca2plus_flash, 'r');
plot(1:634, Ca2plus_noflash, 'b');
xlabel('Time (ms)')
ylabel('Ca2+ (nM)')
legend('Flash', 'No flash', 'Location', 'NorthEast')
