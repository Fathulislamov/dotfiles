#!/bin/bash
#with open ("copynewPackages.txt") as "copypackages.txt":
#    data2 = f1.readlines()
#    s2 = set(data1)
#s1 = []
#with open("text1.txt") as file1:
#    for line in file2:
#        if line not in s2:
#            s1.append(line)
#print(s1)
with open("copynewPackages.txt") as file2:
    data2 = f1.readlines()
    s2 = set(data1)
s1 = []
with open("copypackages.txt") as file1:
    for line in file2:
        if line not in s2:
            s1.append(line)
print(s1)
