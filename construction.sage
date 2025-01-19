# ------------------------------------------------ #
# Bounds and Codes for General Phased Burst Errors #
#              Section 4: Constructions            #
# ------------------------------------------------ #

load('macros.sage')

def rate_const2(q,T,W):
    """
    asymptotic rate of 2-level construction 

    Construction of [1] is recoverd in the Hamming-metric case
    
    [1] Jack Wolf, "On codes derivable from the tensor product of check matrices."

    input:
        q: field size
        T: fraction of errors in corrupted block
        W: fraction of corrupted blocks

    output:
        R2: achieved rate
    """

    R2 = 1 - min(1, 2*W) * Fq(2*T,q)

    return R2


def rate_const3(q,T,W):
    """
    asymptotic rate of proposed 3-level construction

    input:
        q: field size
        T: fraction of n, errors in corrupted block
        W: fraction of m, corrupted blocks

    output:
        R3: achieved rate
    """

    R3 = 1 - W * Fq(2*T,q) - min(W, 1-W) * Fq(T,q)

    return R3