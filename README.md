## Project 1: Exploratory Data Analysis
### Dataset
<b>Electric power consumption</b>: Downloded from UCI repository.
Zipped format size: 20MB
Unzipped format size: 133MB

Since downloading the file then unzipping it takes a while, I included the code to do so in plot1.R only. In plot2.R, plot3.R, and plot4.R, I assumed that the data file is in the current directory.

The required work deals with February first and second 2007 only. To reduce the loading time and to optimize memory usage, only data related to these 2 days are loaded. I'm assuming that the file doesn't change, i.e. 1/2/2007 starts at line 66638 and 2 days takes 2880 rows (60*24*2)

### Executing the code
It is required to run plot1.R first to download and unzip the data file.
plot1.R produces plot1.png

The remaining plotX.R could be run in any order assuming that the data file is already in the current directory.




