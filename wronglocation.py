
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 23 10:59:09 2018

@author: nallen
"""

# -*- coding: utf-8 -*-
#!/usr/bin/python2.7
#
# Prints a list of all items with wrong location codes
# Email Excel Spreadhseet to manager and supervisor 
# Use XlsxWriter to create spreadsheet from SQL Query
# 
#

import psycopg2
import xlsxwriter
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email.utils import formatdate
from email import encoders
from datetime import datetime



excelfile =  'Wronglocation.xlsx' #The name of the excel file you want to create



#Set variables for email
emailhost = 'xxx.xxx.x.xx' #Update for your email host
emailport = '25' #Update for your port
emailsubject = 'Item records with the wrong location'
emailmessage = '''Attached is a list of records with wrong locations. Please find and fix all records.'''
emailfrom = 'nallen@greenwichlibrary.org' #this is your email. It means staff can hit reply and contact you with questions.
emailto = ['nallen@greenwichlibrary.org', 'kfuscaldo@greenwichlibrary.org', 'jgaither@greenwichlibrary.org'] #this is the list of people you want the email to go to.

try:
    conn = psycopg2.connect("dbname=iii user=sqlaccess host=sierra-db port=1032 password=PASSWORD sslmode=require") #update this information for your specific location
except psycopg2.Error as e:
    print ("Unable to connect to database: " + str(e))
    
cursor = conn.cursor()
cursor.execute(open("Wronglocation.sql","r",).read()) #this is the file name of the SQL you built
rows = cursor.fetchall()
conn.close()


workbook = xlsxwriter.Workbook(excelfile, {'remove_timezone': True})
worksheet = workbook.add_worksheet()


worksheet.set_landscape()
worksheet.hide_gridlines(0)


eformat= workbook.add_format({'text_wrap': True, 'valign': 'top' , 'num_format': 'mm/dd/yy'}) #basic information that controls the display of your spreadsheet -ex. how dates are formated and whether anything is bolded-
eformatlabel= workbook.add_format({'text_wrap': False, 'valign': 'top', 'bold': True})
# sets the width of your columns (notice that in Python spreadsheets start with row and column 0


worksheet.set_column(0,0,20.89)
worksheet.set_column(1,1,15.22)
worksheet.set_column(2,2,10.89)
worksheet.set_column(3,3,10.11)
worksheet.set_column(4,4,10.11)
worksheet.set_column(5,5,10.44)
worksheet.set_column(6,6,10.11)
worksheet.set_column(7,7,30.11)


worksheet.set_header('Wronglocation')
#Names your columns
worksheet.write(0,0,'Call #', eformatlabel)
worksheet.write(0,1,'Barcode', eformatlabel)
worksheet.write(0,2,'Bib Record No.', eformatlabel)
worksheet.write(0,3,'Status', eformatlabel)
worksheet.write(0,4,'i-type', eformatlabel)
worksheet.write(0,5,'Mat Type', eformatlabel)
worksheet.write(0,6,'Location', eformatlabel)
worksheet.write(0,7,'Title', eformatlabel)


for rownum, row in enumerate(rows):
    worksheet.write(rownum+1,0,row[0])
    worksheet.write(rownum+1,1,row[1])
    worksheet.write(rownum+1,2,row[2])
    worksheet.write(rownum+1,3,row[3])
    worksheet.write(rownum+1,4,row[4])
    worksheet.write(rownum+1,5,row[5])
    worksheet.write(rownum+1,6,row[6])
    worksheet.write(rownum+1,7,row[7])

    
    

workbook.close()


#Creating the email message
msg = MIMEMultipart()
msg['From'] = emailfrom
if type(emailto) is list:
    msg['To'] = ','.join(emailto)
else:
    msg['To'] = emailto
msg['Date'] = formatdate(localtime = True)
msg['Subject'] = emailsubject
msg.attach (MIMEText(emailmessage))
part = MIMEBase('application', "octet-stream")
part.set_payload(open(excelfile,"rb").read())
encoders.encode_base64(part)
part.add_header('Content-Disposition','attachment; filename=%s' % excelfile)
msg.attach(part)

#Sending the email message
smtp = smtplib.SMTP(emailhost, emailport)
smtp.sendmail(emailfrom, emailto, msg.as_string())
smtp.quit()








