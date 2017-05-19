optiGTest 
=======
optiGTest regroups many existing test functions used for studying the performance of approximation techniques and optimization strategy. In particular, gradient of the test functions are provided

Features
------
optiGTest is able to 

* Provide derivatives of the test functions
* Dealing with any dimension chosen by the user
* Provide global minimum (value and associated set of parameters)

First start
------
* unConstrained problems: `Example_unConstrained.m`

List of functions
------
|-|-|-|
|-----|-----|-----|
| AMGM| Griewank| Salomon|
| Brown| GulfResearch| Sargan|
| Bukin01| Hansen| Schaffer1|
| Bukin02| Hartmann3| Schaffer2|
| Bukin03| Hartmann6| Schaffer3|
| Bukin04| HelicalValley| Schaffer4|
| Bukin05| Himmelblau| Schaffer6|
| Bukin06| Holzman| SchmidtVetters|
| Bukin07| Hosaki| Schwefel01|
| Bukin08| Infiniti| Schwefel02|
| Bukin09| JennrichSampson| Schwefel04|
| Bukin10| Judge| Schwefel06|
| Bukin11| Katsuura| Schwefel20|
| Bukin12| Keane| Schwefel21|
| Bukin13| Kowalik| Schwefel22|
| Bukin14| Langermann52| Schwefel23|
| Bukin15| Langermann5| Schwefel25|
| Bukin16| Leon| Schwefel26|
| Bukin17| Levy03| Schwefel36|
| Bukin18| Levy05| Shekel05|
| Bukin19| Levy13| Shekel07|
| Bukin20| Matyas| Shekel10|
| CamelbackThreeHump| McCormick| Shubert1|
| CamelbackSixHump| MieleCantrell| Shubert3|
| CarromTable| Mishra01| Shubert4|
| ChenV| Mishra02| SineEnveloppe|
| ChenBird| Mishra03| Sodp|
| Chichinadze| Mishra04| Sphere|
| ChungReynolds| Mishra05| Step|
| Cigar| Mishra06| Step1|
| Cola| Mishra07| Step2|
| Colville| Mishra08| Step3|
| Corana| Mishra09| StepInt|
| CosineMixture| Mishra10| Stochastic|
| CrossInTray| Mishra11| StretchedV|
| CrossLegTable| NeedleEye| StyblinskiTang|
| CrownedCross| NewFunction1| Treccani|
| Csendes| NewFunction2| Trefethen|
| Cube| NewFunction3| Trid|
| Damavandi| OddSquare| Trigonometric1|
| Deb1| Parsopoulos| Trigonometric2|
| Deb2| Pathological| Tripod|
| Deb3| Paviani| TubeHolder|
| Deb4| Penalty1| Ursem1|
| Decanomial| Penalty2| Ursem3|
| Deceptive| PenHolder| Ursem4|
| DeckkersAarts| Periodic| UrsemWaves|
| DeflectedCorrugatedSpring| Pinter| VenterSobiezcczanskiSobieski|
| DeVilliersGlasser1| Plateau| Vincent|
| DeVilliersGlasser2| Powell| Watson|
| DixonPrice| PowerSum| Wavy|
| Dolan| Price1| WayburnSeader1|
| DropWave| Price2| WayburnSeader2|
| Easom| Price3| Weibull|
| ElAttarVidyasogarDutta| Price4| Weierstrass|
| EggCrate| Qing| Whitley|
| EggHolder| Quadratic| Wolfe|
| Exponential| Quartic| XinSheYang1|
| EX1| Quintic| XinSheYang2|
| Exp2| Rastrigin| XinSheYang3|
| Exp3| Ripple01| XinSheYang4|
| Exp4| Ripple25| Xor|
| Exp5| Rosenbrock| YaoLiu4|
| Exp6| RosenbrockM| YaoLiu9|
| FreudensteinRoth| RosenbrockMS| Zacharov|
| Gear| RotatedEllipse1| Zettl|
| Giunta| RotatedEllipse2| Zimmerman|
| GoldsteinPrice| Rump| Zirilli|

Download
------

The toolbox can be downloaded [here](https://bitbucket.org/luclaurent/optitest/downloads).

If you use `git`, you can clone the repository using the following command

    git clone git@bitbucket.org:luclaurent/optiGtest.git optiGTest







References
----
This toolbox is inspired by many existing codes and papers

* [AMPGO](http://infinity77.net/global_optimization/index.html) (and [github repository](https://github.com/andyfaff/ampgo/))
* E. P. Adorio and U. P. Diliman. [MVF - Multivariate Test Functions Library in C for Unconstrained Global Optimization.](https://www.google.fr/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwi2j_iz8sbTAhWG0hoKHfYLAncQFggnMAA&url=http%3A%2F%2Fwww.geocities.ws%2Feadorio%2Fmvf.pdf&usg=AFQjCNE7AMN9NpxLz2UGDInWKcwMeC120g&sig2=trbG1un24A4RfYCPdifjuA)
* P. N. Suganthan, N. Hansen, J. J. Liang, K. Deb, Y. P. Chen, A. Auger and S. Tiwari. Problem definitions and evaluation criteria for the CEC 2005 special session on real-parameter optimization. KanGAL report, 2005.[Link](https://www.lri.fr/~hansen/Tech-Report-May-30-05.pdf)
* V. Bicik, Continuous optimization algorithms, Master thesis, Czech Technical University in Prague, 2010 [Link](https://dip.felk.cvut.cz/browse/pdfcache/bicikvla_2010dipl.pdf)
* M. Jamil and Xin-She Yang, A literature survey of benchmark functions for global optimization problems, *Int. Journal of Mathematical Modelling and Numerical Optimisation*, Vol. 4, No. 2, pp. 150--194 (2013) doi: [10.1504/IJMMNO.2013.055204](http://dx.doi.org/10.1504/IJMMNO.2013.055204) arXiv: [1308.4008](https://arxiv.org/abs/1308.4008) [PDF](https://arxiv.org/pdf/1308.4008.pdf)
* M. Molga, C. Smutnick. Test functions for optimization needs [Link](http://new.zsd.iiar.pwr.wroc.pl/files/docs/functions.pdf)
* M. M. Ali, C. Khompatraporn and Z. B. Zabinsky, *Journal of Global Optimisation* (2005) 31:635. doi: [10.1007/s10898-004-9972-2](http://dx.doi.org/10.1007/s10898-004-9972-2) [PDF](http://folk.uib.no/ssu029/Pdf_file/Ali05.pdf)
* [Virtual Library of Simulation Experiments](https://www.sfu.ca/~ssurjano/other.html)

License ![GNU GPLv3](http://www.gnu.org/graphics/gplv3-88x31.png)
----

    optiGTest - set of testing functions    A toolbox to easy manipulate functions.
    Copyright (C) 2017  Luc LAURENT <luc.laurent@lecnam.net>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.