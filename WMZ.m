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
% SleepMidpoint = 3.5; % circadian midpoint of sleep
SleepMidpoint = 4.5; % circadian midpoint of sleep

figure('units','centimeters','position',[0 0 25, 11])
SleepStarts = [0 24, 72]; % hours from first midnight
SleepEnds = SleepStarts + 8;

hold on

% circadian cycle
Format.Color = getColors(1, '', 'blue');
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'circadian',  Format);


% homeostatic curve
Format.Color = getColors(1, '', 'gray');
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'homeostatic',  Format);


% background information
Format.Color = 'k';
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'labels', Format);

legend({'Circadian process', 'Homeostatic process'})
set(legend, 'location', 'northwest', 'ItemTokenSize', [10 10])

ylim([0 4])
title('8/40 sleep deprivation', 'FontSize', 20)


figure('units','centimeters','position',[0 0 25, 11])
SleepStarts = [0 24, 52 72]; % hours from first midnight
SleepEnds = SleepStarts+[8 4 7.5 8];

hold on

% circadian cycle
Format.Color = getColors(1, '', 'blue');
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'circadian',  Format);

% homeostatic curve
Format.Color = getColors(1, '', 'yellow');
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'homeostatic',  Format);



% background information
Format.Color = 'k';
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'labels', Format);

legend({'Circadian process', 'Homeostatic process'})
set(legend, 'location', 'northwest', 'ItemTokenSize', [10 10])

ylim([0 4])
title('4/24 extended wake', 'FontSize', 20)



%%

figure('units','centimeters','position',[0 0 20, 11])
SleepStarts = [0 24]; % hours from first midnight
SleepEnds = SleepStarts + 8;

hold on

% circadian cycle
Format.Color = getColors(1, '', 'blue');
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'circadian',  Format);


% homeostatic curve
Format.Color = getColors(1, '', 'red');
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'homeostatic',  Format);


% background information
Format.Color = 'k';
plot2process(SleepStarts, SleepEnds, SleepMidpoint, 'labels', Format);

% legend({'Circadian process', 'Homeostatic process'})
% set(legend, 'location', 'northwest', 'ItemTokenSize', [10 10])

