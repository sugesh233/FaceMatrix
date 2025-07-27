% Path to the folder containing images
folderPath = 'C:\Users\suges\Downloads\punithmatlab\Database\Sugesh\';  % Change this to your folder path
imageFiles = dir(fullfile(folderPath, '*.bmp'));  % Get all BMP files in the folder

% Create a face detector object
faceDetector = vision.CascadeObjectDetector();

% Loop through each image file
for k = 1:length(imageFiles)
    % Get the full path of the current image
    imagePath = fullfile(folderPath, imageFiles(k).name);
    
    % Read the image
    img = imread(imagePath);
    
    % Detect faces in the image
    bbox = step(faceDetector, img);  % bbox contains bounding boxes for faces
    
    % Check if faces are detected
    if isempty(bbox)
        % No faces detected, delete the image
        delete(imagePath);
        fprintf('Deleted image: %s (no faces detected)\n', imageFiles(k).name);
    else
        fprintf('Found faces in image: %s\n', imageFiles(k).name);
    end
end
