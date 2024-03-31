### Import Libraries ###
import requests
import sys

### Set Path ###
sys.path.append('../env_vars')

### Import Secrets ###
from env_vars.secrets import gh_raw_url, block_lists, custom_block, gh_token

### Variables ###
custom_blocks = f'{gh_raw_url}{block_lists}/{custom_block}?token={gh_token}'

### Functions ###
def get_blocklist(url):
    r = requests.get(url)
    return r.text

### Run Script ###
if __name__ == '__main__':
    blocklist = get_blocklist(custom_blocks)
    print(blocklist)
