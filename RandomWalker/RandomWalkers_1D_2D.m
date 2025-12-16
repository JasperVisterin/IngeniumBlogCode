%% 1D random walker
T = 999; % amount of turns
N = 250; % amount of random walkers

x_final = zeros(1,N); 

figure;
for k = 1:N
    x_ = zeros(1,T+1); % array to store trajectory of the random walker
    
    % let one random walker run
    for t = 1:T
        u = rand; 
    
        % 50 % to turn left
        % 50 % to turn right 
        % we choose a random number between 0 and 1 to decide 
        % which way we are actually going to go

        if u > 1/2 
            x_(t+1) = x_(t) + 1; % go forward
        else 
            x_(t+1) = x_(t) - 1; % go backward
        end
        
    end 
    hold on 
    plot(x_,'LineWidth',2)
    xlabel('Amount of steps taken')
    ylabel('Position of the random walker')
    title('Path of a random walker on a real line')
    grid on
    drawnow
    pause(0.1) % pause to not refresh the plot too fast
    
    x_final(k) = x_(end); 
end

figure; 
histogram(x_final)
xlabel('x-position where walker ends up')
ylabel('Walker counts')
title('Histogram of where the walkers end up')

%% 2D random walker
T = 999;    % number of steps
N = 250;   % number of random walkers

x_final = zeros(1, N);
y_final = zeros(1, N);

figure;
hold on;

for k = 1:N
    % store trajectory
    x = zeros(1, T+1);
    y = zeros(1, T+1);

    % let one random walker run
    for t = 1:T
        u = rand;

        if u < 0.25
            x(t+1) = x(t) + 1;   % right
            y(t+1) = y(t);
        elseif u < 0.50
            x(t+1) = x(t) - 1;   % left
            y(t+1) = y(t);
        elseif u < 0.75
            x(t+1) = x(t);       % up
            y(t+1) = y(t) + 1;
        else
            x(t+1) = x(t);       % down
            y(t+1) = y(t) - 1;
        end
    end

    plot(x, y, 'LineWidth', 1.5)
    xlabel('x-position')
    ylabel('y-position')
    title('2D Random Walk Trajectories')
    axis equal
    grid on
    drawnow

    x_final(k) = x(end);
    y_final(k) = y(end);

    pause(0.1) % pause to not refresh the plot too fast
end

%%
figure;
histogram2(x_final, y_final, 40, 'DisplayStyle', 'tile')
colorbar
xlabel('x final position')
ylabel('y final position')
title('2D Histogram of Final Walker Positions')
axis equal


