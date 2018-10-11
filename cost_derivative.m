function [dc] = cost_derivative(out, output)

    dc = (out - output);
    
end