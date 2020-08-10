import os
from re import sub
from decimal import Decimal
import glob

class FileHandling:
    file_path = os.getcwd() + '/dataset/'

    def write_file(self, file_name, content):
        file = open(self.file_path + file_name + ".txt", "w", encoding="UTF-8")

        for item in content:
            file.write(item + "\n")
        file.close()

    def convert_currency_to_number(self, money):
        value = Decimal(sub(r'[^\d.]', '', money))
        return value

    def process_raw_result(self):
        path = self.file_path + '/*.txt'
        files = glob.glob(path)

        output = []
        for name in files:
            try:
                with open(name) as f:
                    result = f.read()
            except IOError as exc:
                print(exc)

            output.append(result)

        # here need to process the raw data
        self.sort_by_price(output)
        self.write_file('result', output)

    def sort_by_price(self, content):
        for i,item in enumerate(content):
            print(i, "-", item)

        #incomplete