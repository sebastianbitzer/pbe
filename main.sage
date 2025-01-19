# ------------------------------------------------ #
# Bounds and Codes for General Phased Burst Errors #
#                      Main File                   #
# ------------------------------------------------ #


load('construction.sage')
load('bounds.sage')

# general parameters #
q = 2
n = 50
m = 50


if True:
    W = 0.3
    print(f'% fix W={W}, vary T')
    for t in range(n+1):
        T  = N(t/n)
        R_2  = rate_const2(q,T,W)
        R_3  = rate_const3(q,T,W) 


        R_GV = rate_H_PBE_GV(q,T,W)
        R_H  = rate_H_PBE_H(q, T, W)

        #print(f'{T} {R_2} \\\\')
        print(f'{T} {R_3} \\\\')

        #print(f'{T} {R_GV} \\\\')
        #print(f'{T} {R_H} \\\\')
    print('~~~')

if False:    
    T = 0.3
    print(f'% fix T={T}, vary W')
    for w in range(m+1):
        W  = N(w/m)
        R_2 = rate_const2(q,T,W) 
        R_3 = rate_const3(q,T,W) 

        R_GV = rate_H_PBE_GV(q,T,W)
        R_H  = rate_H_PBE_H(q, T, W)

        #print(f'{W} {R_2} \\\\')
        print(f'{W} {R_3} \\\\')
        #print(f'{W} {R_GV} \\\\')
        #print(f'{T} {R_H} \\\\')
