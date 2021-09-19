# import urllib library
from urllib.request import urlopen
from cloudant.client import Cloudant
from cloudant.error import CloudantException
from cloudant.result import Result, ResultByKey
import pprint

serviceUsername = "2ecbaa25-a2ff-4072-8245-9383287059a4-bluemix"
servicePassword = "49c0c343d225623956157d94b25d574586f26d1211e8e589646b4713d5de4801"
serviceURL = "https://2ecbaa25-a2ff-4072-8245-9383287059a4-bluemix.cloudantnosqldb.appdomain.cloud"
client = Cloudant(serviceUsername, servicePassword, url=serviceURL)
client.connect()
# import json
import json

url = "http://api.citybik.es/v2/networks"

# store the response of URL
response = urlopen(url)

# storing the JSON response
# from url in data
data_json = json.loads(response.read())

# pprint.pprint(data_json)

a = data_json["networks"]
print(len(a))

for i in range(len(a)):
    companyid = a[i]['id']

    company_data_json = json.loads(urlopen(url + '/' + companyid).read())

    print("Company number :", i)

    for j in range(len(company_data_json['network']['stations'])):
        print(company_data_json['network']['stations'][j]['empty_slots'], end=" ")
        print(company_data_json['network']['stations'][j]['free_bikes'], end=" ")
    print()

