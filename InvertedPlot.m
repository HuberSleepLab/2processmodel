
% This plots the classic 2 process model figure, but its now modular, so
% you can plot whichever part you want. You can just comment out the part
% you don't want.

close all
clc
clear

Format = struct();
Format.Line.Width = 5;
Format.Color = 'k';
Format.Text.Color = 'w';
Format.Text.FontSize = 14;
Format.Text.FontName = 'Tw Cen MT';

% SleepStarts = [-1 23, 47]; % hours from first midnight
SleepStarts = [0 24, 48]; % hours from first midnight
SleepEnds = SleepStarts + 8;
SleepMidpoint = 3.5; % circadian midpoint of sleep

figure('units','centimeters','position',[0 0 20, 11])
ylim([0 4])
hold on


% homeostatic curve
% Format.Color = [215, 175, 62]/255; % yellow
% plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'homeostatic',  Format);


% circadian cycle
Format.Color = [78, 121, 196]/255; % blue
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'circadian',  Format);

% background information
Format.Color = 'w';
Format.Text.Color = 'k';
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'labels', Format);


set(gca, 'Color', 'k',  'XColor', 'w')
set(gcf, 'Color', 'k',  'InvertHardcopy', 'off')