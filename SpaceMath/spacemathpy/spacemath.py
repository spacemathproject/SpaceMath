import numpy as np
from .data import *

class SignalStrenght():
    def __init__(self,R1su,R1sd,R2su,R2sd,latex_name='R'):
        self.R1su = R1su
        self.R1sd = R1sd
        self.R2su = R2su
        self.R2sd = R2sd
        self.latex_name = latex_name
        
    def parameter_space(self,func,n=50000,**kwargs):
        x = []
        for tup in kwargs.values():
            #print(kwargs.keys())
            x.append(np.random.uniform(tup[0],tup[1],n))
        f = func(*x)
        index1s = (f<=self.R1su)*(f>=self.R1sd)
        index2s = (f<=self.R2su)*(f>=self.R2sd)
        data1s = [xi[index1s] for xi in x]
        data1s.append(f[index1s])
        data2s = [xi[index2s] for xi in x]
        data2s.append(f[index2s])
        return data1s,data2s
    
    def parameter_space2(self,func,n=50000,**kwargs):
        from pandas import DataFrame
        x = {key:np.random.uniform(kwargs[key][0],kwargs[key][1],n)
             for key in kwargs.keys()}
        f = func(*[x[i] for i in x.keys()]) 
        index1s = (f<=self.R1su)*(f>=self.R1sd)
        index2s = (f<=self.R2su)*(f>=self.R2sd)
        data1s = {key:x[key][index1s] for key in x}
        data1s[self.latex_name] = f[index1s]
        data2s = {key:x[key][index2s] for key in x}
        data2s[self.latex_name] = f[index2s]
        return DataFrame(data1s),DataFrame(data2s)
    
#class Rtau(SignalStrenght):
#    latex_name = 
    
    #def __init__(self):
    #    SignalStrenght.__init__(self)
        
Rtau = SignalStrenght(RtautauSUP1sig,RtautauINF1sig,RtautauSUP2sig,RtautauINF2sig,latex_name='R_{\tau}')

Rb = SignalStrenght(RbbSUP1sig,RbbINF1sig,RbbSUP2sig,RbbINF2sig,latex_name='R_{b}')

Rgamma = SignalStrenght(RgammagammaSUP1sig,RgammagammaINF1sig,RgammagammaSUP2sig,RgammagammaINF2sig,latex_name='R_{\gamma}')

Rw = SignalStrenght(RwwSUP1sig,RwwINF1sig,RwwSUP2sig,RwwINF2sig,latex_name='R_{W}')
Rz = SignalStrenght(RzzSUP1sig,RzzINF1sig,RzzSUP2sig,RzzINF2sig,latex_name='R_{Z}')

def plot_df(df,colx,coly,latex_names=None,color='#137A7A',alpha=0.5):
    import matplotlib.pyplot as plt
    plt.plot(df[colx],df[coly],'o',color=color,alpha=alpha);
    if latex_names==None:
        plt.xlabel(colx);
        plt.ylabel(coly);
    else:
        plt.xlabel(latex_names[colx]);
        plt.ylabel(latex_names[coly]);
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