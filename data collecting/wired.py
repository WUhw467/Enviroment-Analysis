import requests
import json
import re
import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
import os

os.chdir('/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/NewsAPI Content')

End="https://newsapi.org/v1/articles"

url = ('https://newsapi.org/v2/everything?'
       #'q=university&'
       'q=environment&'
       'from=2021-8-26&'
       #'to=2020-03-07&'
       #'sources=fox-news&'
       
      #'sources=bbc-news&'
      #'sources=google-news&'
       'sources=wired&'
     # 'sources=fox-news&'
      #'sources=business-insider&'

       
       'pageSize=100&'
       'apiKey=63ade43bc24841f8b53d733e8dda4ca4'
       #'qInTitle=Georgetown&'
       #'country=us'

)
print(url)
response2 = requests.get(url)
jsontxt2 = response2.json()
print(jsontxt2, "\n")

filename="wired_2021_08_15.txt"


MyFILE=open(filename,"w")
### Place the column names in - write to the first row
MyFILE.write(str(jsontxt2['articles']))
MyFILE.close()


