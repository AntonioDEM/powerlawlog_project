# Power-law-log Project 

Automatic [&copy;Matlab](https://www.mathworks.com/?s_tid=gn_logo) application for fitting `log-normal` and 'power-law' distribution to empirical data, following the goodnes-of-fit based approach.
## Introduction

The following code and procedure have been developed to provide an easy and complete tool for automatization of fitting frequency data of objects according to both log normal and powerlaw distributions, starting from xls tabular data. The procedure uses external resources for the fitting code on the `power-law distribution`, of which we will give the references. The `lognormal distribution` is often not sufficient to interpret data distributions that have low frequencies and high intensities in the tail, although this events could be more relevant than those characterized by high frequencies. The populations of cities, the intensities of earthquakes, the sizes of power outages, for example, are all thought to follow power-law distributions. In food science, the bubble size in bread dough, or crackings in the surface of cookies, follow this pattern in the tail of the distribution. Quantities such as these are not well characterized by their typical or average values. Estimations on discrete parametric power law which better fits on the empirical data, is done as explained by [Clauset et al. (2009](https://arxiv.org/abs/0706.1062). The `𝑥≥𝑚𝑖𝑛` value estimated is chosen in way that the estimated power law model gets a best fit of the empirical probability distribution for `𝑥 ≥ 𝑥𝑚𝑖𝑛` [Clauset et al. (2009](https://arxiv.org/abs/0706.1062). To estimate the distance between the two model distributions, the empirical and theoretical power law uses the Kolmogorov – Smirnov statistic D. Estimation for 𝑥 ≥ 𝑥𝑚𝑖𝑛 is defined by the value which minimizes `D`. the supposition that our data follows a power law for `𝑥 ≥ 𝑥𝑚𝑖𝑛`, the α parameter is estimated by a numeric optimization of the log – likelihood. 

##Tools file pack

![Tree files project](https://ibb.co/cwHx9MG)



##Procedure:

Data must be formatted according to the `dataset.xls` file attached. 

Data are used directly to compute the complementary cumulative distribution function `CCDF`. The `CDF` is defined as (`1−CDF), where the `CDF`(cumulative distribution function) is the integral of the probability distribution function (`PDF`).

In `dataset.xls`, the column `Areas` will be the one the program will extract and use during the procedure.

1.	**run** `settingpr.m`: you will get a message box with the instructions to follow and so with the other steps. The first step creates the folders and path.

	1.1.	Move your data file in .xls format into “data_xls” folder created, and you can either rename it or leave it the same name. This was done taking into account that the file could be anywhere on the computer or in an external hdd or in a pen, so that the original file remains intact and has no interaction with the procedure.

	1.2	Execute `xlstomat.m` script, which is into “setting_file” folder.

2.	*run* run `pwlawlog.m : perform the automatic procedure for the case study of power-law distribution on all excell sheet present in the .xls file;

	2.1		processes the data set by eliminating unnecessary columns and creating an array of useful data;

	2.2		compute the solutions of the log-normal (`pd {1, ii} = fitdist (g, 'Lognormal');), of the` power -law` (`[alpha, xmin, D] = plfit (g, 'finite' ); `)	

	2.2.	print the table of solution and save the same in .mat, .txt, .slx formats;
	2.2

The data are processed, at the end of the processing it is asked if you want to perform the simple plot procedure, with LaTex or to exit the procedure.
The following script are integrated in the program. 
    



## Documentation

The following journal references are useful for framing the topic, theoretically (Limpert, 2001; Causet et al. 2007, 2009) and in applied sciences (Fois et. al, 2012) both for Lognormal and Powerlaw distributions, in various fields of science:

Limpert, E.; Stahel, W. A.; Abbt, M. Log-normal Distributions across the Sciences: Keys and Clues. Bio science, 2001, 51, 341-352, doi: https://doi.org/10.1641/0006-3568(2001)051[0341:lndats]2.0.co;2.

Clauset, A.; Young, A.; Gleditsch, K. S. On the Frequency of Severy Terrorist Events. J. Confl. Res. 2007, 51(1), 58 – 57, doi: 10.1177/0022002706296157.

Clauset, A.; Shalizi, C.R.; Newman, M.E.J. Power-law distributions in empirical data. Siam Rev., 2009, 51(4), 661–703, doi: 10.1137/070710111.

Goldstein, M. L.; Morris, S. A.; Yen G.G. Problems with Fitting to the Power-Law Distribution. Phys. Condens. Matter, 2004, 41, 251-258, doi: 10.1140/epjb/e2004-00316-5.

Fois, S.; Fadda, C.; Tonelli, R.; Sanna, M.; Urgeghe, P. P. Effects of the fermentation process on gas-cell size two-dimensional distribution and rheological characteristics of durum-wheat-based doughs. Food Res. Int., 2012, 49, 193–200, doi: 10.1016/j.foodres.2012.07.058.
