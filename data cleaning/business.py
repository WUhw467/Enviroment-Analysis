import re
new_file = open('/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/NewsAPI/business_2021_08_15.txt', 'w')
with open("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/NewsAPI Content/business_2021_08_15.txt",encoding="'utf-8'") as f:
    text = re.sub(r'(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?',"",f.read(),flags=re.MULTILINE)    
    text = re.sub(r"[A-Za-z]+\d+|\d+[A-Za-z]+",'',text)
    text = re.sub(r"\d+",'',text)
    text = '\n'.join([a for a in text.split("\n") if a.strip()])
    new_file.write(text)
                  

new_file.close()

filename = '/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/NewsAPI/business_2021_08_15.txt'
file = open(filename, 'rt')
text = file.read()
file.close()
# split into words by white space
words = text.split()
# remove punctuation from each word
import string
table = str.maketrans('', '', string.punctuation)
stripped = [w.translate(table) for w in words]
print(stripped[:100])

file1 = open("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/NewsAPI/business_2021_08_15.txt","w")#write mode
file1.write(str(stripped))
file1.close()

