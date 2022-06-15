% Dynamics of Sleep Homeostasis. Rusterholz et al. 2010.

LA = 0; % lower asymptote
UA = 1; % upper asymptote

fs = 20; % sample rate per hour

% night 1
SD = 8; % sleep duration
S_SO = .56; % the level of S at sleep onset

S_n1 = sleep(SD, S_SO, LA, fs);


% day
WD = 16; % wake duration
S_WU = S_n1(end); % the level of S at wake onset
S_d = wake(WD, S_WU, UA, fs);

% night 2
S_n2 = sleep(SD, S_d(end), LA, fs);

figure('Units','normalized', 'Position', [0 0 .8 .8])
t = linspace(0, SD+WD+SD, (SD+WD+SD)*fs);
plot(t, [S_n1, S_d, S_n2])


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