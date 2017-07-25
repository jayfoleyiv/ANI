import numpy
import EMpy
import pylab
import cmath
# define the multilayer

epsreal = numpy.loadtxt("DIEL/lim_epsr.dat")
epsimag = numpy.loadtxt("DIEL/lim_epsi.dat")

for kk in range (90):

  print(" ")
  for jj in range(len(epsreal)):

    #epsx=-11626.966047+0.000179j
    #epsy=-27434.576809+0.000028j
    #epsz=1.941488+0.000663j
    epsx=epsreal[jj,1]+epsimag[jj,1]*1j
    epsy=epsreal[jj,2]+epsimag[jj,2]*1j
    epsz=epsreal[jj,3]+epsimag[jj,3]*1j
    #print(jj,epsx)

    tx = cmath.sqrt(epsx)
    nx = abs(tx.real)+abs(tx.imag)*1j

    ty = cmath.sqrt(epsy)
    ny = abs(ty.real)+abs(ty.imag)*1j   

    tz = cmath.sqrt(epsz)
    nz = abs(tz.real)+abs(tz.imag)*1j

    #print(nx, ny, nz)
    epsilon = [1.0 ** 2 * EMpy.constants.eps0 * numpy.eye(3),
           EMpy.constants.eps0 * numpy.diag([epsx, epsy, epsz]),
           1.0 ** 2 * EMpy.constants.eps0 * numpy.eye(3)]

    #  7 nanometers at first
    d = numpy.array([numpy.inf, 100e-9, numpy.inf])

    aniso_layers = EMpy.utils.Multilayer()
    for i in xrange(len(epsilon)):
        eps = EMpy.materials.EpsilonTensor(epsilon[i] * numpy.eye(3))
        mat = EMpy.materials.AnisotropicMaterial('layer_%d' % i, eps)
        layer = EMpy.utils.Layer(mat, d[i])
        aniso_layers.append(layer)
  
    # define the planewave
    ang = 0.+kk
    theta_inc_x = EMpy.utils.deg2rad(0.)
    theta_inc_y = EMpy.utils.deg2rad(ang)

    ## 200 
    lam = (1240./epsreal[jj,0])*1e-9
    wls = numpy.linspace(lam, lam, 1)
    #print(wls)
    #wls = (1240./epsreal[0,jj])*1e-9

    # solve
    tm = EMpy.transfer_matrix.AnisotropicTransferMatrix(
      aniso_layers,
      theta_inc_x,
      theta_inc_y)
    solution_aniso = tm.solve(wls)
    #print("# lambda  R_ss       R_pp         T_ss       T_pp\n")

    for i in range(0,len(wls)):
      print(kk,wls[i],solution_aniso.R[0,0,i],solution_aniso.R[1,1,i],
               solution_aniso.T[0,0,i],solution_aniso.T[1,1,i])


# plot
#pylab.figure()
#pylab.plot(wls, solution_aniso.R[0, 0, :],
#           wls, solution_aniso.R[1, 0, :],
#           wls, solution_aniso.R[0, 1, :],
#           wls, solution_aniso.R[1, 1, :],
#           wls, solution_aniso.T[0, 0, :],
#           wls, solution_aniso.T[1, 0, :],
#           wls, solution_aniso.T[0, 1, :],
#           wls, solution_aniso.T[1, 1, :])
#pylab.legend(('Rss', 'Rps', 'Rsp', 'Rpp', 'Tss', 'Tps', 'Tsp', 'Tpp'))
#pylab.title('Anisotropic Multilayer')
#pylab.xlabel('wavelength /m')
#pylab.ylabel('Power /dB')
#pylab.xlim(wls.min(), wls.max())
#pylab.show()
