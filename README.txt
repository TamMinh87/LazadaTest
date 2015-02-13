1. Pre-requisites
  - Ruby latest version
  - Ruby DevKit
  - selenium-webdriver gem
  - IDE: RubyMine
  - chromedriver.exe: http://chromedriver.storage.googleapis.com/index.html
  - IEDriverServer.exe: http://www.seleniumhq.org/download/ 

2. Assumptions
  - Based on job detail, I assume that we already use Cucumber and continuous integration server
  - This demo only use selenium-webdriver gem -- 
  
3. Known issues
  - Lazada web runs too slow (include too many tracking APIs), so please debug if you get TimeOut error
  - For the requirement #3.3 "From cart popup, change quantity of any product" --> because the product random adding to cart, sometime it does not have option to change quantity to change
  - Duplicate code to open and close browser at each script --> resolve if using Cucumber
  - Test_Data/Config_Options still include in Ruby file - I don't have time to do :)
  - To run test on Chrome and IE
    - Download the one for your target platform from the link mentioned above
    - Unzip it and put them (chromedriver.exe, IEDriverServer.exe) in your PATH
  
4. Not include functions
  - Create test suite and order test scripts
  - Report: build a report when complete running test suite
  - Send mail result
  - Log info
  - Capture failure screenshot: capture screenshot when test fails, up to host, attach a link to report
--> except the last one, other issues could resolve by using Cucumber and CI server


