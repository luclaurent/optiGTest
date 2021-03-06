%% function for loading dimension of available functions
% L. LAURENT --  15/12/2017 -- luc.laurent@lecnam.net

% sources available here:
% https://bitbucket.org/luclaurent/optigtest/
% https://github.com/luclaurent/optigtest/

% optiGTest - set of testing functions    A toolbox to easy manipulate functions.
% Copyright (C) 2017  Luc LAURENT <luc.laurent@lecnam.net>
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

function dim=loadDim(funName)
listDim=struct(...
    'Ackley1',Inf,...
    'Ackley2',2,...
    'Ackley3',2,...
    'Ackley4',2,... %could be Inf
    'Adjiman',2,...
    'Alpine1',Inf,...
    'Alpine2',Inf,...
    'AHE',Inf,...
    'AMGM',Inf,...
    'BartelsConn',2,...
    'Beale',2,...
    'BiggsExp2',2,...
    'BiggsExp3',3,...
    'BiggsExp4',4,...
    'BiggsExp5',5,...
    'BiggsExp6',6,...
    'Bird',2,...
    'Bohachevsky1',2,...
    'Bohachevsky2',2,...
    'Bohachevsky3',2,...
    'Booth',2,...
    'BoxBetts',3,...
    'Brad',3,...
    'Branin1',2,...
    'Branin2',2,...
    'Brent',2,...
    'Brown',Inf,...
    'Bukin01',2,...
    'Bukin02',2,...
    'Bukin03',2,...
    'Bukin04',2,...
    'Bukin05',2,...
    'Bukin06',2,...
    'Bukin07',2,...
    'Bukin08',2,...
    'Bukin09',2,...
    'Bukin10',2,...
    'Bukin11',2,...
    'Bukin12',2,...
    'Bukin13',2,...
    'Bukin14',2,...
    'Bukin15',2,...
    'Bukin16',2,...
    'Bukin17',2,...
    'Bukin18',2,...
    'Bukin19',2,...
    'Bukin20',2,...
    'CamelbackThreeHump',2,...
    'CamelbackSixHump',2,...
    'CarromTable',2,...
    'ChenV',2,...
    'ChenBird',2,...
    'Chichinadze',2,...
    'ChungReynolds',Inf,...
    'Cigar',Inf,...
    'Cola',17,...
    'Colville',4,...
    'Corana',4,...
    'CosineMixture',Inf,...
    'CrossInTray',2,...
    'CrossLegTable',2,...
    'CrownedCross',2,...
    'Csendes',Inf,...
    'Cst',Inf,...
    'Cube',2,...
    'Custom01',1,...
    'Custom02',1,...
    'Custom03',1,...
    'Custom04',1,...
    'Custom05',1,...
    'Custom06',1,...
    'Custom07',1,...
    'Damavandi',2,...
    'Deb1',Inf,...
    'Deb2',Inf,...
    'Deb3',Inf,...
    'Deb4',Inf,...
    'Decanomial',2,...
    'Deceptive',Inf,...
    'DeckkersAarts',2,...
    'DeflectedCorrugatedSpring',Inf,...
    'DeVilliersGlasser1',4,...
    'DeVilliersGlasser2',5,...
    'DixonPrice',Inf,...
    'Dolan',5,...
    'DropWave',Inf,...
    'Easom',2,...
    'ElAttarVidyasogarDutta',2,...
    'EggCrate',2,...
    'EggHolder',Inf,...
    'Exponential',Inf,...
    'EX1',2,...
    'Exp2',2,...
    'Exp3',3,...
    'Exp4',4,...
    'Exp5',5,...
    'Exp6',6,...
    'FreudensteinRoth',2,...
    'Gear',4,...
    'Giunta',Inf,...
    'GoldsteinPrice',2,...
    'Griewank',Inf,...
    'GulfResearch',3,...
    'Hansen',2,...
    'Hartmann3',3,...
    'Hartmann6',6,...
    'HelicalValley',3,...
    'Himmelblau',2,...
    'Holzman',3,...
    'Hosaki',2,...
    'Infiniti',Inf,...
    'JennrichSampson',2,...
    'Judge',2,...
    'Katsuura',Inf,...
    'Keane',2,...
    'Kowalik',4,...
    'Langermann52',2,...
    'Langermann5',Inf,... %'LennardJones',Inf,...
    'Leon',2,...
    'Levy03',Inf,...
    'Levy05',2,...
    'Levy13',2,...
    'Matyas',2,...
    'McCormick',2,...
    'Michalewicz',Inf,...
    'MieleCantrell',4,...
    'Mishra01',Inf,...
    'Mishra02',Inf,...
    'Mishra03',2,...
    'Mishra04',2,...
    'Mishra05',2,...
    'Mishra06',2,...
    'Mishra07',Inf,...
    'Mishra08',2,...
    'Mishra09',3,...
    'Mishra10',2,...
    'Mishra11',Inf,...
    'Mystery',2,...
    'NeedleEye',Inf,...
    'NewFunction1',2,...
    'NewFunction2',2,...
    'NewFunction3',2,...
    'Null',Inf,...
    'OddSquare',1:20,...
    'Parsopoulos',2,...
    'Pathological',Inf,...
    'Paviani',10,...
    'Peaks',2,...
    'PeaksN',2,...
    'Penalty1',Inf,...
    'Penalty2',Inf,...
    'PenHolder',2,...
    'Periodic',2,...
    'Pinter',Inf,...
    'Plateau',Inf,...
    'Powell',4,...
    'PowerSum',4,...
    'Price1',2,...
    'Price2',2,...
    'Price3',2,...
    'Price4',2,...
    'Qing',Inf,...
    'Quadratic',2,...
    'Quartic',Inf,...
    'Quintic',Inf,... %'Rana',Inf,...
    'Rastrigin',Inf,...
    'RHE',Inf,...
    'Ripple01',2,...
    'Ripple25',2,...
    'Rosenbrock',Inf,...
    'RosenbrockM',2,...
    'RosenbrockMS',Inf,...
    'RotatedEllipse1',2,...
    'RotatedEllipse2',2,...
    'Rump',2,...
    'Salomon',Inf,...
    'Sargan',Inf,...
    'Schaffer1',2,...
    'Schaffer2',2,...
    'Schaffer3',2,...
    'Schaffer4',2,...
    'Schaffer6',Inf,...
    'SchmidtVetters',3,...
    'Schwefel01',Inf,...
    'Schwefel02',Inf,...
    'Schwefel04',Inf,...
    'Schwefel06',2,...
    'Schwefel20',Inf,...
    'Schwefel21',Inf,...
    'Schwefel22',Inf,...
    'Schwefel23',Inf,...
    'Schwefel25',Inf,...
    'Schwefel26',Inf,...
    'Schwefel36',2,...
    'Shekel05',4,...
    'Shekel07',4,...
    'Shekel10',4,...
    'Shubert1',2,...
    'Shubert3',Inf,...
    'Shubert4',Inf,...
    'SineEnveloppe',Inf,...
    'Sodp',Inf,...
    'Slope',Inf,...
    'Sphere',Inf,...
    'Step',Inf,...
    'Step1',Inf,...
    'Step2',Inf,...
    'Step3',Inf,...
    'StepInt',Inf,...
    'Stochastic',Inf,...
    'StretchedV',Inf,...
    'StyblinskiTang',Inf,...
    'SumSquare',4,...
    'Treccani',2,...
    'Trefethen',2,...
    'Trid',6,...
    'Trigonometric1',Inf,...
    'Trigonometric2',Inf,...
    'Trigonometric3',2,...
    'Tripod',2,...
    'TubeHolder',2,...
    'Ursem1',2,...
    'Ursem3',2,...
    'Ursem4',2,...
    'UrsemWaves',2,...
    'VenterSobiezcczanskiSobieski',2,...
    'Vincent',Inf,...
    'Watson',6,...
    'Wavy',Inf,...
    'WayburnSeader1',2,...
    'WayburnSeader2',2,...
    'Weibull',3,...
    'Weierstrass',Inf,...
    'Whitley',Inf,...
    'Wolfe',3,...
    'XinSheYang1',Inf,...
    'XinSheYang2',Inf,...
    'XinSheYang3',Inf,...
    'XinSheYang4',Inf,...
    'Xor',9,...
    'YaoLiu4',Inf,...
    'YaoLiu9',Inf,...
    'Zacharov',Inf,...%'ZeroSum',Inf,...
    'Zettl',2,...
    'Zimmerman',2,...
    'Zirilli',2);
if nargin==1
    dim=listDim.(funName);
else
    dim=listDim;
end
end