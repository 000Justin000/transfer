import openbabel
import pybel
import sys
import numpy as np
import math

#------------------------------------------------
jobname = str(sys.argv[1])
#------------------------------------------------
rb1 = [int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), int(sys.argv[5])]     # dihedral idx
rb2 = [int(sys.argv[6]), int(sys.argv[7]), int(sys.argv[8]), int(sys.argv[9])]     # dihedral idx
#------------------------------------------------

pybmol = next(pybel.readfile("pdb", "../qchem_scan_" + jobname + "_B3LYP_d3_6-31G*/theta1_0.000_theta2_0.000.pdb"))

if (jobname == "1001"):
    rotlist = np.array([[  0,360], [ 65,283], [ 85,275], [120,250], [170,218], [199,159.6], [247,102], [300, 87], [318, 78]])
elif (jobname == "1101"):
    rotlist = np.array([[  0,360], [ 40,328.5], [ 60,305], [ 82,244], [172,200], [225,148.5], [252, 90], [300.4, 85], [310, 70]])
elif (jobname == "1111"):
    rotlist = np.array([[  0,360], [ 55,329.7], [ 85,242], [160,195], [200,200], [237,149.7], [257, 92], [303.5, 43]])
elif (jobname == "10n01"):
    rotlist = np.array([[  0,360], [39.1,310], [47,300], [ 85,242], [147,205], [181,180], [205,148], [242, 87], [297, 38.4]])
elif (jobname == "11n01"):
    rotlist = np.array([[  0,360], [ 47,318], [103,253], [112.7,253], [147,212], [181,183], [205,162], [238,130], [292.7, 74]])
elif (jobname == "11n11"):
    rotlist = np.array([[  0,360], [ 41,314.8], [ 84,264], [132.8,223], [183,182], [221,134.8], [262, 87], [312.8, 46]])
        
#------------------------------------------------
rotlist = rotlist / 360.0 * 2*math.pi
#------------------------------------------------

#------------------------------------------------
for i in range(0,len(rotlist)):
    #--------------------------------------------
    rot_diangle1 = rotlist[i,0]
    rot_diangle2 = rotlist[i,1]
    #--------------------------------------------
    angle1 = pybmol.OBMol.GetTorsion(rb1[0],rb1[1],rb1[2],rb1[3])/360*(2*math.pi) + rot_diangle1
    angle2 = pybmol.OBMol.GetTorsion(rb2[0],rb2[1],rb2[2],rb2[3])/360*(2*math.pi) + rot_diangle2
    #--------------------------------------------
    molr = pybmol.clone
    molr.OBMol.SetTorsion(rb1[0],rb1[1],rb1[2],rb1[3], angle1)
    molr.OBMol.SetTorsion(rb2[0],rb2[1],rb2[2],rb2[3], angle2)
    #--------------------------------------------
    molr.write("pdb", jobname + "/" + jobname + "_" + "{:02d}".format(i) + ".pdb", overwrite=True)
    #--------------------------------------------
