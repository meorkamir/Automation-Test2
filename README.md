# Automation-Test2
Installation steps
1) Clone project into your end
2) Execute install.bat file (under installation folder)
3) Execute command to run the script
   robot --outputdir ..\report -v browser_type:chrome  tests   (run entire test case inside test folder)
   robot --outputdir ..\report -v browser_type:chrome -i "testShopee"  tests   (tagging -i to selectively run any test case)
4) Retrieve execution output from folder "result"

Acknowledgement
1) Robotframework https://robotframework.org
