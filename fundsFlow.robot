*** Settings ***
Library     AppiumLibrary

*** Variables ***
${Pwd1}                  2
${Pwd2}                  5
${PortfolioTabClick}     Portfolio
${ClickOnFundmenu}       //XCUIElementTypeStaticText[@name="Funds"]
${GetAvailableMargin}    //XCUIElementTypeStaticText[@name="500.00"]
${GetWithdrawalAmount}   //XCUIElementTypeButton[@name="WITHDRAW"]
#${Funds}                 //XCUIElementTypeStaticText[@name="₹ 500.00"][@index='2']
#${EligibleHoldings}      /XCUIElementTypeStaticText[@name="₹ 0.00"][@index='1']
#${TotalMargin}           //XCUIElementTypeStaticText[@name="₹ 500.00"][@index='1']
*** Test Cases ***
fundsFlow
    Open Application    http://localhost:4723/wd/hub    deviceName=iPhone   platformName=iOS    automationName=XCUITest    platformVersion=14.7
    ...                 udid=b16c92a20016d013898ca6b6cf94d76a9b2723e4      app=com.angelbroking.spark     xcodeOrgId=2RCG4EY97K      xcodeSigningId=iPhone Developer

    click element   ${Pwd1}
    click element   ${Pwd2}
    click element   ${Pwd1}
    click element   ${Pwd2}
    wait until element is visible   ${PortfolioTabClick}
    click element   ${PortfolioTabClick}
    click element   ${ClickOnFundmenu}
    wait until element is visible   ${GetAvailableMargin}
    get text        ${GetAvailableMargin}
    get text        ${GetWithdrawalAmount}
    #get text        ${Funds}
    #get text        ${EligibleHoldings}
    #get text        ${TotalMargin}


*** Keywords ***
Provided precondition
    Setup system under test


