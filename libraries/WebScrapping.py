from bs4 import BeautifulSoup
import requests
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver

class WebScrapping:


    def web_scrap(self, page_source):
        soup = BeautifulSoup(page_source, 'html.parser')
        all_prd = soup.find_all('div', class_='c2KZ0Q')
        print(all_prd)
        for prd in all_prd:
            BuiltIn.log_to_console('A')
            prd_name = prd.find('div', class_='c1ZOjf')
            prd_price = prd.find('span', class_='c13VH6')
            # prd_link = prd.find('div', class_='location')
            print(prd_name)
            print(prd_price)
            # print(prd_link)

    def web_scrapping(self, element):
        print("AAA")