optiTest 
=======
optiTest regroups many existing test functions used for studying the performance of approximation techniques and optimisation startegy.

Features
------
optiTest is able to 

* Provide derivatives of the test functions
* Dealing with any dimension chosen by the user
* Provide global minimum (value and associated set of parameters)

List of functions
------
|-|-|-|-|
|-----|-----|-----|-----|
| AMGM| Dolan| Mishra11| Schwefel26|
| Brown| DropWave| NeedleEye| Schwefel36|
| Bukin01| Easom| NewFunction1| Shekel05|
| Bukin02| ElAttarVidyasogarDutta| NewFunction2| Shekel07|
| Bukin03| EggCrate| NewFunction3| Shekel10|
| Bukin04| EggHolder| OddSquare| Shubert1|
| Bukin05| Exponential| Parsopoulos| Shubert3|
| Bukin06| EX1| Pathological| Shubert4|
| Bukin07| Exp2| Paviani| SineEnveloppe|
| Bukin08| Exp3| Penalty1| Sodp|
| Bukin09| Exp4| Penalty2| Sphere|
| Bukin10| Exp5| PenHolder| Step|
| Bukin11| Exp6| Periodic| Step1|
| Bukin12| FreudensteinRoth| Pinter| Step2|
| Bukin13| Gear| Plateau| Step3|
| Bukin14| Giunta| Powell| StepInt|
| Bukin15| GoldsteinPrice| PowerSum| Stochastic|
| Bukin16| Griewank| Price1| StretchedV|
| Bukin17| GulfResearch| Price2| StyblinskiTang|
| Bukin18| Hansen| Price3| Treccani|
| Bukin19| Hartmann3| Price4| Trefethen|
| Bukin20| Hartmann6| Qing| Trid|
| CamelbackThreeHump| HelicalValley| Quadratic| Trigonometric1|
| CamelbackSixHump| Himmelblau| Quartic| Trigonometric2|
| CarromTable| Holzman| Quintic| Tripod|
| ChenV| Hosaki| Rastrigin| TubeHolder|
| ChenBird| Infiniti| Ripple01| Ursem1|
| Chichinadze| JennrichSampson| Ripple25| Ursem3|
| ChungReynolds| Judge| Rosenbrock| Ursem4|
| Cigar| Katsuura| RosenbrockM| UrsemWaves|
| Cola| Keane| RosenbrockMS| VenterSobiezcczanskiSobieski|
| Colville| Kowalik| RotatedEllipse1| Vincent|
| Corana| Langermann52| RotatedEllipse2| Watson|
| CosineMixture| Langermann5| Rump| Wavy|
| CrossInTray| Leon| Salomon| WayburnSeader1|
| CrossLegTable| Levy03| Sargan| WayburnSeader2|
| CrownedCross| Levy05| Schaffer1| Weibull|
| Csendes| Levy13| Schaffer2| Weierstrass|
| Cube| Matyas| Schaffer3| Whitley|
| Damavandi| McCormick| Schaffer4| Wolfe|
| Deb1| MieleCantrell| Schaffer6| XinSheYang1|
| Deb2| Mishra01| SchmidtVetters| XinSheYang2|
| Deb3| Mishra02| Schwefel01| XinSheYang3|
| Deb4| Mishra03| Schwefel02| XinSheYang4|
| Decanomial| Mishra04| Schwefel04| Xor|
| Deceptive| Mishra05| Schwefel06| YaoLiu4|
| DeckkersAarts| Mishra06| Schwefel20| YaoLiu9|
| DeflectedCorrugatedSpring| Mishra07| Schwefel21| Zacharov|
| DeVilliersGlasser1| Mishra08| Schwefel22| Zettl|
| DeVilliersGlasser2| Mishra09| Schwefel23| Zimmerman|
| DixonPrice| Mishra10| Schwefel25| Zirilli|

Download
------

The toolbox can be downloaded [here](https://bitbucket.org/luclaurent/optitest/downloads).

If you use `git`, you can clone the repository using the following command

    git clone git@bitbucket.org:luclaurent/optitest.git optiTest


First start
------






References
----
This toolbox is inspired by many existing code and paper

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

    optiTest - set of testing functions    A toolbox to easy manipulate functions.
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