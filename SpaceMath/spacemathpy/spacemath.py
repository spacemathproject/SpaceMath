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

class Couplings():
    def __init__(self,ghtt,ghbb,ghtautau,ghWW,ghZZ,gCH=0,mCH=500,model='SM'):
        self.ghtt = ghtt
        self.ghbb = ghbb
        self.ghtautau = ghtautau
        self.ghWW = ghWW
        self.ghZZ = ghZZ
        self.ghCH = ghCH
        self.mCH = mCH
    
    def __str__(self):
        return f'Model: {self.mosel} \nghtt,ghbb,ghtautau,ghWW,ghZZ,gCH,mCH'

class SignalStrenght():
    def __init__(self,R1su,R1sd,R2su,R2sd,func,latex_name='R'):
        self.R1su = R1su
        self.R1sd = R1sd
        self.R2su = R2su
        self.R2sd = R2sd
        self.func = func
        self.latex_name = latex_name
        
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
            
    
        
Rtau = SignalStrenght(RtautauSUP1sig,RtautauINF1sig,RtautauSUP2sig,RtautauINF2sig,Rtautau,latex_name='Rtau')

Rb = SignalStrenght(RbbSUP1sig,RbbINF1sig,RbbSUP2sig,RbbINF2sig,Rbotbot,latex_name='Rb')

Rgamma = SignalStrenght(RgammagammaSUP1sig,RgammagammaINF1sig,RgammagammaSUP2sig,RgammagammaINF2sig,Rgaga,latex_name='Rgamma')

Rw = SignalStrenght(RwwSUP1sig,RwwINF1sig,RwwSUP2sig,RwwINF2sig,RWW,latex_name='Rw')
Rz = SignalStrenght(RzzSUP1sig,RzzINF1sig,RzzSUP2sig,RzzINF2sig,RZZ,latex_name='Rz')



def plot_df(df,colx,coly,latex_names=None,color='#137A7A',alpha=0.5):
    import matplotlib.pyplot as plt
    plt.plot(df[colx],df[coly],'o',color=color,alpha=alpha);
    if latex_names==None:
        plt.xlabel(colx,fontsize=15);
        plt.ylabel(coly,fontsize=15);
    else:
        plt.xlabel(latex_names[colx],fontsize=15);
        plt.ylabel(latex_names[coly],fontsize=15);
    plt.show()
    
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