% Exercise 2 - Areeba Irfan - 400378045 - irfana20
clear all; close all %#ok<CLALL> reset everything

% phase velocity
c = 299792458;        % speed of light
eps_r = 1.0;          % relative permittivity
vp = c / sqrt(eps_r); % phase velocity

% frquency parameters
f = 1e7; 
omega = 2*pi*f;
T = 1/f;
lambda = vp/f;

% spatial and temporal axes
dz = (3 * lambda); z = linspace(-dz, +dz, 1001);
dt =  3*T; t = linspace(-dt, +dt, 3001);

% function for a sine wave
h = @(tau) 5*cos(omega*tau);

% function for the corresponding wave over all points z at single time ti
wave = @(z, ti) h(ti - z / vp);

% plot specification
subplot(3, 1, 1)                                  % 3x1 grid, 1st plot
line1 = animatedline('Color', 'red');             % line in the plot
title("sine wave traveling in +z direction") % title
xlabel("z [m]"); ylabel("amplitude")              % axis labels
xlim(z([1 end])); ylim([-5 5])                     % axis limits

subplot(3, 1, 2)                                  % 3x1 grid, 2nd plot
line2 = animatedline('Color', 'blue');            % line in the plot
title("sine wave traveling in +z direction") % title
xlabel("z [m]"); ylabel("amplitude")              % axis labels
xlim(z([1 end])); ylim([-5 5])                     % axis limits

subplot(3, 1, 3)                                  % 3x1 grid, 3rd plot
line3 = animatedline('Color', 'magenta');         % line in the plot
title("Superposition of Waves") % title
xlabel("z [m]"); ylabel("amplitude")              % axis labels
xlim(z([1 end])); ylim([-10 10])                     % axis limits

% animation instructions
for ti = t
    clearpoints(line1)
    clearpoints(line2)
    clearpoints(line3)
    addpoints(line1, z, wave(+z, ti))
    addpoints(line2, z, wave(-z, ti))
    addpoints(line3, z, wave(+z, ti) + wave(-z, ti))
    drawnow limitrate
end