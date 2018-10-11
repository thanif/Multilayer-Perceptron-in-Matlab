function [db,dw] = backpropagation(input,sizes,output,weights,biases)
    
    y = sizes(2:end);

    for i =1:numel(sizes(2:end))
        
        a=y(i);
        db(i).db = zeros(a,1);
        dw(i).dw = zeros(sizes(i+1), sizes(i));
        
    end 

    out(1).out = [input];
       
    for i =1:numel(sizes(2:end))
        
        
        net_out = weights(i).weight*input + biases(i).bias;
        %weights(i).weight
        %input
        %biases(i).bias
        %net_out
        net(i).net= net_out;
        sig_out = Sigm(net_out);
        out(i+1).out = sig_out;
        input = sig_out;
        
    end

    delta = cost_derivative(out(numel(sizes(2:end))+1).out,output).*DSigm(net(numel(sizes(2:end))).net);
    db(numel(sizes(2:end))).db = delta;
    dw(numel(sizes(2:end))).dw = delta*out(numel(sizes(2:end))).out';
    
    for l =1:numel(sizes(2:end))-1
        
        net_out = net(numel(sizes(2:end))-l).net;
        dnet = DSigm(net_out);
        delta_new = (transpose(weights(numel(sizes(2:end))-l+1).weight)*delta).*dnet;
        delta = delta_new;
        db(numel(sizes(2:end))-l).db = delta;
        %delta
        %out(numel(sizes(2:end))-l).out
        dw(numel(sizes(2:end))-l).dw = delta*transpose(out(numel(sizes(2:end))-l).out);
            
    end 
end