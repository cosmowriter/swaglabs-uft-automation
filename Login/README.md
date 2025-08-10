# Swag Labs - Login Module

## Description
This UFT VBScript logs into the [Swag Labs](https://www.saucedemo.com/) demo site using credentials stored in the UFT Data Table.

## Prerequisites
- UFT installed with Web Add-in enabled
- Google Chrome with UFT extension installed
- `SwagUser` and `SwagPass` columns in the **Global DataTable**

## Steps to Run
1. Open this script in UFT.
2. Add your Swag Labs username & password in the **Global DataTable**.
3. Run the script with Chrome browser.
4. Script will open Swag Labs, enter credentials, and log in.

## Notes
- Uses Descriptive Programming (no Object Repository).
- Can be reused as part of a larger test flow.
