# 3D MAPs

3D MAPs performs morphometric and statistical analysis of cells and nuclei in a whole tissue in matlab. 

This code was written by Paul Villoutreix and Ankit Agrawal. To learn about 3D MAPs, read the [preprint](https://www.biorxiv.org/content/10.1101/2020.07.28.225409v1/).

## System Requirements

Linux, Windows and Mac OS are supported for running the code. 3D MAPs scripts are written and compiled with MATLAB version R2016b and depend on MATLAB toolbox "Statistics and Machine Learning Toolbox". It requires at least 8GB RAM, but was tested primarily on a workstation with Windows 10 and 512 GB RAM. 

## Installation

This process should take less than 10 minutes.

1. Install MATLAB version 2016b or later.
2. Download the files from the 3D MAPS repository. You can do this by cloning the repository or by downloading it as a ZIP folder.
3. Unzip the folder and place your data inside of the folder titled "data" (See Running 3D MAPs). An example dataset can be found in the supplementary section of the manuscript.



## Creating Alignment_Matrix.dat

This step is not required if the input data is already aligned or if you do not want to produce a spatial profile along a specific axis. 

Here we perform registration of growth plates based on an eigenvector matrix.

1. Make sure the following are inside the data\subfolder


       Tile_coordinates.xlsx 

       c_n_pos01 (Characteristics).mat,
       c_n_pos02 (Characteristics).mat,
       c_n_pos03 (Characteristics).mat, ... etc

2. Open the script "Bone_registration_using_eigenvector" in MATLAB by double clicking it.

3. Set the following variables as "true" or "false" depending if you are registering proximal or distal growth plates. The following code below will register only the distal growth plates in the data\subfolder

 ```
ignore_distal=false;
ignore_proximal=true;

```
4. Set the data path

```
path_distal='data\Nuclei_and_Cells_DU_S84_m3_wt\','data\Nuclei_and_Cells_DU_S96_m3_mut\';
path_proximal='';
```

5. Run "Bone_registration_using_eigenvector" from the script editor or command line. It will create a file called AlignedXYZ.mat

6. To visualize and evaluate the registration Open the script "manualRegistrationCheck" in MATLAB by double clicking it.

7. Set the data path , legendname. and color. The following code below will show the wt DU sample in red and the mutant DU sample in blue. You can visualize as many as you'd like by adding registered samples to the list below.

```
dt_data_path={  'data\Nuclei_and_Cells_DU_S84_m3_wt\', 'data\Nuclei_and_Cells_DU_S96_m3_mut\'};
legendname={'m3 wt', 'm3 mut'};
mycolor={'r*','b*'};
```

8.  Run "manualRegistrationCheck" from the script editor or command line. It will create a file called  Alignment_matrix file in the parent directory. Rename it as  Alignment_matrix.dat and place each into its own subfolder directory.


        data\Nuclei_and_Cells_DU_S96_m3_mut\Alignment_matrix.dat

## Running 3D MAPs
This script produces interactive matlab figures and .png image files of 3D Morphology maps and two types of spatial profiles: spatial profile of the grid averages and a spatial profile of individual cells and nuclei to be used for statistical analysis. 

Cell and Nuclei features: volume (micron^3), surface area (micron^2), sphericity, vol^2/3/sa, density, delaunay density, object number, PC 1/2/3 coefficient and orientation, ratio of PC 2/1, ratio of PC 3/2, ratio of PC 3/1, and occupation (%).

Crossed features (features relating cells and nuclei): nucleus/cell volume ratio, % correspondence, object number, centroid shift (%), nucleus and cell alignment of PC 1/2/3.
 
1. Open the script "main" in MATLAB by double clicking it.

## License
[Apache-2.0](https://opensource.org/licenses/Apache-2.0)
