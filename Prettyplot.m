% plot I used for the title page of a presentation

LA = 0; % lower asymptote
UA = 1; % upper asymptote

fs = 20; % sample rate per hour

% colors
% Dark = [34 59 103]/255;
Dark = 'w';
LW_Sleep = 10;
Size_Day = LW_Sleep*10;


% night 1
SD1 = 4; % sleep duration
S_SO = .56; % the level of S at sleep onset

S_n1 = sleep(SD1, S_SO, LA, fs);


% day
WD = 24; % wake duration
S_WU = S_n1(end); % the level of S at wake onset
S_d = wake(WD, S_WU, UA, fs);

% night 2
SD2 = 8;
S_n2 = sleep(SD2, S_d(end), LA, fs);

figure('Units','normalized', 'Position', [0 0 .8 .7], 'Color', 'k')
hold on
t = linspace(0, SD1+WD+SD2, (SD1+WD+SD2)*fs);

t1 = numel(S_n1);
plot(t(1:t1), S_n1, 'LineWidth', LW_Sleep, 'Color', Dark)

t2 = t1+numel(S_d);
t_scatter = t(t1+1:t2);
S_scatter = S_d;
t_scatter = t_scatter(1:15:numel(t_scatter));
S_scatter = S_scatter(1:15:numel(S_scatter));
scatter(t_scatter, S_scatter, Size_Day, unirainbow(numel(S_scatter)), 'filled')

t3 = t2+numel(S_n2);
plot(t(t2+1:end), S_n2, 'LineWidth', LW_Sleep, 'Color', Dark)
axis tight
axis off

InSet = get(gca, 'TightInset');
set(gca, 'Position', [InSet(1:2), 1-InSet(1)-InSet(3), 1-InSet(2)-InSet(4)])
set(gcf,'InvertHardcopy', 'off')







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% functions

function S = sleep(SD, S_SO, LA, fs)
tau_d = 2.16;

t = linspace(0, SD, SD*fs);
S = (S_SO - LA)*exp(-t/tau_d)+LA;

end

function S = wake(WD, S_WU, UA, fs)
tau_i = 19.9; % empirically derived value

t = linspace(0, WD, WD*fs);
S = (S_WU - UA)*exp(-t/tau_i) + UA;
end