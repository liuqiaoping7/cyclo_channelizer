function plot_channels(channels, f_s, titles)
    if nargin < 3
        titles = cell(length(channels), 1);
    end
    num_channels = length(channels);
    if num_channels == 2
        factors = [1 2];
    else
        factors = factor(num_channels);
        if length(factors) == 1
            if max(factors(1) == [3 5])
                factors = [1 factors];
            else
                factors = factor(num_channels + 1);
            end
        end
        while length(factors) > 2
            [val, idx] = min(factors);
            factors(idx) = [];
            [o_val, o_idx] = min(factors);
            factors(o_idx)  = val*o_val;
        end
    end

    figure;
    for i=1:num_channels
        subplot(factors(1), factors(2), i);
        plot_spectrum(channels{i}, f_s(i), 1024);
        title(titles{i});
    end
end
