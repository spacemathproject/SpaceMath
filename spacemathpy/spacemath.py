import numpy as np
from .data import *
from .RXX import *

class Parameters():
    def __init__(self,dict_variables):
        self.dict_variables = dict_variables
    def numpy_dict(self,n=50000):
        variables = self.dict_variables
        keys = variables.keys()
        return {k:np.random.uniform(variables[k][0],variables[k][1],n) for k in keys}

class SignalStrength():
    def __init__(self,R1su,R1sd,R2su,R2sd,func,latex_name='R'):
        self.R1su = R1su
        self.R1sd = R1sd
        self.R2su = R2su
        self.R2sd = R2sd
        self.func = func
        self.latex_name = latex_name
        
    def conditionRx(self,*args,sigma=1):
        if sigma==1:
            return self.R1sd < self.func(*args) < self.R1su
        elif sigma==2:
            return self.R2sd < self.func(*args) < self.R2su
        else:
            print('sigma only can be 1 or 2')
            
    def np_index(self,*args,sigma=1):
        if sigma==1:
            return (self.func(*args)<=self.R1su)*(self.func(*args)>=self.R1sd)
        elif sigma==2:
            return (self.func(*args)<=self.R2su)*(self.func(*args)>=self.R2sd)
        else:
            print('sigma must be 1 or 2')
    
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
    def __init__(self,ghtt=1,ghbb=1,ghtautau=1,ghWW=1,ghZZ=1,gCH=0,mCH=500,model='SM'):
        self.ghtt = ghtt
        self.ghbb = ghbb
        self.ghtautau = ghtautau
        self.ghWW = ghWW
        self.ghZZ = ghZZ
        self.gCH = gCH
        self.mCH = mCH
    
    def parameter_space(self,parameters,sigma=1):
        '''
        couplings: instance of HiggsSignalStrenght
        sigma: number of sigmas it coulbe 1 or 2
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
        index = ind_tau & ind_b & ind_gamma & ind_w & ind_z
        Rindx = {'Rtau':ind_tau,'Rb':ind_b,'Rgamma':ind_gamma,'Rw':ind_w,'Rz':ind_z,'Intersection':index}
        data = {signal:DataFrame({key:parameters[key][Rindx[signal]]
                  for key in parameters.keys()}) for signal in Rindx.keys()}
        return data
    
    
    def __str__(self):
        return f'Model: {self.model} \nghtt,ghbb,ghtautau,ghWW,ghZZ,gCH,mCH'
    
    def RXscondition(self,sigma=1):
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

def plot_df(df,colx,coly,title='SpaceMath',fname=None,marker='o',latex_names=None,color='#137A7A',alpha=0.5):
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
        plt.savefig(fname,dpi=1000)
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