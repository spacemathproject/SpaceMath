# Python SpaceMath version

This branch of SpaceMath project is an alternative implementation in python 3.*. Where python libraries as numpy, pandas, sympy, matplotlib and seaborn are used to scan allowed parameter space in BSM models considering signals strength experimental values of Standard model Higgs decays.

You can try spacemathpy with binder only needs click in the next icon.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/spacemathproject/SpaceMath/MoyPython)

and then open some example inside of `Examples` folder.
## Installation

### Install git
For more details click [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
#### Ubuntu
Open a terminal and write the following comands
'''
sudo apt update
sudo apt install git
'''
#### Windows
Click on [Git for windows](https://git-scm.com/download/win) and the .exe file will be downloaded, finally execute it.

#### MacOs
There are several ways to install Git on a Mac. The easiest is probably to install the Xcode Command Line Tools. On Mavericks (10.9) or above you can do this simply by trying to run git from the Terminal the very first time.

$ git --version

If you don’t have it installed already, it will prompt you to install it.


###Install spacemathpy 

#### Recommended installation
From MoyPython branch of SpaceMath github repository we install spacemath in a terminal with the next command

`pip install git+https://github.com/spacemathproject/SpaceMath.git@MoyPython`

#### Alternative installation
Our package is a library for python 3 users that can be installed if you download `MoyPython` branch of SpaceMath github repository with `Download Zip` buttom.

![MoyPython](github-MoyPython.png)

The folder downloaded is `SpaceMath-MoyPython.zip`. After of uncompress it, open in a terminal `dist` folder inside of `\SpaceMath-MoyPython\dist` and finally you can run 

`pip install spacemathpy-0.1.tar.gz`

Congratulations spacemathpy is installed.

You can use spacemathpy in scripts but is recomendable use jupyter notebook to ease each work, you will find 2HDM example in `\SpaceMath\Examples` folder

spacemathpy depends on numpy, pandas, sympy, and matplotlib to properly works, but when you install spacemathpy all of them are installed automatically.

### Uninstall spacemathpy
Finally, if you decide uninstall spacemathpy you only need run the next command in any folder in your terminal 

`pip uninstall spacemathpy`


