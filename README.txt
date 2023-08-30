This repository provides the Matlab code for "Sketching with Spherical Designs for Noisy Data Fitting on Spheres".



------------------------------------------------------
Overview:

The files in the folder 'tools' include:
  
S2_points_illsrtation.m -- this .m file implements the illustration of three different spherical t-designs, as shown in Fig 2.1. 
 
FrankeD3_SubSampleContrast_t141_noiseXXX.m -- this .m file implements the comparison of the three sketching methods using different sampling ratios for the approximation of the function f1. The suffix "noiseXXX" of the .m file name
represents the truncated Gaussian noise with standard deviation delta. For example, "noise0001" represents "delta = 0.001", and "noisefree" represents "delta = 0".

WendlandD3_SubSampleContrast_t141_noiseXXX.m -- this .m file implements the comparison of the three sketching methods using different sampling ratios for the approximation of the function f2. The suffix "noiseXXX" of the .m file name
represents the truncated Gaussian noise with standard deviation delta. For example, "noise0001" represents "delta = 0.001", and "noisefree" represents "delta = 0".

RMSEvsNumberS_Franke_plot.m -- this .m file plots the relation between RMSE and s∗ for sketching with s∗-designs under different levels of truncated Gaussian noise for the approximation of the function f1, as shown in the top row of Fig 4.1. This .m file must run after "FrankeD3_SubSampleContrast_t141_noiseXXX.m" is finished for all noises.  

RMSEvsNumberS_Wendland_plot.m -- this .m file plots the relation between RMSE and s∗ for sketching with s∗-designs under different levels of truncated Gaussian noise for the approximation of the function f2, as shown in the bottom row of Fig 4.1. This .m file must run after "WendlandD3_SubSampleContrast_t141_noiseXXX.m" is finished for all noises. 

RMSEvsNoise_Franke_plot.m -- this .m file implements the comparison of RMSE among the three sketching methods with increasing levels of truncated Gaussian noise for the approximation of the function f1, as shown in the top row of Fig 4.2. This .m file must run after "FrankeD3_SubSampleContrast_t141_noiseXXX.m" is finished for all noises. 

RMSEvsNoise_Wendland_plot.m -- this .m file implements the comparison of RMSE among the three sketching methods with increasing levels of truncated Gaussian noise for the approximation of the function f2, as shown in the bottom row of Fig 4.2. This .m file must run after "WendlandD3_SubSampleContrast_t141_noiseXXX.m" is finished for all noises. 

fval_err_plot_Franke_noise001.m -- this .m file provides an intuitive visualization of the approximation results of f1 over the unit sphere with noise standard deviation delta = 0.01 via sketching with s∗-designs, as shown in the top row of Fig 4.3. This .m file must run after "FrankeD3_SubSampleContrast_t141_noise001.m" is finished.

fval_err_plot_Franke_noise05.m -- this .m file provides an intuitive visualization of the approximation results of f1 over the unit sphere with noise standard deviation delta = 0.5 via sketching with s∗-designs, as shown in the bottom row of Fig 4.3. This .m file must run after "FrankeD3_SubSampleContrast_t141_noise05.m" is finished.

fval_err_plot_Wendland_noise001.m -- this .m file provides an intuitive visualization of the approximation results of f2 over the unit sphere with noise standard deviation delta = 0.01 via sketching with s∗-designs, as shown in the top row of Fig 4.4. This .m file must run after "WendlandD3_SubSampleContrast_t141_noise001.m" is finished.

fval_err_plot_Wendland_noise05.m -- this .m file provides an intuitive visualization of the approximation results of f2 over the unit sphere with noise standard deviation delta = 0.5 via sketching with s∗-designs, as shown in the bottom row of Fig 4.4. This .m file must run after "WendlandD3_SubSampleContrast_t141_noise05.m" is finished.



------------------------------------------------------
Data:

The files in the folder 'Points' include the points of spherical t-designs. 



------------------------------------------------------
Terms of use:

The code is provided for research purposes only, without any warranty. It shall not be used, rewritten, or adapted as the basis of a commercial software or hardware product without first obtaining permission from the authors.



------------------------------------------------------
Citation:

When using the code, please cite the following paper:
Shao-Bo Lin, Di Wang, and Ding-Xuan Zhou, Sketching with spherical designs for noisy data fitting on spheres, SIAM Journal on Scientific Computing, preprint, 2023.



------------------------------------------------------
If you find any bugs, please contact Di Wang (wang.di@xjtu.edu.cn).