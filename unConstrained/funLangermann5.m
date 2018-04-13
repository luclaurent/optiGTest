%% Langermann 5 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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

%
%global minimum : f(x)=NaN for x=()
%?1.08093846 (9.681,0.666) 
% 0.96499991 (8.074,8.777,3.467,1.863,6.707)
%
%Design space:0<xi<10


function [p,dp]=funLangermann5(xx)
%constants
ma = [9.681 0.667 4.783 9.095 3.517 9.325 6.544 0.211 5.122 2.020;
9.400 2.041 3.788 7.931 2.882 2.672 3.568 1.284 7.033 7.374;
8.025 9.152 5.114 7.621 4.564 4.711 2.996 6.126 0.734 4.982;
2.196 0.415 5.649 6.979 9.510 9.166 6.304 6.054 9.377 1.426;
8.074 8.777 3.467 1.863 6.708 6.349 4.534 0.276 7.633 1.567;
7.650 5.658 0.720 2.764 3.278 5.283 7.474 6.274 1.409 8.208;
1.256 3.605 8.623 6.905 0.584 8.133 6.071 6.888 4.187 5.448;
8.314 2.261 4.224 1.781 4.124 0.932 8.129 8.658 1.208 5.762;
0.226 8.858 1.420 0.945 1.622 4.698 6.228 9.096 0.972 7.637;
7.305 2.228 1.242 5.928 9.133 1.826 4.060 5.204 8.713 8.247;
0.652 7.027 0.508 4.876 8.807 4.632 5.808 6.937 3.291 7.016;
2.699 3.516 5.874 4.119 4.461 7.496 8.817 0.690 6.593 9.789;
8.327 3.897 2.017 9.570 9.825 1.150 1.395 3.885 6.354 0.109;
2.132 7.006 7.136 2.641 1.882 5.943 7.273 7.691 2.880 0.564;
4.707 5.579 4.080 0.581 9.698 8.542 8.077 8.515 9.231 4.670;
8.304 7.559 8.567 0.322 7.128 8.392 1.472 8.524 2.277 7.826;
8.632 4.409 4.832 5.768 7.050 6.715 1.711 4.323 4.405 4.591;
4.887 9.112 0.170 8.967 9.693 9.867 7.508 7.770 8.382 6.740;
2.440 6.686 4.299 1.007 7.008 1.427 9.398 8.480 9.950 1.675;
6.306 8.583 6.084 1.138 4.350 3.134 7.853 6.061 7.457 2.258;
0.652 2.343 1.370 0.821 1.310 1.063 0.689 8.819 8.833 9.070;
5.558 1.272 5.756 9.857 2.279 2.764 1.284 1.677 1.244 1.234;
3.352 7.549 9.817 9.437 8.687 4.167 2.570 6.540 0.228 0.027;
8.798 0.880 2.370 0.168 1.701 3.680 1.231 2.390 2.499 0.064;
1.460 8.057 1.336 7.217 7.914 3.615 9.981 9.198 5.292 1.224;
0.432 8.645 8.774 0.249 8.081 7.461 4.416 0.652 4.002 4.644;
0.679 2.800 5.523 3.049 2.968 7.225 6.730 4.199 9.614 9.229;
4.263 1.074 7.286 5.599 8.291 5.200 9.214 8.272 4.398 4.506;
9.496 4.830 3.150 8.270 5.079 1.231 5.731 9.494 1.883 9.732;
4.138 2.562 2.532 9.661 5.611 5.500 6.886 2.341 9.699 6.500]';


mc = [0.806,0.517,0.100,0.908,0.965,0.669,0.524,0.902,0.531,...
    0.876,0.462,0.491,0.463,0.714,0.352,0.869,0.813,0.811,...
    0.828,0.964,0.789,0.360,0.369,0.992,0.332,0.817,0.632,...
    0.883,0.608,0.326];

d=pi;
m=5;

%other version with m=numel(mc);


%evaluation and derivatives
sX=size(xx);
dim=sX(3);
p=zeros(sX(1),sX(2));
for it=1:m
    vx=bsxfun(@minus,xx,reshape(ma(1:dim,it),1,1,dim)); 
    svx=sum(vx.^2,3);
    ex=exp(-1/d*svx);
    cx=cos(d*svx);
    cc=cx*mc(it);
    p=p-ex.*cc;
end

if nargout==2
    dp=zeros(sX);
    %
    for it=1:m
        vx=bsxfun(@minus,xx,reshape(ma(1:dim,it),1,1,dim)); 
        svx=sum(vx.^2,3);
        ex=exp(-1/d*svx);
        cx=cos(d*svx);
        cc=cx*mc(it);
        sx=sin(d*svx);
        cs=sx*mc(it);       
        pvx=vx.*ex;
        %
        for itD=1:dim
            dp(:,:,itD)=dp(:,:,itD)+(2/d*cc+2*d*cs).*pvx(:,:,itD);
        end
    end
end
end


