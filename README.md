# 3D MAPs 

![image](https://user-images.githubusercontent.com/58815992/112968685-33120a00-9155-11eb-82f9-8bdd4cc9308e.png)

3D MAPs performs morphometric and statistical analysis of cells and nuclei in a whole tissue in matlab. 

This code was written by Paul Villoutreix and Ankit Agrawal. To learn about 3D MAPs, read the [preprint](https://www.biorxiv.org/content/10.1101/2020.07.28.225409v1/).

## System Requirements

Linux, Windows and Mac OS are supported for running the code. 3D MAPs scripts are written and compiled with MATLAB version R2016b and depend on MATLAB toolbox "Statistics and Machine Learning Toolbox" and "symbolic math toolbox". It requires at least 8GB RAM, but was tested primarily on a workstation with Windows 10 and 512 GB RAM. 

## Installation

This process should take less than 10 minutes.

1. Install MATLAB version 2016b or later.
2. Download the files from the 3D MAPS repository. You can do this by cloning the repository or by downloading it as a ZIP folder.
3. Unzip the folder and place your data inside of the folder titled "data". An example dataset can be found in the supplementary section of the manuscript.



## Creating Alignment_Matrix.dat

This step is not required if the input data is already aligned or if you do not want to produce a spatial profile along a specific axis. 

Here we perform registration of growth plates based on the principal eigenvector of the centroids of the nuclei.

1. Make sure the following are inside the data\subfolder. For example, if the data directory name is "Nuclei_and_Cells_DU_S96_m3_mut" then make sure the following files are inside the data\Nuclei_and_Cells_DU_S96_m3_mut


       Tile_coordinates.xlsx 

       c_n_pos01 (Characteristics).mat,
       c_n_pos02 (Characteristics).mat,
       c_n_pos03 (Characteristics).mat, ... etc

2. Open the script "Bone_registration_using_eigenvector" and set the directory of each growth plate sample which you want to register.
If you want to register both proximal and distal samples of the same type of growth plate then ignore_distal and ignore_proximal variables are false.
Otherwise depending on the availability of distal or proximal samples these variables should be defined as true or false.


 ```
ignore_distal=false;
ignore_proximal=true;

```



4. Set the data path.
Below is an example for setting the data path of two distal ulna samples.

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

8.  Run "manualRegistrationCheck" from the script editor or command line. It will create a file called ??Alignment_matrix file in the parent directory. Rename it as ??Alignment_matrix.dat and place each into its own subfolder directory.


        data\Nuclei_and_Cells_DU_S96_m3_mut\Alignment_matrix.dat

*Notes: If the alignment is not good enough, the rotation matrices can be multiplied with required angles to get the new 3x3 rotation matrix for correct alignment between bone samples. 

## Running 3D MAPs
This script produces interactive matlab figures and .png image files of 3D Morphology maps and two types of spatial profiles: spatial profile of the grid averages and a spatial profile of individual cells and nuclei to be used for statistical analysis. 


Cell and Nuclei features: volume (micron<sup>3</sup>), surface area (micron<sup>2</sup>), sphericity, vol<sup>2/3</sup>/sa, density, delaunay density, object number, PC 1/2/3 coefficient and orientation, ratio of PC 2/1, ratio of PC 3/2, ratio of PC 3/1, and occupation (%).

Crossed features (features relating cells and nuclei): nucleus/cell volume ratio, % correspondence, object number, centroid shift (%), nucleus and cell alignment of PC 1/2/3.
 
1. Open the script "main" in MATLAB by double clicking it.
2. Initialize and set the data path.

![image](https://user-images.githubusercontent.com/58815992/112810236-7e5be800-9083-11eb-893d-867919d35533.png)

3. Set the grid size for averaging and the bin size for the two types of spatial profiles.

![image](https://user-images.githubusercontent.com/58815992/112810752-09d57900-9084-11eb-8e57-81359467b531.png)

4. Set the viewing angle of the 3D morphology maps.

![image](https://user-images.githubusercontent.com/58815992/112811159-72bcf100-9084-11eb-979d-56f9e0d24517.png)

5. Set which maps you want to run. 1 = run 0 = don't run. It is recommended to run all of the maps at least once,to evaluate the data. 

![image](https://user-images.githubusercontent.com/58815992/112812567-f5927b80-9085-11eb-9578-895481be8896.png)

6. Set the data path and names for the statistical spatial profiles.

![image](https://user-images.githubusercontent.com/58815992/112813155-92edaf80-9086-11eb-8e45-01ee1de29d5d.png)

*Notes: After running the first time the following files will be created in the data path. These are required to produce the figures. This part takes the longest. If you want to start over from scratch, i.e. more (characteristics).mat files were added or modified, then delete the following files and run the main script again.

![image](https://user-images.githubusercontent.com/58815992/112814949-79e5fe00-9088-11eb-97cd-00cf994f22bb.png)


If you only want to change the grid size then delete only the grid files highlighted below.

![image](https://user-images.githubusercontent.com/58815992/112814835-5d49c600-9088-11eb-99a7-7a191c541435.png)


## License
[Apache-2.0](https://opensource.org/licenses/Apache-2.0)
