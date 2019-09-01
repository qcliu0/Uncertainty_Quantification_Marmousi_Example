#!/usr/bin/env python

import os.path
import sys
import numpy as np
from mpl_toolkits.axes_grid1 import make_axes_locatable
from matplotlib.ticker import MultipleLocator, FormatStrFormatter  

#import matplotlib.pyplot as plt

from matplotlib import cm
from matplotlib.colors import LinearSegmentedColormap, ColorConverter

from matplotlib import pylab
#from pylab import colorbar, clf, axes, linspace, pcolor, meshgrid, show, axis, title
#from scitools.easyviz.matplotlib_ import colorbar, clf, axes, linspace,\
             #pcolor, meshgrid, show, colormap

from numpy import sort 
try:
    import matplotlib.pyplot as plt
except:
    print("Error importing pyplot from matplotlib, please install matplotlib package first...")
    sys.tracebacklimit=0
    raise Exception("Importing matplotlib failed")

def grid(x, y, z, resX=500, resY=500):
    """
    Converts 3 column data to matplotlib grid
    """
    from matplotlib.mlab import griddata
    #from scipy.interpolate import griddata

    xi = np.linspace(min(x), max(x), resX)
    yi = np.linspace(min(y), max(y), resY)

    # mlab version
    Z = griddata(x, y, z, xi, yi, interp='linear')
    # scipy version
    #Z = griddata((x, y), z, (xi[None,:], yi[:,None]), method='cubic')

    X, Y = np.meshgrid(xi, yi)
    return X, Y, Z


def clamp(x,xmin,xmax):
    if x < xmin:
        return xmin
    elif x > xmax:
        return xmax
    else:
        return x


def hsl2rgb(h, s, l):
    """
    HSL in range 0-1 to rgb in range 0-1 (H-hue, S-saturation, L-lightness)
    """
    # see: http://geekymonkey.com/Programming/CSharp/RGB2HSL_HSL2RGB.htm
    # default
    RGB = [1.0, 1.0, 1.0]

    if l <= 0.5:
        v = l * (1.0 + s)
    else:
        v = l + s - l * s

    if v > 0:
        m = l + l - v
        sv = (v - m ) / v
        h *= 6.0

        sextant = int(h)
        fract = h - sextant
        vsf = v * sv * fract
        mid1 = m + vsf
        mid2 = v - vsf

        if sextant == 0:
            RGB = [v,mid1,m]
        elif sextant == 1:
            RGB = [mid2,v,m]
        elif sextant == 2:
            RGB = [m,v,mid1]
        elif sextant == 3:
            RGB = [m,mid2,v]
        elif sextant == 4:
            RGB = [mid1,m,v]
        elif sextant == 5:
            RGB = [v,m,mid2]

    return RGB

def make_custom_colormap(type):
    """
    arbitrary function based colormap
    """
    n = 30
    R = []
    G = []
    B = []
    x0 = []
    for i in range(n+1):
        # range 0 to 1
        x = i/(1.0*n)

        # RGB triple already:
        RGB = [1.0,1.0,1.0]

        # rainbow (blue-cyan-green-yellow-orange-red)
        if type == 0:
            # color function: x in [-1,1]
            v = 2.0 * x - 1.0
            RGB[0] = clamp(1.5 - abs(2*v - 1),0,1)
            RGB[1] = clamp(1.5 - abs(2*v),0,1)
            RGB[2] = clamp(1.5 - abs(2*v + 1),0,1)

        # hot-to-cold (blue-green-yellow-red)
        if type == 1:
            # color function: x in [-1,1]
            v = 2.0 * x - 1.0
            RGB[0] = clamp(2 - abs(2*v - 2),0,1)
            RGB[1] = clamp(2 - abs(2*v),0,1)
            RGB[2] = clamp(2 - abs(2*v + 2),0,1)

        # hsl
        if type == 2:
            # color function: x in [0,1]
            v = x
            if v < 0.25:
                RGB = hsl2rgb(0.01, v, 0.5)
            elif v < 0.5:
                RGB = hsl2rgb(0.2, v, 0.5)
            elif v < 0.75:
                RGB = hsl2rgb(0.3, v, v)
            else:
                RGB = hsl2rgb(0.12, v, v)

        # hot variation
        if type == 3:
            # color function: x in [0,1]
            v = 1 - (1-x)*(1-x)
            # red
            if v < 0.6:
                RGB[0] = v / 0.6
            else:
                RGB[0] = 1.0
            # green
            if v < 0.2:
                RGB[1] = 0.0
            elif v < 0.7:
                RGB[1] = (v - 0.2) / 0.5
            else:
                RGB[1] = 1.0
            # blue
            if v < 0.4:
                RGB[2] = 0.0
            elif v < 0.8:
                RGB[2] = (v-0.4) / 0.4
            else:
                RGB[2] = 1.0

        # hot
        if type == 4:
            # color function: x in [0,1]
            v = x
            #v = 1 - (1-x)*(1-x)
            # red
            if v < 0.5: # hot would go till 0.36
                RGB[0] = 0.0416 + (1.0 - 0.0416) * v / 0.5
            else:
                RGB[0] = 1.0
            # green
            if v < 0.36:
                RGB[1] = 0.0
            elif v < 0.75:
                RGB[1] = (v - 0.36) / (0.75 - 0.36)
            else:
                RGB[1] = 1.0
            # blue
            if v < 0.75:
                RGB[2] = 0.0
            elif v < 0.9: # hot would go till 1.0
                RGB[2] = (v-0.75) / (0.9 - 0.75)
            else:
                RGB[2] = 1.0

        # YlOrBr
        if type == 5:
            # color function: x in [0,1]
            v = 1 - (1-x)*(1-x)
            # red
            if v < 0.6:
                RGB[0] = v / 0.6
            else:
                RGB[0] = 1.0
            # green
            if v < 0.2:
                RGB[1] = 0.0
            elif v < 0.7:
                RGB[1] = (v - 0.2) / 0.5
            else:
                RGB[1] = 1.0
            # blue
            if v < 0.4:
                RGB[2] = 0.0
            elif v < 0.8:
                RGB[2] = (v-0.4) / 0.4
            else:
                RGB[2] = 1.0

        # terrain (blue-dark-blue-white-brown-red-yellow-black)
        if type == 6:
            # color function: x in [0,1]
            #v = 1 - (1-x)*(1-x)
            v = x
            # HSL (hue-saturation-lightness)
            # http://www.workwithcolor.com/hsl-color-picker-01.htm?cp=0000FF
            # turquise
            h0 = 185./360.
            s0 = 1.0
            l0 = 0.61
            # dark blue
            h1 = 225./360.
            s1 = 0.35
            l1 = 0.28
            # white (from blue)
            h2a = 240./360.
            s2a = 1.0
            l2a = 1.0

            # white
            h2b = 20./360.
            s2b = 0.2
            l2b = 1.0
            # brown-green
            h3 = 45./360.
            s3 = 0.75
            l3 = 0.34
            # red
            h4 = 0.0
            s4 = 1.0
            l4 = 0.5
            # yellow
            h5 = 61./360.
            s5 = 1.0
            l5 = 0.5
            # black
            h6 = 61./360.
            s6 = 0.0
            l6 = 0.1

            # turquise-blue-white
            array1_h = [h0,h1,h2a]
            array1_s = [s0,s1,s2a]
            array1_l = [l0,l1,l2a]

            # white-brown-red-yellow-black
            array2_h = [h2b,h3,h4,h5,h6]
            array2_s = [s2b,s3,s4,s5,s6]
            array2_l = [l2b,l3,l4,l5,l6]

            # sets the split value between the 2 color ranges (separated by white)
            split = 0.5

            for ii in range(2):
                h = 0.0
                s = 1.0
                l = 0.0
                # value scale and number of color increments
                if ii == 0:
                    incr = 2
                    delta = split/incr
                    v0 = 0.0
                    array_hsl = [array1_h,array1_s,array1_l]
                else:
                    incr = 4
                    delta = (1.0 - split)/incr
                    v0 = split
                    array_hsl = [array2_h,array2_s,array2_l]
                #print("array hsl",array_hsl)

                done_color = False
                for jj in range(incr):
                    thr1 = v0 + jj*delta
                    thr2 = v0 + (jj+1)*delta
                    if v >= thr1 and v <= thr2:
                        fac = (v - thr1)/delta
                        h1 = array_hsl[0][jj]
                        h2 = array_hsl[0][jj+1]
                        s1 = array_hsl[1][jj]
                        s2 = array_hsl[1][jj+1]
                        l1 = array_hsl[2][jj]
                        l2 = array_hsl[2][jj+1]
                        h = h1 + (h2-h1)*fac
                        s = s1 + (s2-s1)*fac
                        l = l1 + (l2-l1)*fac
                        #print("range ",jj,v,fac,h,s,l)
                        done_color = True
                        break
                if done_color: break

            if v == 1.0:
                h = 0.0
                s = 0.0
                l = 0.01
            #print("terrain hsl ",i,v,h,s,l)
            #print("")
            RGB = hsl2rgb(h, s, l)

        x0.append(x)
        R.append(RGB[0])
        G.append(RGB[1])
        B.append(RGB[2])

    cmap_dict = {}
    cmap_dict['red'] = [(x0[i],R[i],R[i]) for i in range(len(R))]
    cmap_dict['green'] = [(x0[i],G[i],G[i]) for i in range(len(G))]
    cmap_dict['blue'] = [(x0[i],B[i],B[i]) for i in range(len(B))]
    mymap = LinearSegmentedColormap('mymap',cmap_dict)
    return mymap


def make_colormap(colors):
    """
    Define a new color map based on values specified in the dictionary
    colors, where colors[z] is the color that value z should be mapped to,
    with linear interpolation between the given values of z.

    The z values (dictionary keys) are real numbers and the values
    colors[z] can be either an RGB list, e.g. [1,0,0] for red, or an
    html hex string, e.g. "#ff0000" for red.
    """
    z = sort(colors.keys())

    n = len(z)
    z1 = min(z)
    zn = max(z)
    x0 = (z - z1) / (zn - z1)

    CC = ColorConverter()
    R = []
    G = []
    B = []
    for i in range(n):
        #i'th color at level z[i]:
        Ci = colors[z[i]]
        if type(Ci) == str:
            # a hex string of form '#ff0000' for example (for red)
            RGB = CC.to_rgb(Ci)
        else:
            # assume it's an RGB triple already:
            RGB = Ci
        R.append(RGB[0])
        G.append(RGB[1])
        B.append(RGB[2])

    cmap_dict = {}
    cmap_dict['red'] = [(x0[i],R[i],R[i]) for i in range(len(R))]
    cmap_dict['green'] = [(x0[i],G[i],G[i]) for i in range(len(G))]
    cmap_dict['blue'] = [(x0[i],B[i],B[i]) for i in range(len(B))]
    mymap = LinearSegmentedColormap('mymap',cmap_dict)
    return mymap

def plot_kernels(filename,show=False):
    """
    plots ASCII kernel file
    """
    print "plotting kernel file: ",filename
    print ""

    data = np.loadtxt(filename)

    # checks data
    if data.ndim != 2:
        print "Error: wrong data dimension for kernel file",data.ndim
        sys.tracebacklimit=0
        raise Exception("Invalid data dimension")

    # checks array
    if len(data[1,:]) != 5:
        print "data shape  : ",data.shape
        print "data lengths: ",len(data[:,1]),len(data[1,:])
        print "Error: wrong data format for kernel file",data.shape
        sys.tracebacklimit=0
        raise Exception("Invalid data format")

    # splits up data
    x = data[:,0]
    y = data[:,1]

    print "dimensions:"
    print "  x-range min/max = %f / %f" % (x.min(), x.max())
    print "  y-range min/max = %f / %f" % (y.min(), y.max())
    print ""
    #ytmp = y.max()
    #y = y.max() - y
    #x = x / x.max() * 9000
    #x = x.max() - x
    z1 = data[:,2] # e.g. rho
    z2 = data[:,3] # e.g. alpha
    z3 = data[:,4] # e.g. beta

    # names like
    #   rhop_alpha_beta_kernel.dat
    # or
    #   proc000000_rhop_alpha_beta_kernel.dat
    name = os.path.basename(file)

    name_kernels = str.split(name,"_")
    if len(name_kernels) == 4:
        kernel1 = 'K_' + name_kernels[0] # rhop
        kernel2 = 'K_' + name_kernels[1] # alpha
        kernel3 = 'K_' + name_kernels[2] # beta
    elif len(name_kernels) == 5:
        kernel1 = 'K_' + name_kernels[1]
        kernel2 = 'K_' + name_kernels[2]
        kernel3 = 'K_' + name_kernels[3]
    else:
        kernel1 = 'K_1'
        kernel2 = 'K_2'
        kernel3 = 'K_3'

    kernel2 = 'VP'
    kernel3 = 'VS'	

    print "statistics:"
    print "  %12s : min/max = %e / %e" % (kernel1,z1.min(),z1.max())
    print "  %12s : min/max = %e / %e" % (kernel2,z2.min(),z2.max())
    print "  %12s : min/max = %e / %e" % (kernel3,z3.min(),z3.max())
    print ""

    total_max = (np.concatenate((z2,z3))).max()*0.9
    #total_min = (np.concatenate((z2,z3))).min()*0.9
    total_max = 6000
    total_min = 835
    print "  data max = ",total_max
    print "  data min = ",total_min
    print ""
    
    #total_max = 4500
    #total_min = 1000

    # setup figure (with 3 subplots)
    fig, axes = plt.subplots(nrows=1, ncols=1,figsize=(10,4))

    zinterval = (total_max - total_min)/5.0

    xmajorLocator   = MultipleLocator(2000)
    ymajorLocator   = MultipleLocator(1000)
    zmajorLocator   = MultipleLocator(zinterval)
    axes.xaxis.set_major_locator(xmajorLocator)
    axes.yaxis.set_major_locator(ymajorLocator)  

    ax = axes

    X, Y, Z = grid(x,y,z3)
    axes.set_ylabel(kernel3)

    #divider = make_axes_locatable(axes)
    axes = plt.gca()
    axes.invert_yaxis()
    #cax = divider.append_axes('right', size='2%', pad=0.05)

    colormap = 'jet'
        #colormap = 'RdBu'
    #colormap = 'PuBu'
    #colormap = 'coolwarm'
    #plt.gca().invert_yaxis()
    #plt.style.use('ggplot') 
    my_colormap = make_colormap({0.0:[0.1,0.0,0.0],
                                 0.2:[0.8,0.0,0.0],
                                 0.3:[1.0,0.7,0.0],
                                 0.42:[0.92,0.92,0.92],
                                 0.5:[0.92,0.92,0.92],
                                 0.58:[0.92,0.92,0.92],
                                 0.7:[0.0,0.6,0.7],
                                 0.8:[0.0,0.0,0.8],
                                 1.0:[0.0,0.0,0.1]})

    my_colormap = make_custom_colormap(6)

    im = ax.imshow(Z,vmax=total_max, vmin=total_min,
                       extent=[x.min(), x.max(), y.min(), y.max()],cmap=my_colormap)

    # moves plots together
    #fig.subplots_adjust(hspace=0)
    #plt.setp([a.get_xticklabels() for a in fig.axes[:-1]], visible=False)
    cbar = fig.colorbar(im,orientation='vertical',fraction=0.016, pad=0.02)

    cbar.set_ticks(zmajorLocator)
    # colorbar
    #fig.colorbar(im, ax=axes.ravel().tolist())
    #fig.colorbar(im, ax=axes.ravel().tolist(),orientation='horizontal')

    # show the figure


    fname = 'Null-space sampled VS 3 ($D_{misfit} = 1.53e-2$)'
    plt.gca().invert_yaxis()
    plt.title(fname,fontsize=20)
    if show:
        plt.figure()

    # saves kernel figure as file
    dir = os.path.dirname(file)
    name_without_ending = str.split(name,".")[0]
    outfile = dir + "./"+ "fig8h.png"
    fig.savefig(outfile, format="png")

    print "*****"
    print "plotted file: ",outfile
    print "*****"
    print ""


def usage():
    print "usage: ./plot_kernel.py file [1 == show figure / 0 == just plot file]"
    print "   where"
    print "       file - ASCII kernel file, e.g. OUTPUT_FILES/proc000000_rhop_alpha_beta_kernel.dat"

if __name__ == '__main__':
    # gets arguments
    if len(sys.argv) < 2:
        usage()
        sys.exit(1)
    else:
        file = sys.argv[1]

    if len(sys.argv) > 2:
        show_plot = sys.argv[2]
    else:
        show_plot = 0

    if show_plot == '1':
        plot_kernels(file,show=True)
    else:
        plot_kernels(file)

