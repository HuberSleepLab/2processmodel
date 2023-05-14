% This plots the classic 2 process model figure, but its now modular, so
% you can plot whichever part you want. You can just comment out the part
% you don't want.

close all
clc
clear

Format = struct();
Format.LW = 5;
Format.Color = 'k';
Format.FontSize = 14;
Format.FontName = 'Tw Cen MT';

% SleepStarts = [-1 23, 47]; % hours from first midnight
SleepStarts = [0 24, 48]; % hours from first midnight
SleepEnds = SleepStarts + 8;
SleepMidpoint = 3.5; % circadian midpoint of sleep

figure('units','centimeters','position',[0 0 25, 13])

hold on


% sleep deprivation homeostatic curve
Format.Color = getColors(1, '', 'red');
plot2process(SleepStarts([1 3]), SleepEnds([1 3]), SleepMidpoint,  'homeostatic', Format);

% homeostatic curve
Format.Color = getColors(1, '', 'yellow');
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'homeostatic',  Format);

% circadian cycle
Format.Color = getColors(1, '', 'blue');
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'circadian',  Format);


% background information
Format.Color = 'k';
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'labels', Format);

legend({'Sleep deprivation', 'Homeostatic process', 'Circadian process'})
set(legend, 'location', 'northwest')