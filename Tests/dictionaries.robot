*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER} =    chrome
&{URL}    amazon=https://www.amazon.de/-/en/ref=nav_logo    google=https://www.google.com/      #this is key-value structure
#no "=" sign
${WEBPAGE} =    google     ##this is key

*** Test Cases ***
dictionary test
    open browser    ${URL.${WEBPAGE}}    ${BROWSER}
    # I dont use "&" sign here again it transforms "$"
    close browser