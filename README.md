# Power-law-log Project
Automation with matlab for data processing with the powerlaw function

## Introduction
This site was built using [GitHub Pages](https://pages.github.com/)

The following code and procedure have been developed to provide an easy and complete tool for automatization of fitting frequency data of objects according to both log normal and powerlaw distributions, starting from xls tabular data. The procedure uses external resources for the fitting code on the `power-law distribution`, of which we will give the references. The `lognormal distribution` is often not sufficient to interpret data distributions that have low frequencies and high intensities in the tail, although this events could be more relevant than those characterized by high frequencies. The populations of cities, the intensities of earthquakes, the sizes of power outages, for example, are all thought to follow power-law distributions. In food science, the bubble size in bread dough, or crackings in the surface of cookies, follow this pattern in the tail of the distribution. Quantities such as these are not well characterized by their typical or average values. Estimations on discrete parametric power law which better fits on the empirical data, is done as explained by [Clauset et al. (2009)] (https://arxiv.org/abs/0706.1062). The 𝑥≥𝑚𝑖𝑛 value estimated is chosen in way that the estimated power law model gets a best fit of the empirical probability distribution for 𝑥 ≥ 𝑥𝑚𝑖𝑛 (Clauset et al., 2007). To estimate the distance between the two model distributions, the empirical and theoretical power law uses the Kolmogorov – Smirnov statistic D. Estimation for 𝑥 ≥ 𝑥𝑚𝑖𝑛 is defined by the value which minimizes D. the supposition that our data follows a power law for 𝑥 ≥ 𝑥𝑚𝑖𝑛, the α parameter is estimated by a numeric optimization of the log – likelihood. 

##Tools script

├── example_data
│   └── data.xls
├── external
│   ├── export_fig
│   │   
│   ├── latexTable.m
│   └── powerlaws
│       ├── plfit.m
│       ├── plplot.m
│       ├── plpva.m
│       └── plvar.m
├── plotsol
│   ├── plotsolLatex.m
│   └── plotsolsimple.m
├── pwlawlog.m
├── setting_file
│   ├── copyfiletofolder.m
│   └── xlstomat.m
├── settingpr.m
