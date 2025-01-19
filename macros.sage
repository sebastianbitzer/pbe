# ------------------------------------------------ #
# Bounds and Codes for General Phased Burst Errors #
# ------------------------------------------------ #


import numpy as np
def Hq(x,q):
    """
    qary entropy function
    """
    if x < 0.0000001:
        return 0
    elif x > 1-0.0000001:
        return np.log(q-1)/np.log(q) 
    else:
        return x*np.log(q-1)/np.log(q) - x*np.log(x)/np.log(q) - (1 - x ) * np.log(1-x)/np.log(q)
    
from scipy.optimize import fsolve

def Hqinv(y,q):
    """
    find x such that Hq(x,q) = y
    """
    if y == 1:
        return (q-1)/q
    if y<0.00001:
        return 0
    return fsolve(lambda x: y - Hq(x,q),0.00001)[0]

def Fq(x,q):
    """
    asyptotic ball size
    """
    if x <= (q-1)/q:
        return Hq(x,q)
    else:
        return 1