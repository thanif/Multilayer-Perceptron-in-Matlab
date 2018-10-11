function [sigmx]=Sigm(x)
% Implements a sigmoid function

    sigmx = exp(-x);
    sigmx = 1+sigmx;
    sigmx = 1./sigmx;

end
