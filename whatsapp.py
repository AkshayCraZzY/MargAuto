'''
-----------------------------------------------------
Author : Akshay Prafull Parakh
LinkedIn : https://www.linkedin.com/in/akshayparakh98
Github : https://github.com/AkshayCraZzY
Instagram : https://www.instagram.com/akki_parakh
------------------------------------------------------
'''
import time
import sys
import os
import os.path
import mmap
import warnings
from selenium import webdriver
from datetime import datetime
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import urllib.parse
os.environ['WDM_LOG_LEVEL'] = '0'
warnings.filterwarnings("ignore", category=DeprecationWarning)

options = webdriver.ChromeOptions() 
options.add_argument("user-data-dir="+os.path.join(sys.path[0])+"/Chrome_Data/User Data") 
#options.add_argument("window-size=1080x720")
options.add_argument('log-level=3')
options.add_argument('disable-gpu')
options.add_argument('disable-infobars')
options.add_argument('disable-extensions')
options.add_argument('disable-dev-shm-usage')
#options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36")
options.add_experimental_option('excludeSwitches', ['enable-logging'])

link1="https://web.whatsapp.com/send?phone=91"
link2="&text=_Dear Sir ,_%0A_Your account statement has been attached._%0A_From_ *Aashirwad Agencies*"
doc=[]

def beforesend():
    f = open("D:\\Akshay\\AHK\\num.txt", "r")
    num=(f.readline()) 
    #num=##########
    linkk=link1+str(num)+link2
    print(linkk)
    #get_status(w)
    #sys.exit()
    w = webdriver.Chrome(options=options,service=Service(ChromeDriverManager().install()))
    w.get(linkk)
    
    try:
        w.find_element_by_class_name("_2UwZ_")#.click()
    except NoSuchElementException:
        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
    else:
           # cmd = 'color 0c'  
           # os.system(cmd) 
        print(" - - -RE-LOGIN NEEDED, Scan QR code and restart script - - -")
           # cmd = 'color 0a'  
           # os.system(cmd) 
        #print(" - - - - - - - - - -WhatsApp Web loaded - - - - - - - - - - ")

    search_xpath = '//div[@contenteditable="true"][@data-tab="3"]'
        
    try:
            
            WebDriverWait(w, 120).until(EC.presence_of_element_located((By.XPATH, search_xpath)))
    except TimeoutException:
            print("WhatsApp could'nt load in 2 minutes")
            print(tosend)
    time.sleep(2)
    try:
            #element = w.find_element_by_class_name("_2Nr6U").text
        #print('here')
        w.find_element_by_class_name("IVxyB")
        w.find_element_by_class_name("_2Nr6U")
            #msg_box = WebDriverWait(w, 100).until(EC.presence_of_element_located((By.XPATH, msg_xpath)))
    except NoSuchElementException:
        msg_xpath = '//div[@contenteditable="true"][@data-tab="10"]'
        WebDriverWait(w, 30).until(EC.presence_of_element_located((By.XPATH, msg_xpath))).send_keys(Keys.ENTER)
           # msg_box.click()
           # pyperclip.copy(msg)
           # msg_box.send_keys(Keys.SHIFT, Keys.INSERT)
           # msg_box.send_keys(Keys.ENTER)
           # sent = sent + 1
          #  w.get_screenshot_as_file(os.path.join(sys.path[0])+"\\ss\\"+tosend+"_msg.png")
            #print('\n - - - - - ['+str(sent)+'] - - - - Message sent to '+tosend+' - - - - - ')
       # print('\n - - - - - - - - - Message sent to '+tosend+' - - - - - ['+str(sent)+']')
        #time.sleep(5000)
        f = open("D:\\Akshay\\AHK\\path.txt", "r")
        path=(f.readline()) 
        tosend_doc=path
        attach_xpath='//div[@title="Attach"]'
        WebDriverWait(w, 10).until(EC.presence_of_element_located((By.XPATH, attach_xpath))).click()
        time.sleep(1)
        doc_xpath = '//span[@data-icon="attach-document"]'
        send_xpath = '//span[@data-icon="send"]'
        WebDriverWait(w, 10).until(EC.presence_of_element_located((By.XPATH, doc_xpath)))    
        w.find_element_by_tag_name('input').send_keys(tosend_doc)
        WebDriverWait(w, 10).until(EC.presence_of_element_located((By.XPATH, send_xpath))).click()
        time.sleep(1)
       # upload_xpath = '//*[@id="main"]/div[3]/div/div[2]/div[3]/div[14]/div/div[2]/div/button/div[2]/div/div[3]/div/div/svg/circle'
        #upload_xpath = '//*[@id="main"]/div[3]/div/div[2]/div[2]/div[6]/div/div[2]/div/button/div/div/div[3]/div/div/svg/circle'
        #upload_xpath = '//div[contains(@class, "g0rxnol2 p357zi0d kk3akd72 gndfcl4n ac2vgrno tddarlmj jbxl65f1 mnd5airb")]'
        #upath= 'aria-label=" Pending "'
        #u_xpath  = 'g0rxnol2 p357zi0d kk3akd72 gndfcl4n ac2vgrno tddarlmj jbxl65f1 mnd5airb'
        while True:
            try:
                WebDriverWait(w, 1).until(EC.presence_of_element_located((By.XPATH, '//span[@aria-label=" Pending "]')))
            except TimeoutException:
                break
            else:
                print('Waiting to finish upload..',end="\r")
                continue
        print("\n")
        print('File Sent!')

    try:
        WebDriverWait(w, 1).until(EC.alert_is_present())
        alert = w.switch_to.alert
        alert.accept()
        print("alert accepted")
    except TimeoutException:
        #print("no alert")
        pass

    #w.execute_script("window.close();")
    w.quit()
    return



beforesend()

#sys.exit()
