function [error] = evaluate(biases,weights,sizes,test_data,nc)

% Returns the error on test data


    error = 0;
    
    
         
    for i=1:numel(test_data)
 
        out = feedforward(biases,weights,sizes,test_data(i).x);  
        
        out = out*nc;
        test_data(i).y = test_data(i).y*nc;
        
        
        error = error + (test_data(i).y - out).^2;
        
    end
    
    error = error./numel(test_data);
    error = sqrt(error);

    
    
    
end