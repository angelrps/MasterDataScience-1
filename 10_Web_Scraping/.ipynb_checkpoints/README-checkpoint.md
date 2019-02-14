# Web Scraping

![alt](http://www.web-scraping-crawler.com/wp-content/uploads/2017/04/Web-Scraping-Process-Image.png)

View Page Source to watch HTML code

__FACT 1:__ 
- HTML consits on TAGS
- There are __opening__ ___<>___ and __closing__ ___</>___ tags

__FACT 2:__
- HTML __TAGS__ can have __attributes__

__FACT 3:__
- __TAGS__ can be __nested__
- Ex: `Hi <strong><em>Planet</em> Earth</strong>` Hi ___Planet___ __Earth__

## BeautifulSoup Methods

You can apply these two methods to either the initial soup object or a TAG object:

- __find():__ searches for the first matching TAG, and returns a TAG object
- __find_all():__ searches for all matching TAGS, and returns a ResultSet object

You can extract info from a TAG object using these two attributes:

- __text:__ extract the text of a TAG, and returns a string
- __contents:__ extracts the children of a TAG, and returns a list of TAGS and strings

## To Sum Up

```sh
import requests  
r = requests.get('https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html')

from bs4 import BeautifulSoup  
soup = BeautifulSoup(r.text, 'html.parser')  
results = soup.find_all('span', attrs={'class':'short-desc'})

records = []  
for result in results:  
    date = result.find('strong').text[0:-1] + ', 2017'
    lie = result.contents[1][1:-2]
    explanation = result.find('a').text[1:-1]
    url = result.find('a')['href']
    records.append((date, lie, explanation, url))

import pandas as pd  
df = pd.DataFrame(records, columns=['date', 'lie', 'explanation', 'url'])  
df['date'] = pd.to_datetime(df['date'])  
df.to_csv('trump_lies.csv', index=False, encoding='utf-8') 
```

## Reading the webpage into Python
```sh
import requests
r = requests.get('https://www.....')
```
```sh
# Print all the HTML code in this web page
r.text 
```
## Parsing the HTML using Beautiful Soup

```sh
from bs4 import BeautifulSoup
soup = BeautifulSoup(r.text,'html.parser')
```

## Collecting all of the records

___First Lie___

`
<span class="short-desc"><strong>Jan. 21&nbsp;</strong>“I wasn't a fan of Iraq. I didn't want to go into Iraq.” <span class="short-truth"><a href="https://www.buzzfeed.com/andrewkaczynski/in-2002-donald-trump-said-he-supported-invading-iraq-on-the" target="_blank">(He was for an invasion before he was against it.)</a></span></span>&nbsp;&nbsp;
`

___Format___

`<span class="short-desc"><strong>` __DATE__ `</strong>` __LIE__ `<span class="short-truth"><a href="`__URL__`" target="_blank">(`__EXPLANATION__`)</a></span></span>&nbsp;&nbsp;`

___Can you see the pattern?___

Begins with `<span class="short-desc">`

where you can see this format: `< TAG ATTRIBUTES>`

```sh
results = soup.find_all('span', attrs={'class':'short-desc'})
```

```sh
# Print the first 3 Patterns (Lies). Each Lie is an element for the results LIST
results[0:3]
```

```sh
[<span class="short-desc"><strong>Jan. 21 </strong>“I wasn't a fan of Iraq. I didn't want to go into Iraq.” <span class="short-truth"><a href="https://www.buzzfeed.com/andrewkaczynski/in-2002-donald-trump-said-he-supported-invading-iraq-on-the" target="_blank">(He was for an invasion before he was against it.)</a></span></span>,
 <span class="short-desc"><strong>Jan. 21 </strong>“A reporter for Time magazine — and I have been on their cover 14 or 15 times. I think we have the all-time record in the history of Time magazine.” <span class="short-truth"><a href="http://nation.time.com/2013/11/06/10-things-you-didnt-know-about-time/" target="_blank">(Trump was on the cover 11 times and Nixon appeared 55 times.)</a></span></span>,
 <span class="short-desc"><strong>Jan. 23 </strong>“Between 3 million and 5 million illegal votes caused me to lose the popular vote.” <span class="short-truth"><a href="https://www.nytimes.com/2017/01/23/us/politics/donald-trump-congress-democrats.html" target="_blank">(There's no evidence of illegal voting.)</a></span></span>]
 ```
 
## Extracting Data
 
```sh
first_result = results[0]
first_result
```
`
<span class="short-desc"><strong>Jan. 21 </strong>“I wasn't a fan of Iraq. I didn't want to go into Iraq.” <span class="short-truth"><a href="https://www.buzzfeed.com/andrewkaczynski/in-2002-donald-trump-said-he-supported-invading-iraq-on-the" target="_blank">(He was for an invasion before he was against it.)</a></span></span>
`

```sh
first_result.find('strong')
```

`<strong>Jan. 21 </strong>`

```sh
# \xa0 represents the nbsp character. IT'S A SINGLE CHARACTER!!!
first_result.find('strong').text
```

`
'Jan. 21\xa0'
`
```sh
first_result.find('strong').text[0:-1]
```
`'Jan. 21'`

## Extracting the LIE

```sh
first_result
```

`<span class="short-desc"><strong>Jan. 21 </strong>“I wasn't a fan of Iraq. I didn't want to go into Iraq.” <span class="short-truth"><a href="https://www.buzzfeed.com/andrewkaczynski/in-2002-donald-trump-said-he-supported-invading-iraq-on-the" target="_blank">(He was for an invasion before he was against it.)</a></span></span>`

```sh
first_result.contents
```
```sh
[<strong>Jan. 21 </strong>,
 "“I wasn't a fan of Iraq. I didn't want to go into Iraq.” ",
 <span class="short-truth"><a href="https://www.buzzfeed.com/andrewkaczynski/in-2002-donald-trump-said-he-supported-invading-iraq-on-the" target="_blank">(He was for an invasion before he was against it.)</a></span>]
 ```
```sh
first_result.contents[1]
```

`"“I wasn't a fan of Iraq. I didn't want to go into Iraq.” "`
```sh
first_result.contents[1][1:-2]
```

`"I wasn't a fan of Iraq. I didn't want to go into Iraq."`

## Extracting the EXPLANATION

```sh
# First Way To Do This
first_result.contents[2]
```

`<span class="short-truth"><a href="https://www.buzzfeed.com/andrewkaczynski/in-2002-donald-trump-said-he-supported-invading-iraq-on-the" target="_blank">(He was for an invasion before he was against it.)</a></span>`
```sh
# Second Way To Do This
first_result.find('a')
```

`<a href="https://www.buzzfeed.com/andrewkaczynski/in-2002-donald-trump-said-he-supported-invading-iraq-on-the" target="_blank">(He was for an invasion before he was against it.)</a>`
```sh
first_result.find('a').text
```

`'(He was for an invasion before he was against it.)'`
```sh
first_result.find('a').text[1:-1]
```

`'He was for an invasion before he was against it.'`

## Extracting the URL

URL is located within the TAG
```sh
first_result.find('a')['href']
```

`'https://www.buzzfeed.com/andrewkaczynski/in-2002-donald-trump-said-he-supported-invading-iraq-on-the'`

## Building a Dataset

```sh
records = []
for result in results:
    date = result.find('strong').text[0:-1] + ', 2017'
    lie = result.contents[1][1:-2]
    explanation = result.find('a').text[1:-1]
    url = result.find('a')['href']
    records.append((date,lie,explanation,url))
```
```sh
records[0:3]
```
```sh
[('Jan. 21, 2017',
  "I wasn't a fan of Iraq. I didn't want to go into Iraq.",
  'He was for an invasion before he was against it.',
  'https://www.buzzfeed.com/andrewkaczynski/in-2002-donald-trump-said-he-supported-invading-iraq-on-the'),
 ('Jan. 21, 2017',
  'A reporter for Time magazine — and I have been on their cover 14 or 15 times. I think we have the all-time record in the history of Time magazine.',
  'Trump was on the cover 11 times and Nixon appeared 55 times.',
  'http://nation.time.com/2013/11/06/10-things-you-didnt-know-about-time/'),
 ('Jan. 23, 2017',
  'Between 3 million and 5 million illegal votes caused me to lose the popular vote.',
  "There's no evidence of illegal voting.",
  'https://www.nytimes.com/2017/01/23/us/politics/donald-trump-congress-democrats.html')]
  ```