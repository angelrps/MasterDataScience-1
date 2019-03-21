# Importing Libraries
from scrapy.item import Field
from scrapy.item import Item
from scrapy.spiders import CrawlSpider, Rule
from scrapy.loader import ItemLoader
from scrapy.linkextractors import LinkExtractor
from scrapy.loader.processors import MapCompose

# Definimos Items
class AirbnbItem(Item):
    # Definimos Atributos
    tipo = Field()
    capacidad = Field()
    
class AirbnbCrawler(CrawlSpider):
    name = 'MiprimerCrawler'
    start_urls = 'https://www.airbnb.com/s/Londres--Reino-Unido/homes?refinement_paths%5B%5D=%2Fhomes&query=Londres%2C%20Reino%20Unido&allow_override%5B%5D=&map_toggle=true&s_tag=I4p1k64_'
    allowed_domains = ['airbnb.com'] # para evitar que spider salga de este dominio
    
    # Atributo Rules para hacer scraping vertical y horizontal
    rules = (
        Rule(LinkExtractor(allow=r'&section_offset=8&items_offset=')),
        Rule(LinkExtractor(allow=r'/rooms'), callback= 'parse_items')
    )
    
    def parse_items(self,response):
        item = ItemLoader(AirbnbItem(),response)
        item.add_xpath('tipo', '/html/body/div[3]/div/main/div/section/div/div[2]/div/div[2]/div[1]/div/div/div[3]/div/div/div[1]/div[2]/div[1]/text()')
        item.add_xpath('capacidad','/html/body/div[3]/div/main/div/section/div/div[2]/div/div[2]/div[1]/div/div/div[3]/div/div/div[1]/div[2]/div[2]/div[1]/text()', MapCompose(lambda i: i[0:2]))
        yield item.load_item()