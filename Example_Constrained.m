%% unConstrained example

%% load the function
Fun=optiGTest('Levy03');

%% Demo mode
Fun.demo

%% available dimensions (Inf= function defined for any dimension)
Fun.dimAvailable

%% Change dimension 
Fun.dim=3;

%% evaluation of the function (responses and gradients
X=[0 1 2;
    3 4 5;
    6 7 8];
% Z=responses, GZ=gradients (in cell) GZr=gradients (in array)
[Z,GZ,GZr]=Fun.evalObj(X);
Z 
GZ
GZr

%% check the function
Fun.checkPb

%% Global minimum 
Fun.globMinX
Fun.globMinZ

%% list available functions
dispAvailablePb 