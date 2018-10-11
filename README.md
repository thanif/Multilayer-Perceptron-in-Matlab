# Multilayer-Perceptron-in-Matlab
Implementation of MLP in Matlab using House Price Prediction Dataset

70% of data has been used for training while 30% for test phase.

Training data is randomly shuffled for every epoch.

All train labels are divided by the max value of training labels for training the network and all the network outputs are multiplied by the same max value at the time of prediction as last layer uses sigmoid as activation so to keep the mappings correct, these steps are performed.
