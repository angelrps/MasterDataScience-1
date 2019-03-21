# Importing Libraries
from scrapy.item import Field
from scrapy.item import Item
from scrapy.spiders import Spider
from scrapy.selector import Selector
from scrapy.loader import ItemLoader

# First of all: We have to define the Item structure
class Pregunta(Item):
    # Definimos Atributos: Campos de nuestro Item. Pregunta y id (id para las preguntas que vamos a definir)
    pregunta = Field()
    id = Field()
    
# Vamos a implementar el Spider
class StackOverFlowSpider(Spider):
    # Definimos Atributos. Nombre, url semilla
    name = 'MiprimerSpider'
    start_urls = ['https://stackoverflow.com/']
    # Definimos método Parse: con la response de la semilla en formato xml
    def parse(self, response):
        sel = Selector(response)
        preguntas = sel.xpath('//div[@id="question-mini-list"]/div/div') # Es una lista de las preguntas
        
        # Iterar sobre todas las preguntas
        for i, elem in enumerate(preguntas):
            # Por cada pregunta tengo que crear mi item
            item = ItemLoader(Pregunta(),elem)
            item.add_xpath('pregunta','.//h3/a/text()')
            item.add_value('id',i)
            yield item.load_item()
            
            
#####################
## Comando Shell  ###
#####################
# scrapy runspider web_scraping_spider.py -o stackoverflow.csv -t csv
