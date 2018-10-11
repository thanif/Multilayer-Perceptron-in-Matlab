function [weights, biases, db, dw] = update_parameters(training_data, sizes, eta,weights, biases)
        
        y = sizes(2:end);

        for i =1:numel(sizes(2:end))
            
            a = y(i);
            db(i).db = zeros(a,1);
            dw(i).dw = zeros(sizes(i+1), sizes(i));
          
        end
        
        shuffled_indices = randperm(numel(training_data));        
       
        for i = 1: numel(training_data)
            
            x = training_data(shuffled_indices(i)).x;
            y = training_data(shuffled_indices(i)).y;
            
            [delta_db, delta_dw] = backpropagation(x,sizes,y,weights,biases);
        
           for j =1:numel(sizes(2:end))
               
              db(j).db=db(j).db + delta_db(j).db;
              
              dw(j).dw = dw(j).dw + delta_dw(j).dw;
              
           end
           
        end
     
        for i =1:numel(sizes(2:end))
            
              weights(i).weight = weights(i).weight - dw(i).dw*(eta/numel(training_data));
              biases(i).bias = biases(i).bias - (eta/numel(training_data)).*db(i).db;
              
        end
end