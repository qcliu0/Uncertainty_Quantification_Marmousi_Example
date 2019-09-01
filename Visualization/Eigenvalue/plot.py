import os.path
import sys
import numpy as np

try:
    import matplotlib.pyplot as plt
except:
    print("Error importing pyplot from matplotlib, please install matplotlib package first...")
    sys.tracebacklimit=0
    raise Exception("Importing matplotlib failed")

if __name__ == '__main__':

    a = np.loadtxt('eigenvalues.txt')

    a0 = a[0]

    print "a = ", a[:]

    na = np.size(a)

    plt.figure(figsize=(10,5))
    ax = plt.subplot(111)
    plt.plot(range(na),a,color="black",linewidth=1.5)

    ax.legend()
    ax.set_yscale('log')
    plt.xlabel("Order")
    plt.ylabel("Eigenvalue")
    #plt.ylim(5.0e-4,1.1)
    plt.savefig("EgV.png")

