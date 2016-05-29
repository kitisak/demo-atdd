*** Settings ***
Library    Selenium2Library
Suite Setup    Open convert grade
Suite Teardown    Close browser
Test Template    Flow of Convert Score to Grade A
Test Teardown    Back to convert grade
Default Tags    requirment_01

*** Variables ***
${URL}    http://150.107.29.56:8080/grade/

*** Testcases ***
Case 001      100
Case 002      80
Case 003      81

*** Keywords ***
Flow of Convert Score to Grade A
  [Arguments]   ${score}
  Input Score   ${score}
  Press button Convert to Grade
  User should see You Got Grade A

Back to convert grade
  Go To    ${URL}

Open convert grade
  Open Browser    ${URL}

Input Score
  [Arguments]    ${score}
  #Open Browser    http://150.107.29.56:8080/grade/
  Input Text    score    ${score}

User should see You Got Grade A
  Wait Until Page Contains    You Got Grade A

Press button Convert to Grade
  Click Button    convertToGrade
