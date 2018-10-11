function [out] = feedforward(biases,weights,sizes,input)
% Perform a cmplete forward pass through the network
   
        for i =1:numel(sizes(2:end))
            
        z = weights(i).weight*input + biases(i).bias;
        out = Sigm(z);
        input=out;
        
        end
   
end        