function [self] = Santa23UnequalSampleSizes()
self.design = 'Two-way repeated-measures ANOVA (with interaction) (one within-subject factor), unequal number of subjects';

self.Y      = [1.000000000000000000e+00 3.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 5.000000000000000000e+00 3.000000000000000000e+00 4.000000000000000000e+00 6.000000000000000000e+00 6.000000000000000000e+00 5.000000000000000000e+00 7.000000000000000000e+00 4.000000000000000000e+00 5.000000000000000000e+00 9.000000000000000000e+00 1.000000000000000000e+00 6.000000000000000000e+00 9.000000000000000000e+00 3.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+01 2.000000000000000000e+00 4.000000000000000000e+00 8.000000000000000000e+00 1.000000000000000000e+00 5.000000000000000000e+00 7.000000000000000000e+00 3.000000000000000000e+00 4.000000000000000000e+00 9.000000000000000000e+00 2.000000000000000000e+00 2.000000000000000000e+00 1.000000000000000000e+01 4.000000000000000000e+00 5.000000000000000000e+00 1.000000000000000000e+01 2.000000000000000000e+00 3.000000000000000000e+00 4.000000000000000000e+00 5.000000000000000000e+00 8.000000000000000000e+00 4.000000000000000000e+00 5.000000000000000000e+00 1.000000000000000000e+01 9.000000000000000000e+00 9.000000000000000000e+00 3.000000000000000000e+00 5.000000000000000000e+00 6.000000000000000000e+00 4.000000000000000000e+00 5.000000000000000000e+00 8.000000000000000000e+00 7.000000000000000000e+00 7.000000000000000000e+00 7.000000000000000000e+00]';
self.A      = [0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00]';
self.B      = [0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00]';
self.SUBJ   = [0.000000000000000000e+00 0.000000000000000000e+00 0.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 1.000000000000000000e+00 2.000000000000000000e+00 2.000000000000000000e+00 2.000000000000000000e+00 3.000000000000000000e+00 3.000000000000000000e+00 3.000000000000000000e+00 4.000000000000000000e+00 4.000000000000000000e+00 4.000000000000000000e+00 5.000000000000000000e+00 5.000000000000000000e+00 5.000000000000000000e+00 1.000000000000000000e+01 1.000000000000000000e+01 1.000000000000000000e+01 1.100000000000000000e+01 1.100000000000000000e+01 1.100000000000000000e+01 1.200000000000000000e+01 1.200000000000000000e+01 1.200000000000000000e+01 1.300000000000000000e+01 1.300000000000000000e+01 1.300000000000000000e+01 1.400000000000000000e+01 1.400000000000000000e+01 1.400000000000000000e+01 1.500000000000000000e+01 1.500000000000000000e+01 1.500000000000000000e+01 1.600000000000000000e+01 1.600000000000000000e+01 1.600000000000000000e+01 1.700000000000000000e+01 1.700000000000000000e+01 1.700000000000000000e+01 1.800000000000000000e+01 1.800000000000000000e+01 1.800000000000000000e+01 1.900000000000000000e+01 1.900000000000000000e+01 1.900000000000000000e+01 2.000000000000000000e+01 2.000000000000000000e+01 2.000000000000000000e+01 2.100000000000000000e+01 2.100000000000000000e+01 2.100000000000000000e+01]';

self.z      = [1.955, 9.763, 0.116];
self.df     = {[1,16], [2,32], [2, 32]};
self.p      = [0.181, 0.00049, 0.89069];
end
