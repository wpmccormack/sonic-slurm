import sys
filename = sys.argv[1]
writefile = sys.argv[2]

file1 = open(filename, 'r')
Lines = file1.readlines()

checks = 0
#for line in Lines:
#    if "Event Throughput" in line:
#        splitTPLine = str.split(line)
#        #print(splitTPLine[2])
#        theTP = splitTPLine[2]

for line in Lines:
    if "Begin processing the 100th record" in line:
        splitStLine = str.split(line)
        stTime = splitStLine[-2]
    if "Begin processing the 1000th record" in line:
        splitEndLine = str.split(line)
        endTime = splitEndLine[-2]

def timediff(str1, str2):
    splot = str.split(str1, ":")
    splot2 = str.split(str2, ":")
    if((float(splot[0]) - float(splot2[0])) >= 0.):
        hrdiff = (float(splot[0]) - float(splot2[0]))*3600.
    else:
        hrdiff = (24 + float(splot[0]) - float(splot2[0]))*3600.
    mindiff = (float(splot[1]) - float(splot2[1]))*60.
    secdiff = (float(splot[2]) - float(splot2[2]))
    theDiff = hrdiff+mindiff+secdiff
    return 900.0/theDiff

file1.close()

theTP = str(timediff(endTime, stTime))

file2 = open(writefile, 'a')
file2.write(theTP+'\n')
file2.close()
