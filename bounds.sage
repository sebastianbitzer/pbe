# ------------------------------------------------ #
# Bounds and Codes for General Phased Burst Errors #
#              Section 3: Bounds                   #
# ------------------------------------------------ #

load('macros.sage')

def rate_classical_GV(q,T):
    """
    asymptotic classical GV bound

    input:
        q: field size
        T: fraction of corrupted symbols

    output:
        R_classical_GV: rate of classical asymptotic GV bound 
    """
    R_classical_GV = 1 - Fq(2*T,q)

    return R_classical_GV

def rate_classical_H(q,T):
    """
    asymptotic classical Hamming bound

    input:
        q: field size
        T: fraction of corrupted symbols

    output:
        R_classical_H: rate of classical asymptotic Hamming bound 
    """

    R_classical_H = 1 - Fq(T,q)

    return R_classical_H

def rate_PBE_H(q, c1, c2, W):
    """
    asymptotic PBE Hamming bound

    input:
        q:  field size
        c1: |E1| = q^{c1*n}
        c2: |E2| = q^{c2*n}
        W:  fraction of corrupted blocks

    output:
        R_H: rate of asymptotic PBE Hamming bound    
    """

    R_H = 1- (1-W)*c1 - W*c2

    return R_H

def rate_H_PBE_H(q, T, W):
    """
    asymptotic Hamming-metric PBE Hamming bound

    input:
        q:  field size
        T:  fraction of erroneous symbols in bad block
        W:  fraction of corrupted blocks

    output:
        R_H: rate of asymptotic PBE Hamming bound    
    """
    c1 = 0
    c2 = Fq(T,q)

    R_H_H = rate_PBE_H(q, c1, c2, W)

    return R_H_H

def rate_PBE_GV(q, c11, c12, c22, W):
    """
    asymptotic PBE GV bound

    input:
        q: field size
        c11: |E11| = q^{c11*n}
        c12: |E12| = q^{c12*n}
        c22: |E22| = q^{c22*n}
        W: fraction of m, corrupted blocks

    output:
        R_GV: rate of asymptotic PBE GV bound     
    """

    if c11 + c22 <= 2*c12:
        if 2*W <= 1:    
            R_GV = 1 - (1-2*W)*c11 - 2*W*c12
        else:           
            R_GV = 1 - 2*(1-W)*c12 - (2*W-1)*c22

    else: # c11 + c22 > 2*c12:
        R_GV = 1 - (1-W)*c11 - W*c22

    return R_GV

def rate_H_PBE_GV(q,T,W):
    """
    asymptotic GV bound for Hammin-metric PBEs

    input:
        q: field size
        T: fraction of errors in corrupted block
        W: fraction of corrupted blocks

    output:
        R_GV_H: rate of asymptotic Hamming-metric PBE GV bound  
    """
    c11 =         0
    c12 = Fq(  T,q)
    c22 = Fq(2*T,q)
    #print(c11,c12,c22,q)

    R_GV_H = rate_PBE_GV(q, c11, c12, c22, W)

    return R_GV_H