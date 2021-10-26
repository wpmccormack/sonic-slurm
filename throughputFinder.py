import sys
filename = sys.argv[1]
writefile = sys.argv[2]

file1 = open(filename, 'r')
Lines = file1.readlines()

checks = 0
for line in Lines:
    if "Event Throughput" in line:
        splitTPLine = str.split(line)
        #print(splitTPLine[2])
        theTP = splitTPLine[2]

file1.close()

file2 = open(writefile, 'a')
file2.write(theTP+'\n')
file2.close()
