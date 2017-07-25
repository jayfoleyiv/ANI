import numpy
import EMpy
import pylab
import cmath
# define the multilayer

#epsx=-11626.966047+0.000179j
#epsy=-27434.576809+0.000028j
#epsz=1.941488+0.000663j
epsx = -0.851231 + 0.015889j       
epsy = -6.310462 + 0.001893j
epsz =  1.987802 + 0.044276j 
nx = cmath.sqrt(epsx)
ny = cmath.sqrt(epsy)
nz = cmath.sqrt(epsz)
print(nx, ny, nz)

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
theta_inc_x = EMpy.utils.deg2rad(0.)
theta_inc_y = EMpy.utils.deg2rad(45.)

## 200 
wls = numpy.linspace(700.0e-9, 700.0e-9, 1)

# solve
tm = EMpy.transfer_matrix.AnisotropicTransferMatrix(
    aniso_layers,
    theta_inc_x,
    theta_inc_y)
solution_aniso = tm.solve(wls)
print("# lambda  R_ss       R_pp         T_ss       T_pp\n")
for i in range(0,len(wls)):
  print(wls[i],solution_aniso.R[0,0,i],solution_aniso.R[1,1,i],
               solution_aniso.T[0,0,i],solution_aniso.T[1,1,i])


# plot
pylab.figure()
pylab.plot(wls, solution_aniso.R[0, 0, :],
           wls, solution_aniso.R[1, 0, :],
           wls, solution_aniso.R[0, 1, :],
           wls, solution_aniso.R[1, 1, :],
           wls, solution_aniso.T[0, 0, :],
           wls, solution_aniso.T[1, 0, :],
           wls, solution_aniso.T[0, 1, :],
           wls, solution_aniso.T[1, 1, :])
pylab.legend(('Rss', 'Rps', 'Rsp', 'Rpp', 'Tss', 'Tps', 'Tsp', 'Tpp'))
pylab.title('Anisotropic Multilayer')
pylab.xlabel('wavelength /m')
pylab.ylabel('Power /dB')
pylab.xlim(wls.min(), wls.max())
pylab.show()
