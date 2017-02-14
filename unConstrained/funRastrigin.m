%% Rastrigin function
%L. LAURENT -- 21/02/2012 -- luc.laurent@lecnam.net
%
%numerous local minima
%1 minimum global: x=(0,0,...,0) >> f(x)=0
%
%Design space -5.12<xi<5.12
%
%[TZ89] A. T\¨orn and A. Zilinskas. "Global Optimization". Lecture Notes in Computer Science, No 350, Springer-Verlag, Berlin,1989.
%[MSB91] H. M\¨uhlenbein, D. Schomisch and J. Born. "The Parallel Genetic Algorithm as Function Optimizer ". Parallel Computing, 17, pages 619-632,1991.


function [p,dp]=funRastrigin(xx)

%constants
coef=10;
nbvar=size(xx,3);

%evaluation and derivatives
cal=xx.^2-coef*cos(2*pi*xx);
p=coef*nbvar+sum(cal,3);

if nargout==2
    dp=2*xx+2*coef*pi*sin(2*pi*xx);
end
end