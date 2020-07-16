"""
    This file is part of pyOptiGTest module. It contains the basic declarations of all test functions.

    MIT License

    Copyright (c) 2020 Luc LAURENT

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
"""

import numpy as np


########################################
########################################
########################################
########################################
#% Ackley's function 1
def funAckley1(X,grad=False):

    #constants
    a=20
    b=0.02
    c=2*np.pi
    d=np.exp(1)

    #number of variables
    nbvar=X.shape[2]

    #responses and derivatives
    normP=np.sqrt(np.sum(X^2,3))
    ex1=np.exp(-b*normP/np.sqrt(nbvar))
    sco=np.sum(np.cos(c*X),3)
    ex2=np.exp(1/nbvar*sco)
    p=-a*ex1-ex2+a+d

    if grad:
        dp=a*b*1/np.sqrt(nbvar)*X/normP*ex1+c/nbvar*np.sin(c*X)*ex2
        return p,dp
    else:
        return p


########################################
########################################
########################################
########################################


########################################
########################################
########################################
########################################


########################################
########################################
########################################
########################################

