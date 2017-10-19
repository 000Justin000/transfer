import openbabel
import pybel
import sys
import numpy
import math

#------------------------------------------------
jobname = str(sys.argv[1])
#------------------------------------------------
rb1 = [int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), int(sys.argv[5])]     # dihedral idx
rb2 = [int(sys.argv[6]), int(sys.argv[7]), int(sys.argv[8]), int(sys.argv[9])]     # dihedral idx
#------------------------------------------------

pybmol = next(pybel.readfile("pdb", "../qchem_scan_" + jobname + "_B3LYP_d3_6-31G*/theta1_0.000_theta2_0.000.pdb"))


if (jobname == "1001"):
    rotlist = numpy.array([[  0,360], [ 35,310], [ 95,275], [135,240], [180,213], [199,150], [247,102], [318, 78]])
elif (jobname == "1101"):
    rotlist = numpy.array([[  0,360], [ 65,310], [ 78,250], [178,195], [225,148], [252, 90], [310, 70], 
                           [358,190], [ 45,135], [100, 90], [120, 65], [182,  3], [240,315], [295,240]])
elif (jobname == "1111"):
    rotlist = numpy.array([[  0,360], [ 62,325], [ 85,255], [130,200], [185,195], [230,160], [257, 92], [298, 40]])
elif (jobname == "10n01"):
    rotlist = numpy.array([[  0,360], [ 44,302], [ 90,245], [150,198], [176,180], [198,153], [248, 87], [302, 43]])
elif (jobname == "11n01"):
    rotlist = numpy.array([[  0,360], [108,253], [230,130], [293, 72], [  0,190], [118, 72], [212,335], [288,255]])
elif (jobname == "11n11"):
    rotlist = numpy.array([[  0,360], [ 40,313], [ 75,268], [133,226], [187,185], [223,136], [265, 77], [310, 46]])
        
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
