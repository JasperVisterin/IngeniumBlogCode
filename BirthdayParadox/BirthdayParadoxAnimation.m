%% Extended Birthday Paradox Animation
%   Green  = free birthday
%   Red    = one person
%   Yellow = two people (pair)
%   Orange = three people (triplet)
%   Purple = four or more people

clc;
clear;
close all;

N = 365;                         % Number of birthdays
n_people = 100;                  % Number of simulated people

n_size = ceil(sqrt(N));          % Grid dimensions
n_grid = n_size^2;               % Amount of grid cells

pause_time = 0.08;

birthday_vector = zeros(n_grid,1);
birthday_vector(N+1:end) = NaN; % These cells will always be green

figure('Color','w');

% Colormap:
% 0 = free
% 1 = single
% 2 = pair
% 3 = triplet
% 4+ = quadruple+

cmap = [
    0.30 0.80 0.30   % green
    0.90 0.20 0.20   % red
    1.00 0.90 0.20   % yellow
    1.00 0.55 0.10   % orange
    0.60 0.30 0.80   % purple
];


for person = 1:n_people

    bday = randi([1 N]);

    birthday_vector(bday) = birthday_vector(bday) + 1;

    display_vector = birthday_vector;

    display_vector(display_vector >= 4) = 4;

    M = reshape(display_vector,n_size,n_size);

    clf;

    imagesc(M);

    colormap(cmap);
    clim([0 4]);

    axis equal tight;

    set(gca,...
        'XTick',[],...
        'YTick',[]);

    hold on;

    for k = 0.5:1:n_size+0.5

        plot([0.5 n_size+0.5],[k k],...
            'k','LineWidth',0.5);

        plot([k k],[0.5 n_size+0.5],...
            'k','LineWidth',0.5);

    end

    n_single   = sum(birthday_vector == 1);
    n_pairs    = sum(birthday_vector == 2);
    n_triplets = sum(birthday_vector == 3);
    n_quad     = sum(birthday_vector >= 4);

    title({
        'Birthday Paradox Simulation'
        sprintf('People in room: %d',person)
        ''
        'Green = free birthday'
        'Red = one person'
        'Yellow = two people share a birthday'
        'Orange = three people share a birthday'
        'Purple = four or more people share a birthday'
        },...
        'FontSize',14);


    text(1,n_size+1.8,...
        sprintf(['Singles: %d    Pairs: %d    ' ...
                 'Triplets: %d    Quadruples+: %d'],...
                 n_single,...
                 n_pairs,...
                 n_triplets,...
                 n_quad),...
                 'FontSize',12,...
                 'FontWeight','bold');

    hold off;

    drawnow;

    pause(pause_time);

end
