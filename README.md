# Power-law-log Project
[![View powerlawlog_project on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://it.mathworks.com/matlabcentral/fileexchange/78982-powerlawlog_project)


<a href=https://www.mdpi.com/2304-8158/9/9/1272>
    <img src=https://www.mdpi.com/img/design/mdpi-pub-logo-blue-small4.png?fff78193ca41c286 width="80" /> 
    <img src= https://www.mdpi.com/img/journals/foods-logo.png?8b1ef14ac0638a0d)](https://www.mdpi.com/2304-8158/9/9/1272 width="200" />
</a>


Automatic [&copy;Matlab](https://www.mathworks.com/?s_tid=gn_logo) application for fitting [log-normal](https://en.wikipedia.org/wiki/Log-normal_distribution) and [power-law distribution](https://en.wikipedia.org/wiki/Power_law) to empirical data, following the goodnes-of-fit based approach.

*This code is in **public domain**. If it is used for scientific elaborations, academic articles or other types of publications, I kindly ask that the repository be cited.*

## Introduction

The following code and procedure have been developed to provide an easy and complete tool for automatization of fitting frequency data of objects according to both log normal and powerlaw distributions, starting from xls tabular data. The procedure uses external resources for the fitting code on the **power-law distribution**, of which we will give the references. The **lognormal distribution** is often not sufficient to interpret data distributions that have low frequencies and high intensities in the tail, although this events could be more relevant than those characterized by high frequencies. The populations of cities, the intensities of earthquakes, the sizes of power outages, for example, are all thought to follow power-law distributions. In food science, the bubble size in bread dough, or crackings in the surface of cookies, follow this pattern in the tail of the distribution. Quantities such as these are not well characterized by their typical or average values. Estimations on discrete parametric power law which better fits on the empirical data, is done as explained by [Clauset et al. (2009)](https://arxiv.org/abs/0706.1062). The `𝑥≥𝑚𝑖𝑛` value estimated is chosen in way that the estimated power law model gets a best fit of the empirical probability distribution for `𝑥 ≥ 𝑥𝑚𝑖𝑛` [Clauset et al. (2009)](https://arxiv.org/abs/0706.1062). To estimate the distance between the two model distributions, the empirical and theoretical **power-law** uses the [Kolmogorov – Smirnov](https://en.wikipedia.org/wiki/Kolmogorov–Smirnov_test) statistic `D`. Estimation for `𝑥 ≥ 𝑥𝑚𝑖𝑛` is defined by the value which minimizes `D`. the supposition that our data follows a power law for `𝑥 ≥ 𝑥𝑚𝑖𝑛`, the `α` parameter is estimated by a numeric optimization of the **log–likelihood**.

## Tools file pack

This tree represents the root folders that contain both the code of the **powerlawlog_project** and the external files code's that were used to aid in writing the tools.

```	
── code
│   ├── example_data
│   │   └── data.xls
│   ├── external
│   │   ├── export_fig
│   │   ├── latexTable.m
│   │   └── powerlaws
│   │       ├── plfit.m
│   │       ├── plplot.m
│   │       ├── plpva.m
│   │       └── plvar.m
│   ├── plotsol
│   │   ├── plotsolLatex.m
│   │   └── plotsolsimple.m
│   ├── setting_file
│   │   ├── copyfiletofolder.m
│   │   └── xlstomat.m
│   ├── pwlawlog.m
│   └── settingpr.m
		
```
 <!-- this is a cooment
 ![Tree files project](https://github.com/AntonioDEM/powerlawlog_project/blob/master/img/treeproject.png)
 -->

## Procedure:

Data must be formatted according to the **dataset.xls** file attached.

Data are used directly to compute the complementary cumulative distribution function **CCDF** (cumulative distribution function). The **CDF** is defined as (**1−CDF**), where the **CDF** is the integral of the probability distribution function **PDF**.

In **dataset.xls**, the column **Areas** will be the one the program will extract and use during the procedure.

The procedure is basically based on the execution of only two complex scripts:

1.	**RUN** file `settingpr.m`: you will get a message box with the instructions to follow and so with the other steps. The first step creates the *folders* and *path*.

	1.1.	`copyfiletofolder.m`: Move your data file in .xls format into **data_xls** folder created, and you can either rename it or leave it the same name. This was done taking into account that the file could be anywhere on the computer or in an external hdd or in a pen, so that the original file remains intact and has no interaction with the procedure.

	1.2.  `xlstomat.m` script, which is into “setting_file” folder.

2.	**RUN** file `pwlawlog.m`: perform the automatic procedure for the case study of power-law distribution on all excell data sheet present in the .xls file;

	2.1.		**processes** the data set by import all the contents of the xls file folders, keep them in a **structure array**, then delete the unnecessary columns and keep the **Area** columns (located in the column for example E3: E135) and keep them in a new **cell array**;

	2.2.	**compute** solutions of the **log-normal**

	```
	pd{1, ii} = fitdist(g, 'Lognormal');
	```

	and the **power -law**

	```
	[alpha, xmin, D] = plfit(g, 'finite');
	```
	The file scrips necessary for the basic processing of the program are contained in the **external** folder and refer to [Clauset et al](http://tuvalu.santafe.edu/~aaronc/powerlaws/)

	2.2.	**print** the table of solution and save the same in .mat, .txt, .slx formats;

	2.3. **execute** the procedure for the simple or LaTex plot and save the images in .png format in the **imgPL** folder.
	To get a good print of the images we used the `export_fig` tool by [Yair Altman](https://www.mathworks.com/matlabcentral/fileexchange/23629-export_fig)

	`plotsolLatex.m`: is based on the `latexTable.m` script from [Eli Duenisch](https://github.com/eliduenisch/latexTable/blob/master/README.md)

	`plotsimple.m`: is a simple script which lists the main results related to the image (can be improved).

![example img](https://github.com/AntonioDEM/powerlawlog_project/blob/master/img/example_plot.png)


## Documentation

The following journal references are useful for framing the topic, theoretically (Limpert, 2001; Causet et al. 2007, 2009) and in applied sciences (Fois et. al, 2012) both for Lognormal and Powerlaw distributions, in various fields of science:

Limpert, E.; Stahel, W. A.; Abbt, M. Log-normal Distributions across the Sciences: Keys and Clues. Bio science, 2001, 51, 341-352, doi: https://doi.org/10.1641/0006-3568(2001)051[0341:lndats]2.0.co;2.

Clauset, A.; Young, A.; Gleditsch, K. S. On the Frequency of Severy Terrorist Events. J. Confl. Res. 2007, 51(1), 58 – 57, doi: 10.1177/0022002706296157.

Clauset, A.; Shalizi, C.R.; Newman, M.E.J. Power-law distributions in empirical data. Siam Rev., 2009, 51(4), 661–703, doi: 10.1137/070710111.

Goldstein, M. L.; Morris, S. A.; Yen G.G. Problems with Fitting to the Power-Law Distribution. Phys. Condens. Matter, 2004, 41, 251-258, doi: 10.1140/epjb/e2004-00316-5.

Fois, S.; Fadda, C.; Tonelli, R.; Sanna, M.; Urgeghe, P. P. Effects of the fermentation process on gas-cell size two-dimensional distribution and rheological characteristics of durum-wheat-based doughs. Food Res. Int., 2012, 49, 193–200, doi: 10.1016/j.foodres.2012.07.058.

## Conceptualization

[Campus Marco](https://www.researchgate.net/profile/Marco_Campus), [Fois Simonetta](https://www.researchgate.net/profile/Simonetta_Fois), Code: Antonio Demarcus


## Special Thanks

Special thanks to [Marco Campus](https://it.linkedin.com/in/marco-campus-7797959/it-it?trk=people-guest_people_search-card) for letting me participate in this work and to [Enrico de Marinis (Zefram)](https://www.facebook.com/zefram.zef) for suggestions for improving the matlab code

For the contributions on matlab and LaTex codes, would like to thank: the [matlab community](https://www.mathworks.com/matlabcentral/fileexchange/), [Stack Overflow](https://stackoverflow.com), StackExchange [{TEX}](https://tex.stackexchange.com), [GUIT](https://www.guitex.org/home/) - Gruppo Utilizzatori Italiani Tex
