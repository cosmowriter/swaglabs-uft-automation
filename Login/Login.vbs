' ------------------------------------------
' Swag Labs - Login Module
' Author: cosmowriter
' Description: Logs into Swag Labs with given username & password.
' ------------------------------------------

'Configuration
Dim swagUser, swagPass
swagUser = DataTable.Value("SwagUser", dtGlobalSheet)    'Add column SwagUser in Global sheet
swagPass = DataTable.Value("SwagPass", dtGlobalSheet)    'Add column SwagPass in Global sheet

Set objBrowserPage = Browser("name:=Swag Labs").Page("title:=Swag Labs")

'Launch browser and navigate to Swag Labs
SystemUtil.Run "chrome.exe", "https://www.saucedemo.com/", , , 3

If objBrowserPage.Exist() Then
    Reporter.ReportEvent micPass, "Launch Browser and navigate to Swag Labs", "Browser was launched and navigated to Swag Labs successfully."
Else
    Reporter.ReportEvent micFail, "Launch Browser and navigate to Swag Labs", "Browser could not be launched."
End If

'Enter credentials
objBrowserPage.WebEdit("html id:=user-name").Set swagUser
objBrowserPage.WebEdit("html id:=pasword").SetSecure swagPass

'Click on login button
objBrowserPage.WebButton("html id:=login-button").Click

If objBrowserPage.Link("html id:=shopping_cart_container").Exist() Then
    Reporter.ReportEvent micPass, "Login", "Login action completed for Swag Labs."
ElseIf objBrowserPage.WebButton("class:=error-button").Exist() Then
    Reporter.ReportEvent micFail, "Login", "Login failed. Check username/Password."
Else
    Reporter.ReportEvent micFail, "Login", "You are lost, login neither passed nor failed."
End If

'Capture screenshot
Desktop.CaptureBitmap "F:\GitHub\SwagLabs\Login\Login.png"
