% This plots the classic 2 process model figure, but its now modular, so
% you can plot whichever part you want. You can just comment out the part
% you don't want.

close all
clc
clear

Format = struct();
Format.Line.Width = 5;
Format.Color = 'k';
Format.Text.FontSize = 14;
Format.Text.FontName = 'Tw Cen MT';

% SleepStarts = [-1 23, 47]; % hours from first midnight
SleepStarts = [0 24, 48]; % hours from first midnight
SleepEnds = SleepStarts + 8;
SleepMidpoint = 3.5; % circadian midpoint of sleep

figure('units','centimeters','position',[0 0 25, 13])
ylim([0 4])
hold on

Legend = {};

% sleep deprivation homeostatic curve
Format.Color = [208, 78, 60]/255; % red 
plot2process(SleepStarts([1 3]), SleepEnds([1 3]), SleepMidpoint,  'homeostatic', Format);

Legend = cat(2, Legend, 'Sleep deprivation');

% homeostatic curve
Format.Color = [215, 175, 62]/255; % yellow
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'homeostatic',  Format);

Legend = cat(2, Legend, 'Homeostatic process');

% circadian cycle
Format.Color = [78, 121, 196]/255; % blue
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'circadian',  Format);
Legend = cat(2, Legend, 'Circadian process');

% background information
Format.Color = 'k';
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'labels', Format);

legend(Legend)
set(legend, 'location', 'northwest')