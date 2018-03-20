# Uncertainty_analysis_example-Marmousi-

1. Run RSVD_SRVM.m to get the SVD of inverse Hessian
2. Run sampling_Hess to extract elements from Hessian or inverse Hessian

1. Run T_distribute.m to get the square-root of inverse Hessian, in which 1000 2d random samplers are generated.
2. DisTopV.m: posterior distribution
3. DisTopV0.m: prior distribution
4. Hist_curve.m: visualized depth Histogram profiles
5. plotsub.m, plotsub0.m: visualized marginal distributions
6. null_spac.m: null space analysis

Others: supporting subfunctions

The SRVM scalars a_* and nu_*, and vectors w_* can be collected from the ./scratch/optimize folder under the numerical example.

Actually, only one scalar $ nu/a $ is enough, which will occur in the official version soon.

The initModel folder contains the init models, used for prior samplings.

The invertedModel folder contains the inverted models, used for posterior sampling.
