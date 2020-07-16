"""
    This file is part of pyOptiGTest module. It contains the declarations 
    of all test problems.

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

import dbFunctions as dbF
import numpy as np


# load unconstrained problem from name
def loadPb(pbName = None,dim = 0):
    #
    allPb = listPb(dim)
    out = dict()
    #
    if pbName:
        if pbName in allPb.keys():
            out = allPb[pbName]
    else:
        out=allPb
    #
    return out


#all problems
def listPb(dim = 0):
    pb = dict()
    pb = {
        'Ackley1':{
            'funobj':['Ackley1'],
            'funcons':None,
            'typecons':None,
            'type':'Unconstrained',
            'dim':np.inf,
            'minFglob':0,
            'minXglob':np.zeros(dim),
            'space':np.ndarray([-35,35])
        }}



