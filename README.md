# Automation-Q2
## Installation steps
1) Clone project into your end
2) Execute install.bat file (under installation folder)
3) Execute command to run the script  
   robot --outputdir ..\report -v browser_type:chrome  tests   (run entire test case inside test folder)  
   robot --outputdir ..\report -v browser_type:chrome -i "testShopee"  tests   (tagging -i to selectively run any test case)  
   (available tagging: testLazada, testShopee)
4) Retrieve execution output from folder "testdata"

## Example result:  
Under folder testdata

## Limitation for now:
1) Unable to sort out the result of those 2 website by it price  (Test case number 3,incomplete)

## Acknowledgement
1) Robotframework https://robotframework.org
