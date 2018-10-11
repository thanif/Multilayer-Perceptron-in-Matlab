clc;clear;close all;

inputs = input('Please enter the number of inputs: ');
outputs = input('Please enter the number of outputs: ');
hidden_layers = input('Please enter the number of hidden layers: ');
for i=1:hidden_layers
    
   
    fprintf('Hidden Layer : %d .\n', i);
    nodes(i) = input('Please enter the number of nodes: ');

end
epochs = input('Please enter the number of epochs: ');
eta = input('Please enter the learning rate: ');

global max_train_label;
global max_test_label;

sizes(1) = inputs;

for i=1:hidden_layers
    
   sizes(i+1) = nodes(i);
    
end 

sizes(numel(sizes)+1) = outputs;

[biases,weights] = init(sizes);


filename = 'housing.data';
delimiterIn = ' ';
A = importdata(filename,delimiterIn);

[rows,cols]=size(A);

A = A';


max_train_label = max(A(14,1:floor(rows*0.70)+1));

for i=1:floor(rows*0.70)+1
   
    training_data(i).x = A(1:13,i);
    training_data(i).y = A(14,i)./max_train_label ;
    
end





max_test_label = max(A(14,i:i+floor(rows*0.30)));


for j=1:floor(rows*0.30)+1
   
    test_data(j).x = A(1:13,i);
    test_data(j).y = A(14,i)./max_test_label;
    i=i+1;
    
end


SGD(biases,weights,sizes,training_data,test_data, epochs, eta)