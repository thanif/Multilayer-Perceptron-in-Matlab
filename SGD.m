function [] = SGD(biases,weights,sizes,training_data,test_data, epochs, eta)
%        Train the neural network using full-batch stochastic
%        gradient descent.  The ``training_data`` is a struct of arrays
%        ``(x, y)`` representing the training inputs and the desired
%        outputs. If ``test_data`` is provided then the
%        network will be evaluated against the test data after each
%        epoch, and partial progress printed out.  This is useful for
%       tracking progress, but slows things down substantially."""
                      
    global max_train_label;
    global max_test_label;
    
    train_error = 0;
    test_error = 0;
    
    for j =1:epochs    
       
        
        
        [weights, biases, db, dw] = update_parameters(training_data, sizes, eta,weights, biases);
         
        nc = max_train_label;
        
        [error] = evaluate(biases,weights,sizes,training_data,nc);   
        
        
        train_x(j) = j;
        train_y(j) = error;
        
        train_error = train_error + error;
        
        nc = max_test_label;
        
        [error] = evaluate(biases,weights,sizes,test_data,nc);   
        
        
        test_x(j) = j;
        test_y(j) = error;
        
        test_error = test_error + error;
        
        
        
    end
    
    
    subplot(2,1,1)
    plot(train_x,train_y)
    title('Training Error')
    xlabel('Epochs') 
    ylabel('Error') 
    
    
    subplot(2,1,2)
    plot(test_x,test_y)
    title('Test Error')
    xlabel('Epochs') 
    ylabel('Error')
    
    train_error = train_error./j
    test_error = test_error./j
    

end