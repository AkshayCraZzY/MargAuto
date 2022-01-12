'''
-----------------------------------------------------
Author : Akshay Prafull Parakh
LinkedIn : https://www.linkedin.com/in/akshayparakh98
Github : https://github.com/AkshayCraZzY
Instagram : https://www.instagram.com/akki_parakh
------------------------------------------------------
'''
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException

import pyperclip
import time
import sys
import os
import os.path

options = webdriver.ChromeOptions() 
options.add_argument("user-data-dir=C:\\Users\\Akshay\\AppData\\Local\\Google\\Chrome\\User Data") 
options.add_argument('--log-level=3')
#options.add_argument("--headless") # Runs Chrome in headless mode.
options.add_argument('--no-sandbox') # Bypass OS security model
options.add_argument('--disable-gpu')  # applicable to windows os only
options.add_argument('start-maximized') # 
options.add_argument('disable-infobars')
options.add_argument('--disable-extensions')

link="https://web.whatsapp.com/send?phone=91"
msg="Dear Sir,\nYour account statement has been attached.\nWith Regards,\nFrom AASHIRWAD AGENCIES."


def beforesend():
    f = open("D:\\Akshay\\AHK\\num.txt", "r")
    num=(f.readline()) 
    linkk=link+num
    print(linkk)
    #get_status(w)
    #sys.exit()
    w = webdriver.Chrome(options=options)
    w.get(linkk)
    search_xpath = '//div[@contenteditable="true"][@data-tab="3"]'
    ####//*[@id="app"]/div[1]/span[2]/div[1]/span/div[1]/div/div/div
    #search_xpath = '//*[@id="main"]/footer/div[1]/div/span[2]/div/div[2]/div[1]/div/div[2]'
    search_box = WebDriverWait(w, 2000).until(EC.presence_of_element_located((By.XPATH, search_xpath)))
    print("Srch Found")
    '''
    invalid_xpath = '//*[text()="Phone number shared via url is invalid."]'
    try:
         invalid = WebDriverWait(w, 4000).until(EC.presence_of_element_located((By.XPATH, invalid_xpath)))
         print("Mobile is Invalid")
         time.sleep(4)
         sys.exit()
    except NoSuchElementException:
        print("Mobile is Valid")
        #time.sleep(4)
        #sys.exit()
    '''

    msg_xpath = '//div[@contenteditable="true"][@data-tab="9"]'
    msg_box = WebDriverWait(w, 2000).until(EC.presence_of_element_located((By.XPATH, msg_xpath)))
    print("Msg Found")
    msg_box.click()
    pyperclip.copy(msg)
    msg_box.send_keys(Keys.SHIFT, Keys.INSERT)
    msg_box.send_keys(Keys.ENTER)
    print("Message Sent")
    attach_xpath='//div[@title="Attach"]'
    attach_btn = WebDriverWait(w, 2000).until(EC.presence_of_element_located((By.XPATH, attach_xpath)))
    print("Attach Found")
    attach_btn.click()
    time.sleep(1)
    doc_xpath = '//span[@data-icon="attach-document"]'
    doc_btn = WebDriverWait(w, 2000).until(EC.presence_of_element_located((By.XPATH, doc_xpath)))
    print("Doc Found")
    doc_btn.click()
    filepath = 'D:\Akshay\AHK\sendDoc.ahk'
    os.startfile(filepath)
    print("sendDoc.ahk Started")
    #time.sleep(4)
    #sys.exit()
    send_xpath = '//span[@data-icon="send"]'
    #D:\Akshay\Ledger\PRAFULL_021221.PDF
    send_btn = WebDriverWait(w, 6000).until(EC.presence_of_element_located((By.XPATH, send_xpath)))
    print("Send Found")
    send_btn.click()
    print("Send Clicked")
    dwnld_xpath = '//span[@data-testid="audio-download"]'
    dwnld = WebDriverWait(w, 6000).until(EC.presence_of_element_located((By.XPATH, dwnld_xpath)))
    print("Download Found")
    time.sleep(1)

def mainswitch():
    print("Switch function")
    if os.path.isfile('D:\\Akshay\\AHK\\docattached'):
        os.remove("D:\\Akshay\\AHK\\docattached") 
        beforesend()
    else:
        beforesend()


mainswitch()

#sys.exit()
