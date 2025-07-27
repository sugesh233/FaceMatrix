clc;
clear all;
close all;
warning off;

% Initialize webcam
try
    cao = webcam;  % Create webcam object
catch
    error('Webcam not detected. Please connect a webcam and try again.');
end

% Create face detector object
faceDetector = vision.CascadeObjectDetector;
c = 150;  % Number of face images to capture
temp = 0;  % Counter for saved images

% Specify output folder
outputFolder = 'Sugesh';  % Folder for storing images
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Base filename for saved images
baseFilename = 'face_image_';  

% Main loop to capture images
while true
    % Capture snapshot
    e = cao.snapshot;

    % Detect faces
    bboxes = step(faceDetector, e);

    if ~isempty(bboxes)
        if temp >= c
            break;  % Stop after capturing the desired number of images
        else
            for i = 1:size(bboxes, 1)
                % Crop and resize detected face
                es = imcrop(e, bboxes(i, :));
                if size(es, 1) > 50 && size(es, 2) > 50  % Filter out very small detections
                    es = imresize(es, [227 227]);

                    % Save image with incremental filename
                    filename = fullfile(outputFolder, strcat(baseFilename, num2str(temp), '.bmp'));
                    imwrite(es, filename);
                    temp = temp + 1;

                    % Display progress
                    imshow(es);
                    title(['Captured Image: ' num2str(temp) ' / ' num2str(c)]);
                    drawnow;
                end
            end
        end
    else
        % Show message if no face is detected
        imshow(e);
        title('No face detected. Please position your face in front of the camera.');
        drawnow;
    end
    
    % Add small delay
    pause(0.1);
end

% Completion message
disp(['Captured ' num2str(temp) ' face images.']);
