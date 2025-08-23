'***************************************************
' Swag Labs - Logout Module
' Author: cosmowriter
' Description: Logs out from the Swag Labs site
'***************************************************

Set objBrowserPage = Browser("name:=Swag Labs").Page("title:=Swag Labs")

'Menu button description
Set oMenu = Description.Create
oMenu("micclass").Value = "WebButton"
oMenu("html tag").Value = "button"
oMenu("class").Value = "bm-burger-button"   'class used by Swag Labs for menu button

'Logout link description
Set oLogout = Description.Create
oLogout("micclass").Value = "Link"
oLogout("html tag").Value = "a"
oLogout("innertext").Value = "Logout"

'Steps for Logout
objBrowserPage.WebButton("html tag:=button", "class:=bm-burger-button").Click
Wait(1)

objBrowserPage.Link("html tag:=a", "innertext:=Logout").Click
Wait(2)

Reporter.ReportEvent micPass, "Logout", "Successfully logged out from Swag Labs"

'Capture screenshot
Desktop.CaptureBitmap "F:\GitHub\SwagLabs\Login\Login.png"

'Close Browser
Browser("name:=Swag Labs").Close
