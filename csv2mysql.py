#!/usr/bin/python
from MySQLdb import *
import csv
import sys

try:
    conn=connect(host="localhost",user="john",passwd="",db="john")
except:
    print 'mysql connect error'
cursor=conn.cursor()
try:
    reader = csv.reader(file(sys.argv[2], 'rb'))
except:
    print 'read csv error'
for line in reader:
#    print line
    sql="insert into "+sys.argv[1]+" values(%s,%s,%s,%s,%s,%s)"
    param=(line[0],line[1],line[2],line[3],line[4],line[5])
    try:
        cursor.execute(sql,param)
    except:
        print 'sql execute error'
#print cds[4][1]
cursor.close()
conn.close()
