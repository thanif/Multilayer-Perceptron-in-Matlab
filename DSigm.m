function [dSigm]=DSigm(o)
% Calculate derivative of sigmoid

    dSigm = 1-Sigm(o);
    dSigm = dSigm.*Sigm(o);

end