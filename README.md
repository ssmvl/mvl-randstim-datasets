# MVL Random Stimulus Datasets

## About the Project

_MVL Random Stimulus Datasets_ is a collection of datasets, each of which includes stimulus images and MATLAB scripts to generate the images. The datasets in the current collection are as follows:

* _Splash-Categorical_ contains simple random shapes whose contour is defined by the sum of multiple sine waves of varying frequencies. The shapes are divided into 6 subsets of 25 images each, based on the similarity of the Fourier components comprising the contour. The images are labeled with a subset name (A-F) and an image number (001-025).

![Thumbnails of all splash-categorical images](https://github.com/ssmvl/mvl-randstim-datasets/blob/main/splash-categorical/thumbnails.png?raw=true)

* _Splash-Continuous_ contains simple random shapes, sampled from a planar dimension of the Fourier components comprising the contour. The dataset contains i) shapes sampled from two linear dimensions (orthogonal to each other), ii) shapes sampled from a circular dimension, and iii) shapes sampled from the planar dimension. Example shapes sampled from the planar dimension are shown below:

![Splash shapes sampled from a planar dimension](https://github.com/ssmvl/mvl-randstim-datasets/blob/main/splash-continuous/preview-planar-dim.png?raw=true)

* _Zebra-Categorical_ contains blobs with zebra-like patterns defined by white noise and a bandpass filter. The blobs are divided into 6 subsets of 25 images each, based on the similarity of the Fourier components comprising the pattern. The images are labeled with a subset name (A-F) and an image number (001-025).

![Thumbnails of all zebra-categorical images](https://github.com/ssmvl/mvl-randstim-datasets/blob/main/zebra-categorical/thumbnails.png?raw=true)

* _Zebra-Continuous_ contains blobs with zebra-like patterns, sampled from a planar dimension of the Fourier components comprising the pattern. The dataset contains i) blobs sampled from two linear dimensions (orthogonal to each other), ii) blobs sampled from a circular dimension, and iii) blobs sampled from the planar dimension. Example blobs sampled from the planar dimension are shown below:

![Zebra blobs sampled from a planar dimension](https://github.com/ssmvl/mvl-randstim-datasets/blob/main/zebra-continuous/preview-planar-dim.png?raw=true)

## Getting Started

### Splash Categorical

Run the following scripts to generate splash shape images:
```
>> Step1_GenerateImages
>> Step2_BuildDataset
```
Or you may use the pre-generated images in the `imgs-dataset/` directory.

### Splash Continuous

Run the following scripts to generate splash shape images:
```
>> Step1_GeneratePreview
>> Step2_BuildDataset
```
Or you may use the pre-generated images in the `imgs-dataset/` directory.

### Zebra Categorical

Run the following scripts to generate zebra blob images:
```
>> Step1_GenerateImages
>> Step2_BuildDataset
```
Or you may use the pre-generated images in the `imgs-dataset/` directory.

### Zebra Continuous

Run the following scripts to generate zebra blob images:
```
>> Step1_GeneratePreview
>> Step2_BuildDataset
```
Or you may use the pre-generated images in the `imgs-dataset/` directory.
