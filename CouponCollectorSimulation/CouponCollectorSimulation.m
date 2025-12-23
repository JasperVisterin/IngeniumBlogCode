%% Coupon Collector Simulation
T = 1000;   % number of experiments
N = 100;    % number of unique items

average_items_needed = nan(1,T);
items_needed_list   = zeros(1,T);

expected_value = N * harmonic_sum(N);
running_sum = 0;

figure('Color','w','Position',[200 200 1100 500]);

for t = 1:T
    collected = false(1,N);
    items_needed = 0;

    while ~all(collected)
        items_needed = items_needed + 1;
        collected(randi(N)) = true;
    end

    items_needed_list(t) = items_needed;
    running_sum = running_sum + items_needed;
    average_items_needed(t) = running_sum / t;

    subplot(1,2,1)
    cla
    plot(1:t, average_items_needed(1:t), 'b', 'LineWidth', 2); hold on
    plot([1 t], expected_value*[1 1], 'r--', 'LineWidth', 2)

    xlabel('Number of completed experiments')
    ylabel('Average number of draws needed')
    title({'Coupon Collector Simulation', ...
           'Draw new items per experiment until all items are collected'})
    legend({'Simulation average','Expected amount of draws'}, ...
           'Location','northeast')

    text(0.5,0.05, ...
        sprintf('Each experiment:\nDraw items until all %d are collected',N), ...
        'Units','normalized','FontSize',10,'BackgroundColor','w')

    grid on

    subplot(1,2,2)
    cla
    histogram(items_needed_list(1:t), ...
        'Normalization','pdf', ...
        'FaceColor',[0.2 0.6 0.8], ...
        'EdgeColor','none', ...
        'FaceAlpha',0.85)

    xlabel('Number of draws needed to complete collection')
    ylabel('Probability density')
    title({'Distribution of completion time: some collections','take much longer than others to complete'})
    grid on

    drawnow
end

%% Harmonic sum function
function S = harmonic_sum(N)
    S = sum(1./(1:N));
end
