clc; close all; clear;
c = webcam; % Initialize webcam
load myNet1; % Load pre-trained neural network
faceDetector = vision.CascadeObjectDetector; % Initialize face detector

figure; % Create a figure for real-time display

while true
    try
        % Capture a frame from the webcam
        e = c.snapshot;

        % Detect faces in the frame
        bboxes = step(faceDetector, e);

        if ~isempty(bboxes)
            % Loop through each detected face
            for i = 1:size(bboxes, 1)
                % Crop and preprocess each face
                es = imcrop(e, bboxes(i, :));
                es = imresize(es, [227 227]);

                % Classify the face
                label = classify(myNet1, es);

                % Draw bounding box and label on the image
                e = insertObjectAnnotation(e, 'rectangle', bboxes(i, :), char(label), ...
                                           'Color', 'red', 'FontSize', 14);
            end
        else
            % No face detected
            e = insertText(e, [10 10], 'No Face Detected', ...
                           'FontSize', 20, 'BoxColor', 'yellow', 'BoxOpacity', 0.6);
        end

        % Display the frame with annotations
        imshow(e);
        title('Real-Time Face Detection and Classification');
        drawnow;

    catch ME
        % Handle errors (e.g., webcam disconnection or other issues)
        disp('Error occurred:');
        disp(ME.message);
        break; % Exit the loop on error
    end
end

clear c; % Release the webcam