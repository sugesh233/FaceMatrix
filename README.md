# 🧠 FaceMatrix
**A Real-Time Face Recognition System in MATLAB**

**FaceMatrix** is a MATLAB-based facial recognition pipeline for collecting facial image data, cleaning datasets, and training machine learning models. Designed for ease of use and quick deployment, this toolkit is ideal for academic research, machine learning practice, and facial image classification tasks.

---

## 📌 Key Features

- 📷 Real-time image collection from a webcam
- 🧹 Scripted cleanup of image datasets
- 🧠 Train and load facial recognition models
- 🛠️ Modular and beginner-friendly MATLAB code

---

## 📁 Project Structure

```bash
FaceMatrix/
├── datacollection.m      # Collect facial image data using webcam
├── deleteimages.m        # Remove or clean unwanted images
├── model.m               # Define or load a classification model
├── modeltraining.m       # Train the model using the collected data
````

---

## 🚀 Getting Started

### 📦 Requirements

* MATLAB R2020b or later
* Image Processing Toolbox
* Statistics and Machine Learning Toolbox
* A connected webcam for image capture

---

## ▶️ Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/sugesh233/FaceMatrix.git
   cd FaceMatrix
   ```

2. Open MATLAB and navigate to the `FaceMatrix` folder.

3. Run the following scripts in order:

   ```matlab
   datacollection     % Step 1: Collect facial images
   deleteimages       % Step 2: (Optional) Clean dataset
   modeltraining      % Step 3: Train the model
   model              % Step 4: Load or test the model
   ```

---

## 🛡️ License

This project is licensed under the MIT License.
See [`LICENSE`](./LICENSE) for more information.

---

## 👤 Author

Developed by [Sugesh](https://github.com/sugesh233)

Feel free to star ⭐ the repository or fork it for your own experiments!

---

