clc;
clear all;
close all;
warning off;

% Load pre-trained AlexNet
g = alexnet;
layers = g.Layers;

% Load dataset
allImages = imageDatastore('Database', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

% Data augmentation (rotation and translation)
augmentor = imageDataAugmenter('RandRotation', [-10, 10], 'RandXTranslation', [-5, 5], 'RandYTranslation', [-5, 5]);
augmentedImages = augmentedImageDatastore([227 227], allImages, 'DataAugmentation', augmentor);

% Count the number of classes
numClasses = numel(unique(allImages.Labels));

% Adjust layers for transfer learning
layers(23) = fullyConnectedLayer(numClasses);  % Fully connected layer for the dataset's number of classes
layers(24) = softmaxLayer;                     % Softmax activation function
layers(25) = classificationLayer;              % Classification layer

% Training options
opts = trainingOptions('sgdm', ...
    'InitialLearnRate', 0.001, ...
    'MaxEpochs', 20, ...
    'MiniBatchSize', 64, ...
    'ValidationFrequency', 30, ...
    'ValidationPatience', 5, ...
    'Plots', 'training-progress', ...
    'Shuffle', 'every-epoch', ...
    'ExecutionEnvironment', 'auto');  % Use GPU if available

% Train the network
[myNet1, info] = trainNetwork(augmentedImages, layers, opts);

% Save the trained model
save('myNet1.mat', 'myNet1');
disp('Model training completed and saved.');
