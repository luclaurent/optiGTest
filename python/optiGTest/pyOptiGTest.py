import logging
import sys
from datetime import datetime

import numpy as np

import dbProblems as dbP

class optigtest:

    def __init__(self,namePb=None,X=None,dim=None):
        """ constructor of the class """
        #initialize object
        self.initObj()
        #initialize logging
        logging.basicConfig(
            handlers=[
                logging.StreamHandler(sys.stdout)
                ],
            format='%(asctime)s %(levelname)-8s %(message)s',
            level=logging.INFO,
            datefmt='%Y-%m-%d %H:%M:%S')
            #
        #start creating the object
        logging.info('###############################')
        logging.info('### Create optiGTest object ###')
        logging.info('###############################')
        #if no input create an empty object
        if namePb:
            self.setPbName()
        if dim:
            #apply requested dim
            self.setDim(dim)
        if namePb and not X:
            #show details
            self.showDetails()
        if X:
            #prepare sample points
            self.prepX(X)
            #evaluate all functions
            self.evalAll()
        

    def initObj(self):
        """ initilization of the structure of the object """
        self.namePb = ''              # chosen problem
        self.typePb = ''              # kind of problems ('Un'=unconstrained, 'Cons'= constrained, 'Mult'=multiobjective)
        #
        self.dim = 0                  # dimension of the problem (number of design variables)
        self.Xeval = []               # set of parameters used for evaluating the function
        #
        # nSCheck=5;                 # number of sample points used for checking the function
        # forceDisplayGrad=false;    # flag to force display of gradients
        # paranoidCheck=false;       # strict check of function
        # defaultCheck=false;        # check by default after loading
        # FDtype='CD8';              # finite difference scheme
        # FDstep=1e-7;               # finite difference stepsize
        #
        self.populate()              # initialize fields for the active case
        self.initEval()              # initialize storage for evaluations
        #
        return True

    def initEval(self):
        """ specific initialization of storage elements for evaluations """
        self.objEval = []           # evaluations of the objective functions
        self.consEval = []          # evaluations of the constraint functions


    def loadData(self,pbName=None,dim=None):
        """ load data of the selected test case """
        self.setDim(dim)
        #load data of the case from db
        dataPb = dbP.loadPb(pbName,self.dim)
        #depending on the cases
        if pbName:
            #if the load data dictionay is empty
            if len(dataPb) == 0:
                logging.warning('Problem %s not available'%pbName)
                #show available problems
                dataPb = dbP.loadPb()
                self.showPbs(dataPb)
            else:
                self.populate(dataPb)
        else:
            #show available problems
            self.showPbs(dataPb)
        
    def populate(self,dictPb = None):
        """ populate items of the object """
        # create empty fields
        self.typePb = ''              # kind of problems ('Un'=unconstrained, 'Cons'= constrained, 'Mult'=multiobjective)
        #
        self.funObj =[]                     # objective function
        self.funCons = []                   # list of constraint functions
        self.typeCons = []                  # list of type of constraints (<, >, <=, >=, =)
        self.designSpace = []               # lower and upper bounds
        self.dimAvailable = 0               # available dimensions for the chosen problem
        self.locMinZ = []                   # list of local minima (responses)
        self.locMinX = []                   # list of local minima (associated parameters)
        self.globMinZ = []                  # list of global minima (responses)
        self.globMinX = []                  # list of global minima (associated parameters)
        #load data
        if dictPb is not None:
            if 'funobj' in dictPb.keys():
                self.funObj = dictPb['funobj']
            if 'funcons' in dictPb.keys():
                self.funCons = dictPb['funcons']
            if 'dim' in dictPb.keys():
                self.dimAvailable = dictPb['dim']
            if 'type' in dictPb.keys():
                self.typePb = dictPb['type']
            if 'typecons' in dictPb.keys():
                self.typeCons = dictPb['typecons']
            if 'space' in dictPb.keys():
                self.designSpace = dictPb['space']
            if 'minFglob' in dictPb.keys():
                self.globMinZ = dictPb['minFglob']
            if 'minXglob' in dictPb.keys():
                self.globMinX = dictPb['minXglob']
            if 'minFloc' in dictPb.keys():
                self.locMinZ = dictPb['minFloc']
            if 'minXloc' in dictPb.keys():
                self.locMinX = dictPb['minXloc']


    def prepX(self,X=None):
        """ Pack sample points before evaluations """ 
        if not X:
            #convert to numpy's array
            X = np.array(X)
            #depending on the cases
            if len(X.shape) == 1:
                nbVar = X.shape[0]
            elif len(X.shape) == 2:
                nbVar = X.shape[1]
            else:
                nbVar = X.shape[2]
            #check if the dimension is allowed
            if not np.any(np.isinf(self.dimAvailable)):
                if not nbVar in self.dimAvailable:
                    logging.error('Wrong dimension of provided sample points')
            #set the dimension
            self.setDim(nbVar)
            #in the case of a 2D array convert it to 3D
            if len(X.shape) == 2:
                self.Xeval = X.reshape(3,2,1)
            else:
                self.Xeval = X
        #
        return self.Xeval

    def getXmax(self):
        """ Get the upper bounds of the design space """
        if not self.designSpace:
            Xmax = [row[1] for row in self.designSpace]
        else:
            Xmax = None
        #
        return Xmax

    def getXmin(self):
        """ Get the lower bounds of the design space """
        if not self.designSpace:
            Xmin = [row[0] for row in self.designSpace]
        else:
            Xmin = None
        #
        return Xmin

    def getGlobZmin(self):
        """ Get the global minimum(s) of the objective function(s) with constraints """
        if not self.globMinZ:
            minZ = self.globMinZ
        else:
            minZ = None
        return minZ

    def getGlobXmin(self):
        """ Get the point(s) of the global minimum(s) with constraints """
        if not self.globMinX:
            minX = self.globMinX
        else:
            minX = None
        return minX


    def getTypePb(self):
        """ Get the type of the current problem """
        return self.typePb

    def getNbObj(self):
        """ Get the number of objective function(s)"""
        return len(self.funObj)
    def getNbCons(self):
        """ Get the number of constraint function(s)"""
        return len(self.funCons)
    
    def setPbName(self,pbName=None):
        """ declare the problem and load data """
        #load data and check if it is ok
        if self.loadData(pbName):
            self.pbName = pbName

    def setDim(self,dim=None):
        
    def evalAll(self,X=None):
        pass
    def evalObj(self,X=None):
        pass
    def evalCons(self,X=None):
        pass
    def checkCons(self,X=None,Z=None):
        pass
    def checkMin(self,X=None,Z=None):
        pass
    def checkPb(self,pbName=None):
        pass
    def checkObj(self,pbName=None):
        pass
    def checkGrad(self,pbName=None):
        pass
    def checkAllPb(self):
        pass
    def showDetails(self):
        pass

    def showPbs(self,dictPb=None):
        """ Show the listed problems in dictPb """
        if dictPb is not None:
            #find unconstrained, constrained, multi-objective problems
            dictUn = [x for x in dictPb if x['type'] == 'Un']
            dictCons = [x for x in dictPb if x['type'] == 'Cons']
            dictMulti = [x for x in dictPb if x['type'] == 'Multi']
            nbPb = len(dictUn)+len(dictCons)+len(dictMulti)
            #
            logging.info('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=')
            if nbPb == 0:
                logging.info('No available test problems')
            else:
                logging.info('%i available test problems'%nbPb)
                if len(dictUn)>0:
                    logging.info('------------------------')
                    for x in dictUn.keys():
                        logging.info('Unconstrained: %s'%x)
                    logging.info('------------------------')
                if len(dictCons)>0:
                    logging.info('------------------------')
                    for x in dictCons.keys():
                        logging.info('Constrained: %s (nb constraints: %i)'
                                        %(x,len(dictCons[x]['funcons'])))
                    logging.info('------------------------')
                if len(dictMulti)>0:
                    logging.info('------------------------')
                    for x in dictMulti.keys():
                        logging.info('Constrained: %s (nb objective/constraints: %i/%i)'
                                        %(x,len(dictMulti[x]['funobj']),len(dictMulti[x]['funcons'])))
                    logging.info('------------------------')
            logging.info('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=')

            
