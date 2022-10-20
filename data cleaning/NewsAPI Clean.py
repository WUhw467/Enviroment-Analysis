from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfVectorizer
from nltk.stem import PorterStemmer
import numpy as np
import pandas as pd
import os
import re

import warnings
warnings.filterwarnings('ignore')


os.chdir('/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/NewsAPI')

## Read the corpus files into a Document Term Matrix Object (or DTM)

path="/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/NewsAPI"

## Make a blank list
MyFileNameList=[]
## Also - let's same the names of the files (not the paths)
## in another list. 
FileNames=[]

for nextfile in os.listdir(path):
    fullpath=path+"/"+nextfile
    #print(fullpath)
    MyFileNameList.append(fullpath)
    ## let's place the files names (not the path too)
    ## into our other list
    FileNames.append(nextfile)



## print the list....

print(MyFileNameList)
print("\\\\\\\\\\\\\\\/n")
print(FileNames)

 
MyCV=CountVectorizer(input='filename',
                        stop_words='english',
                        #max_features=100
                        )

My_DTM=MyCV.fit_transform(MyFileNameList)

## TWO Steps:
    ## First - use your CountVectorizer to get all the column names
MyColumnNames=MyCV.get_feature_names()

## NEXT - Use pandas to create data frames
My_DF=pd.DataFrame(My_DTM.toarray(),columns=MyColumnNames)

## Now - let's add the labels. 

CleanNames=[]

for filename in FileNames:
    newName=filename.split(".")
    #print(newName[0])
    ## remove any numbers
    newName2=re.sub(r"[^A-Za-z\-]", "", newName[0])
    print(newName2)
    CleanNames.append(newName2)
    


## Let's see if we did it...
print(CleanNames)

## OK!

## Now - let's add these labels as a column to our DF

## RIght now we have 
print(My_DF)

## Add the column

My_DF["LABEL"]=CleanNames

## Have a look
print(My_DF)

## Write to csv file
My_DF.to_csv('MyCleanNewsAPI.csv', index=False)
