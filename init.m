function [biases, weights ] = init(sizes)

%        The list ``sizes`` contains the number of neurons in the
%        respective layers of the network.  For example, if the list
%        was [2, 3, 1] then it would be a three-layer network, with the
%        first layer containing 2 neurons, the second layer 3 neurons,
%        and the third layer 1 neuron.  The biases and weights for the
%        network are initialized randomly, using a Gaussian
%        distribution with mean 0, and variance 1.  Note that the first
%        layer is assumed to be an input layer, and by convention we
%        won't set any biases for those neurons, since biases are only
%        ever used in computing the outputs from later layers."""

    y = sizes(2:end);

    for i =1:numel(sizes(2:end))
        
        a=y(i);    
        biases(i).bias=randn(a,1);
        weights(i).weight = randn(sizes(i+1), sizes(i));
          
    end 
    
end