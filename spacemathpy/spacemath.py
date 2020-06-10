from numpy import seterr
seterr(all='ignore')# to ignore numpy errors
from .data import *
from .RXX import *

#class Parameters():
#    def __init__(self,dict_variables):
#        self.dict_variables = dict_variables
#    def numpy_dict(self,n=50000):
#        variables = self.dict_variables
#        keys = variables.keys()
#        return {k:np.random.uniform(variables[k][0],variables[k][1],n) for k in keys}

class SignalStrength():
    '''Class for represent a generic signal strenght
    
    Atributes
    ---------
        R1su, R1sd: float
            Bounds for 1 sigma R1su upper and R1sd lower bounds.
        R2su, R2sd: float
            Bounds for 2 sigma R1su upper and R1sd lower bounds.
        func: function
            Analitic function associated to signal strength
        latex_name: str
            Name to signal stregth.
        
    Methods
    -------
    conditionRx(*args,sigma=1)
        args is a list with the arguments of func. Each element in args is float or
        sympy instance.
        if sigma==1:
            Return True if R1sd < func(*args) < R1su
        elif sigma==2:
            Return True if R2sd < func(*args) < R2su
        else:
            Prints message "sigma only can be 1 or 2"
        
    np_index(*args,sigma=1)
        args is a list with the arguments of func. Each element in args is a
        numpyrandom.uniform instance.
        if sigma==1:
            Return numpy array with True Y False depending of condition
            R1sd < func(*args) < R1su.
        elif sigma==2:
            Return numpy array with True Y False depending of condition
            R1sd < func(*args) < R1su. 
        else:
            Prints message "sigma only can be 1 or 2"
    
    '''
    def __init__(self,R1su,R1sd,R2su,R2sd,func,latex_name='R'):
        '''
        Parameters
        ----------
            R1su, R1sd: float
                Bounds for 1 sigma R1su upper and R1sd lower bounds.
            R2su, R2sd: float
                Bounds for 2 sigma R1su upper and R1sd lower bounds.
            func: function
                Analitic function associated to signal strength
            latex_name: str
            Name to signal stregth.
        '''
        self.R1su = R1su
        self.R1sd = R1sd
        self.R2su = R2su
        self.R2sd = R2sd
        self.func = func
        self.latex_name = latex_name
    
    def __str__(self):
        return (f'{self.__class__.__name__}('
               f'{self.R1su!r},{self.R1sd!r},{self.R2su!r},{self.R2sd!r},{self.func!r},{self.latex_name!r})')
    def __repr__(self):
        return (f'Higgs Signal streght observable with bounds: {self.R1sd} < {self.latex_name} <{self.R1su} at 1 sigma and {self.R2sd} < {self.latex_name}< {self.R2su} at 2 sigma.')
    
    def conditionRx(self,*args,sigma=1):
        '''
        args is a list with the arguments of func. Each element in args is float or
        sympy instance.
        if sigma==1:
            Return True if R1sd < func(*args) < R1su
        elif sigma==2:
            Return True if R2sd < func(*args) < R2su
            
        Raises
        ------
        ValueError
            If sigma is different to 1 or 2.
        '''
        if sigma==1:
            return self.R1sd < self.func(*args) < self.R1su
        elif sigma==2:
            return self.R2sd < self.func(*args) < self.R2su
        else:# sigma!=1 or sigma!=2:
            raise ValueError("sigma only can be 1 or 2")
            
    def np_index(self,*args,sigma=1):
        '''
        args is a list with the arguments of func. Each element in args is a numpy
        instance.
        if sigma==1:
            Return numpy array with True and False elements depending of condition
            R1sd < func(*args) < R1su.
        elif sigma==2:
            Return numpy array with True and False elements depending of condition
            R1sd < func(*args) < R1su.
            
        Raises
        ------
        ValueError
            If sigma is different to 1 or 2.
        '''
        if sigma==1:
            return (self.func(*args)>=self.R1sd) & (self.func(*args)<=self.R1su)
        elif sigma==2:
            return (self.func(*args)>=self.R2sd) &(self.func(*args)<=self.R2su)
        else:
            raise ValueError("sigma only can be 1 or 2")
    
    def parameter_space_numpy(self,couplings,parameters):
        '''
        coupling: list or tuple
        parameters: list or tuple
        
        return: {'1s':[var1,var2,..],'2s':[var1,var2,...]}
        '''
        f = self.func(*couplings)
        index1s = (f<=self.R1su)*(f>=self.R1sd)
        index2s = (f<=self.R2su)*(f>=self.R2sd)
        data1s = [p[index1s] for p in parameters]
        data1s.append(f[index1s])
        data2s = [p[index2s] for p in parameters]
        data2s.append(f[index2s])
        return {'1s':data1s,'2s':data2s}
    
    def parameter_space_pandas(self,couplings,parameters):
        '''
        couplings: list or tuple
        parameters: dict
        '''
        from pandas import DataFrame
        f = self.func(*couplings) 
        index1s = (f<=self.R1su)*(f>=self.R1sd)
        index2s = (f<=self.R2su)*(f>=self.R2sd)
        data1s = {key:parameters[key][index1s] for key in parameters.keys()}
        data1s[self.latex_name] = f[index1s]
        data2s = {key:parameters[key][index2s] for key in parameters.keys()}
        data2s[self.latex_name] = f[index2s]
        return {'1s':DataFrame(data1s),'2s':DataFrame(data2s)}

Rtau = SignalStrength(RtautauSUP1sig,RtautauINF1sig,RtautauSUP2sig,RtautauINF2sig,Rtautau,latex_name='Rtau')

Rb = SignalStrength(RbbSUP1sig,RbbINF1sig,RbbSUP2sig,RbbINF2sig,Rbotbot,latex_name='Rb')

Rgamma = SignalStrength(RgammagammaSUP1sig,RgammagammaINF1sig,RgammagammaSUP2sig,RgammagammaINF2sig,Rgaga,latex_name='Rgamma')

Rw = SignalStrength(RwwSUP1sig,RwwINF1sig,RwwSUP2sig,RwwINF2sig,RWW,latex_name='Rw')
Rz = SignalStrength(RzzSUP1sig,RzzINF1sig,RzzSUP2sig,RzzINF2sig,RZZ,latex_name='Rz')
    

class HiggsSignalStrength():
    '''Class to represent a Higgs signal strenght
    
    Atributes
    ---------
        ghtt: float, sympy or numpy instance
            Higgs coupling with top quarks
        ghbb: float, sympy or numpy instance
            Higgs coupling with bottom quarks
        ghtautau: float, sympy or numpy instance
            Higgs coupling with tau leptons
        ghWW: float, sympy or numpy instance
            Higgs coupling with W bosons
        ghZZ: float, sympy or numpy instance
            Higgs coupling with Z bosons
        gCH: float, sympy or numpy instance
            Higgs coupling with chaged Higgs
        mCH: float, sympy or numpy instance
            Charged scalar mass
        model: str
            Model name
        
    Methods
    -------
    parameter_space(parameters,sigma=1)
        parameter:dict
            python dictionary with keys equal to names 
            the variables of which a the Higgs couplings depends.
            The values are numpy array with initial values of 
            Higgs coupings.
            
        Returns a python dict with keys associates to each 
        Higgs signal strenght and as a values DataFrame instances
        with the values of Higgs couplings allowed by Higgs 
        Signal Stregths.
    
    RXscondition(self,sigma=1):
        sigma: int equal to 1 or 2
            
            Return True if the float values for the Higgs couplings
            fullfill all the Higgs signals contraints to 1 or 2 sigmas, 
            otherwise return False.
    
    '''
    def __init__(self,ghtt=1,ghbb=1,ghtautau=1,ghWW=1,ghZZ=1,gCH=0,mCH=500,model='SM'):
        '''
        Parameters
        ----------
            ghtt: float, sympy or numpy instance
                Higgs coupling with top quarks
            ghbb: float, sympy or numpy instance
                Higgs coupling with bottom quarks
            ghtautau: float, sympy or numpy instance
                Higgs coupling with tau leptons
            ghWW: float, sympy or numpy instance
                Higgs coupling with W bosons
            ghZZ: float, sympy or numpy instance
                Higgs coupling with Z bosons
            gCH: float, sympy or numpy instance
                Higgs coupling with chaged Higgs
            mCH: float, sympy or numpy instance
                Charged scalar mass
            model: str
                Model name
        '''
        self.ghtt = ghtt
        self.ghbb = ghbb
        self.ghtautau = ghtautau
        self.ghWW = ghWW
        self.ghZZ = ghZZ
        self.gCH = gCH
        self.mCH = mCH
        self.model = model
    
    def __str__(self):
        return (f'{self.__class__.__name__}('
               f'{self.ghtt!r},{self.ghbb!r},{self.ghtautau!r},{self.ghWW!r},{self.ghZZ!r},{self.gCH!r},{self.mCH!r},{self.model!r})')
    def __repr__(self):
        from pandas import DataFrame
        #return f'{self.model} Higgs couplings given by:' + f'\nghtt = {self.ghtt}' + f'\nghbb = {self.ghbb}'+ f'\nghtautau = {self.ghtautau}' + f'\nghWW = {self.ghWW}' + f'\nghZZ = {self.ghZZ}'
        coups = {'ghtt':self.ghtt,'ghbb':self.ghbb,'ghtautau':self.ghtautau,'ghWW':self.ghWW,'ghZZ':self.ghZZ,'gCH':self.gCH,'mCH':self.mCH}
        if self.gCH == 0:
            return f'{self.model} couplings\n' + str(DataFrame({cou:coups[cou] for cou in ['ghtt','ghbb','ghtautau','ghWW','ghZZ']}))
        else:
            return f'{self.model} couplings\n' +  str(DataFrame({cou:coups[cou] for cou in coups.keys()}))
    
    def parameter_space(self,parameters,sigma=1):
        '''
        parameter_space(parameters,sigma=1)
        
        Parameters
        ----------
            parameter:dict
                python dictionary with keys equal to names 
                of the variables of which the Higgs couplings depends.
                The values are numpy array with initial values of 
                Higgs coupings.
            sigma: int
                Confidence level sigma equal to 1 or 2
                
        Returns a python dict with keys associates to each 
        Higgs signal strenght and as a values DataFrame instances
        with the values of Higgs couplings allowed by Higgs 
        Signal Stregths.
        '''
        from pandas import DataFrame
        #global Rtau,Rb,Rgamma,Rw,Rz
        ghtt = self.ghtt
        ghbb = self.ghbb
        ghtautau = self.ghtautau
        ghWW = self.ghWW
        ghZZ = self.ghZZ
        gCH = self.gCH
        mCH = self.mCH
        ind_tau = Rtau.np_index(ghtt,ghbb,ghtautau,sigma=sigma)
        ind_b = Rb.np_index(ghtt,ghbb,sigma=sigma)
        ind_gamma = Rgamma.np_index(ghtt,ghbb,ghWW,gCH,mCH,sigma=sigma)
        ind_w = Rw.np_index(ghtt,ghbb,ghWW,sigma=sigma)
        ind_z = Rz.np_index(ghtt,ghbb,ghZZ,sigma=sigma)
        index = ind_z*ind_w*ind_gamma*ind_tau*ind_b 
        Rindx = {'Rtau':ind_tau,'Rb':ind_b,'Rgamma':ind_gamma,'Rw':ind_w,'Rz':ind_z,'Intersection':index}
        data = {signal:DataFrame({key:parameters[key][Rindx[signal]]
                  for key in parameters.keys()}) for signal in Rindx.keys()}
        return data
    
    def RXscondition(self,sigma=1):
        '''
        Parameters
        ----------
            sigma: int 
                Confidence level sigma equal to 1 or 2
            
            Return True if the float values for the Higgs couplings
            fullfill all the Higgs signals contraints to 1 or 2 sigmas, 
            otherwise return False.
        '''
        ghtt = self.ghtt
        ghbb = self.ghbb
        ghtautau = self.ghtautau
        ghWW = self.ghWW
        ghZZ = self.ghZZ
        gCH  = self.gCH
        mCH = self.mCH       
        return (Rtau.conditionRx(ghtt,ghbb,ghtautau,sigma=sigma) and 
        Rb.conditionRx(ghtt,ghbb,sigma=sigma) and 
       Rgamma.conditionRx(ghtt,ghbb,ghWW,gCH,mCH,sigma=sigma) and
       Rw.conditionRx(ghtt,ghbb,ghWW,sigma=sigma) and
       Rz.conditionRx(ghtt,ghbb,ghZZ,sigma=sigma))
    
##########################################################33
###################PLOTS
#############################################################

def plot_df(df,colx,coly,title='SpaceMath',fname=None,marker='.',latex_names=None,color='#137A7A',alpha=0.5):
    '''
    Parameters
    ----------
    df: pd.DataFrame
        DataFrame instance whih columns equal to 
        the parameter of which the Higgs signal depends. 
        We  wait that df will be an output of 
        parameter_space method of HiggsSignalStrength class.
    colx,coly: str
        Names of the column x and y taken of the posible 
        columns of df
    title: str
        Title to the plot as default title=SpaceMath
    fname: str
        By default fname is equal to None. If you want to 
        save this plot choose a name and its path.
    marker: str
        Kind of point, by default marker='.'
    latex_names:dict
        By default is equal to None. If you want an latex name 
        associated to the columns chosen you need write a dict
        with keys equal to the associated name of the column in 
        df and its latex name as a corresponding value.
    color: str
        Color to plot. By default color=#137A7A
    alpha: float
        Opacity by default alpha=0.5
    '''
    import matplotlib.pyplot as plt
    plt.plot(df[colx],df[coly],marker,color=color,alpha=alpha);
    if latex_names==None:
        plt.xlabel(colx,fontsize=15);
        plt.ylabel(coly,fontsize=15);
    else:
        plt.xlabel(latex_names[colx],fontsize=15);
        plt.ylabel(latex_names[coly],fontsize=15);
    plt.title(title,fontsize=15);
    if fname!=None:
        plt.savefig(fname,dpi=100)
    else:
        pass
    plt.show();
    
def plot_tabledf(df,coly,latex_names=None,alpha=0.5,color='#137A7A'):
    keys = list(df.keys())
    keys.remove(coly)
    l = len(keys)
    if l==1:
        colx = keys[0]
        plot_df(df,colx,coly,latex_names)
    elif l>1:
        import matplotlib.pyplot as plt
        if l%2==0:
            n = int(l/2)
            rows = [keys[x:x+n] for x in range(0,len(keys),n)]
            fig,axes = plt.subplots(2,n,sharey=True)
            nrows = len(rows)
            for i in range(2):
                for j in range(len(rows[0])):
                    axes[i,j].plot(df[rows[i][j]],df[coly],'o',alpha=alpha,color=color)
                    if latex_names==None:
                        axes[i,j].set(xlabel=rows[i][j],ylabel=coly)
                    else:
                        axes[i,j].set(xlabel=latex_names[rows[i][j]],
                                        ylabel=latex_names[coly])
                #plt.legends()
            fig.tight_layout()
            plt.show()
        #else:               
    else:
        print(f'{df.keys()} needs almost two column')
