%% unConstrained example

%% load the function
Fun=unConstrained('Levy03');

%% Demo mode
Fun.demo

%A% available dimensions (Inf= function defined for any dimension)
Fun.dimAvailable

%% Change dimension 
Fun.dim=3;

%% evaluation of the function (responses and gradients
X=[0 1 2;
    3 4 5;
    6 7 8];
% Z=responses, GZ=gradients (in cell) GZr=gradients (in array)
[Z,GZ,GZr]=Fun.eval(X);
Z 
GZ
GZr

%% check the function
Fun.checkFun

%% Global minimum 
Fun.globMinX
Fun.globMinZ