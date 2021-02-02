*** Settings ***
Resource    ../../../Common/TodasLasLibrerias.robot
Resource    ../../../PO/WebResponsive/1-PaginaPrincipal.robot
Resource    ../../../PO/WebResponsive/2-PaginaTarifas.robot
Resource    ../../../PO/WebResponsive/3-PaginaSSR.robot
Resource    ../../../Common/VariablesWebResponsive/Variables.robot
Library     AppiumLibrary



*** Keywords ***
abrir pagina
      [Arguments]      ${AMBIENTE}     ${NOMBRECEL}
      ${Options}    Create Dictionary    androidPackage    com.android.chrome
      ${caps}    Create Dictionary    chromeOptions    ${Options}
      Set to Dictionary    ${caps}    platformName    Android
      Set to Dictionary    ${caps}    platformVersion    ${CELULARES.${NOMBRECEL}.version}
      Set To Dictionary    ${caps}    deviceName      ${CELULARES.${NOMBRECEL}.nombre}
      Set To Dictionary    ${caps}    browserName     Chrome
      Set To Dictionary    ${caps}    AUTO_WEBVIEW    true
      Set To Dictionary    ${caps}    chromedriverExecutableDir    ${CURDIR}
      Set To Dictionary    ${caps}    newCommandTimeout    999999

      Set Library Search Order     SeleniumLibrary

      Asigna PO pagina principal     EN


      Create Webdriver    Remote    command_executor=${APPIUM_SERVER1}     desired_capabilities=${caps}
      go to         ${URL.${AMBIENTE}}


Tipo vuelo
    [Arguments]      ${TVUELO}
    Wait Until Page Contains Element     xpath=//div[@class='circle']
    Set Test Variable    ${TVUELO}
    Run Keyword If  ('${TVUELO}' == 'OW')    One_Way

One_Way
    Click Element     ${RbnOW}
    capture page screenshot

Ingresar_ruta
   [Arguments]       ${IDA}    ${VUELTA}
   Click Element      ${LblIda}
   Wait Until Page Contains Element    ${InpIda}
   Click Element     ${InpIda}
   input text        ${InpcIda}      ${IDA}
   Click Element     ${LblDIda}
   Wait Until Page Contains Element    ${InpVuelta}
   Click Element     ${InpVuelta}
   input text        ${InpvVuelta}      ${VUELTA}
   Click Element     ${LblDVuelta}

Ingresar Moneda
   [Arguments]       ${MONEDA}
   Click element     ${InpMoneda}
   ${TipoMoneda} =	 Replace String	  ${TipoMoneda}	   XXX	  ${MONEDA}
   Click element     ${TipoMoneda}

Ingresar pasajeros
   [Arguments]      ${NUMADULTOS}    ${NUMNINOS}    ${NUMINFANTES}
   Click element     ${InpPasajeros}
   ${NUMADULTOS}=      Evaluate    ${NUMADULTOS}-1
   ${TIENEINFANTES}=   Evaluate    ${NUMINFANTES} > 0

    Run Keyword If  ('${TIENEINFANTES}' == 'False')    Set Test Variable    ${HAYINFANTES}    No
    Run Keyword If  ('${TIENEINFANTES}' == 'True')     Set Test Variable     ${HAYINFANTES}     Si
    Repeat Keyword    ${NUMADULTOS}       Click Element    ${BtnPasajerosAd}
    Repeat Keyword    ${NUMNINOS}         Click Element    ${BtnPasajerosNi}
    Repeat Keyword    ${NUMINFANTES}      Click Element    ${BtnPasajerosIn}

    ${NUMADULTOS}=       Evaluate    ${NUMADULTOS}+2
    Set Test Variable    ${NUMADULTOS}
    Set Test Variable    ${NUMNINOS}
    Set Test Variable    ${NUMINFANTES}
    Set Test Variable    ${TIENEINFANTES}
    Click element        ${InpPasajeros}

Ingresa fechas
    [Arguments]      ${FECHAIDAENTRADA}

    Click element     ${InpVueloIda}

    ${FECHAIDAENTRADA} =     Convert Date 	 ${FECHAIDAENTRADA}  	datetime
    ${ANOPARTIDA}=           Set Variable     ${FECHAIDAENTRADA.year}
    ${ANOPARTIDA}=           convert to string    ${ANOPARTIDA}
    ${MESPARTIDA}=           Set Variable     ${FECHAIDAENTRADA.month}
    ${MESPARTIDA}=           convert to string    ${MESPARTIDA}
    ${DIAPARTIDA}=           Set Variable      ${FECHAIDAENTRADA.day}
    ${DIAPARTIDA}=           convert to string    ${DIAPARTIDA}

    ${FechaIda} =	    Replace String	   ${FechaIda}	   DD	    ${DIAPARTIDA}
    ${FechaIda} =	    Replace String	   ${FechaIda}	   MM	    ${ListaMeses}[${MESPARTIDA}]
    ${FechaIda} =	    Replace String	   ${FechaIda}	   AAAA	    ${ANOPARTIDA}

    Wait Until Page Contains Element    ${FechaIda}
    #Execute Javascript    document.evaluate("//div[contains(@class, 'month-element') and text() = 'February']/following-sibling::div[contains(@class, 'month-element') and text() = '2020']/../../../following-sibling::tbody//tr//td//div[contains(@class, 'valid') and text() = '29']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.classList.add('valid', 'checked', 'first-date-selected', 'last-date-selected');
    #Scroll Element Into View    xpath=//div[contains(@class, 'month-element') and text() = 'April']/following-sibling::div[contains(@class, 'month-element') and text() = '2020']/../../../following-sibling::tbody//tr//td//div[contains(@class, 'day') and text() = '29']
    Click Javascript     ${FechaIda}
    debug

    Wait Until Page Contains Element    ${BtnContinuarIBE}
    Click element    ${BtnContinuarIBE}


    #Click Javascript    xpath=//*[@id="_wingocomponentsibenew_INSTANCE_ctyl_-container-toDate-modal2"]/div/div[2]/table[1]/tbody/tr[5]/td[4]/div
    #Wait Until Page Contains Element    xpath=//div[contains(@class, 'month-element') and text() = 'February']/following-sibling::div[contains(@class, 'month-element') and text() = '2020']/../../../following-sibling::tbody//tr//td//div[contains(@class, 'day') and text() = '27']
    #Wait Until Element Is Visible       xpath=//*[@id="_wingocomponentsibenew_INSTANCE_ctyl_-container-toDate-modal1"]//div[contains(@class, 'month-element') and text() = 'February']/following-sibling::div[contains(@class, 'month-element') and text() = '2020']
    #Click element    xpath=//*[@id="_wingocomponentsibenew_INSTANCE_ctyl_-container-toDate-modal2"]/div/div[2]/table[1]/tbody/tr[4]/td[5]/div
    #debug
    #Wait Until Element Is Visible     xpath=//div[contains(@class, 'month-element') and text() = 'February']/following-sibling::div[contains(@class, 'month-element') and text() = '2020']/../../../following-sibling::tbody//tr//td//div[contains(@class, 'day') and text() = '27']         15s
    #Wait Until Element Is Enabled    xpath=//div[contains(@class, 'month-element') and text() = 'February']/following-sibling::div[contains(@class, 'month-element') and text() = '2020']/../../../following-sibling::tbody//tr//td//div[contains(@class, 'day') and text() = '27']
    #Execute Javascript    document.evaluate("//div[contains(@class, 'month-element') and text() = 'April']/following-sibling::div[contains(@class, 'month-element') and text() = '2020']/../../../following-sibling::tbody//tr//td//div[contains(@class, 'day') and text() = '27']", document.body, null, 9, null).singleNodeValue.click();
    #Click element    xpath=//*[@id="_wingocomponentsibenew_INSTANCE_ctyl_-container-toDate-modal1"]/div/div[2]/table[1]/tbody/tr[4]/td[7]/div
    #Click element    xpath=//*[@id="_wingocomponentsibenew_INSTANCE_ctyl_-container-toDate-modal1"]//div[contains(@class, 'month-element') and text() = 'February']/following-sibling::div[contains(@class, 'month-element') and text() = '2020']


Click Javascript
    [Arguments]      ${ELEMENTO}
    ${CADENAJS}=     Set Variable     document.evaluate("XXX", document.body, null, 9, null).singleNodeValue.click();
    ${ELEMENTO}=    Get Substring   ${ELEMENTO}   6
    ${ELEMENTOCLICK} =	 Replace String	  ${CADENAJS}	   XXX	  ${ELEMENTO}
    Execute Javascript    ${ELEMENTOCLICK}


####################################
abrir pagina tarifas
      [Arguments]      ${URL}     ${NOMBRECEL}
      ${Options}    Create Dictionary    androidPackage    com.android.chrome
      ${caps}    Create Dictionary    chromeOptions    ${Options}
      Set to Dictionary    ${caps}    platformName    Android
      Set to Dictionary    ${caps}    platformVersion    ${CELULARES.${NOMBRECEL}.version}
      Set To Dictionary    ${caps}    deviceName      ${CELULARES.${NOMBRECEL}.nombre}
      Set To Dictionary    ${caps}    browserName     Chrome
      Set To Dictionary    ${caps}    AUTO_WEBVIEW    true
      Set To Dictionary    ${caps}    chromedriverExecutableDir    ${CURDIR}
      Set To Dictionary    ${caps}    newCommandTimeout    999999

      Set Library Search Order     SeleniumLibrary

      Create Webdriver    Remote    command_executor=${APPIUM_SERVER1}     desired_capabilities=${caps}
      go to         ${URL}
      ir a Tarifas
      Llena pasajeros


concatena url
    [Arguments]    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}    ${UFECHAVUELTA}     ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}    ${UNAVEGADOR}
    Run Keyword If  ('${UFECHAVUELTA}' == 'x')    asigna url OW    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}    ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}
    Run Keyword If  ('${UFECHAVUELTA}' <> 'x')    asigna url RT    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}    ${UFECHAVUELTA}    ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}
    Run Keyword If  ('${UINFANTES}' <> '0')    Set Test Variable     ${HAYINFANTES}     Si
    Run Keyword If  ('${UINFANTES}' == '0')    Set Test Variable     ${HAYINFANTES}     no
    Run Keyword If  ('${HAYINFANTES}' == 'Si')     set test variable    ${HAYINFANTES}

    Run Keyword If   $AMBIENTE in $PAGINASESP     set test variable    ${IDIOMA}        ES
    Run Keyword If   $AMBIENTE in $PAGINASIN      set test variable    ${IDIOMA}        EN

    ${NUMADULTOS}=      Evaluate    ${UADULTOS}+1
    ${NUMNINOS}=        Set Test Variable    ${UNINOS}
    Set Test Variable    ${NUMADULTOS}
    Set Test Variable    ${NUMNINOS}

    Asigna PO pagina principal         ${IDIOMA}
    Asigna PO pagina tarifas           ${IDIOMA}
    Asigna PO pagina ssr               ${IDIOMA}
    Return From Keyword    ${URL}


asigna url RT
    [Arguments]    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}    ${UFECHAVUELTA}     ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}
    ${URL}=    Catenate  SEPARATOR=/   ${URLBOOKING.${AMBIENTE}}   ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}   ${UFECHAVUELTA}   ${UADULTOS}   ${UINFANTES}    ${UNINOS}   0   ${UMONEDA}   0   0
    set test variable   ${URL}
    ${TVUELO}=  set variable  RT
    set test variable   ${TVUELO}


asigna url OW
    [Arguments]    ${AMBIENTE}    ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}     ${UADULTOS}    ${UNINOS}    ${UINFANTES}    ${UMONEDA}
    ${URL}=    Catenate  SEPARATOR=/   ${URLBOOKING.${AMBIENTE}}   ${UCIUDADIDA}   ${UCIUDADVUELTA}   ${UFECHAIDA}   ${UADULTOS}   ${UINFANTES}    ${UNINOS}   1   ${UMONEDA}   0   0
    set test variable   ${URL}
    ${TVUELO}=  set variable  OW
    set test variable   ${TVUELO}


ir a Tarifas
    Run Keyword If  ('${HAYINFANTES}' == 'Si')     Valida_infantes
    Wait Until Page Contains    ${Txttarifas}    10s
    Wait Until Element Is Visible    ${BtnCONTINUART}    10s
    Set Focus To Element    ${BtnCONTINUART}
    Click Element     ${BtnCONTINUART}


Llena pasajeros
     Wait Until Page Contains    ${TxtPasajeros}
     Ingresa_adultos

Ingresa_adultos
    Sleep  3s
    Execute javascript    $('.color-yellow').remove()
    Execute javascript    $('.w-header-tab').remove()
    Execute javascript    $('.bg-purple-dark').remove()
    : FOR    ${INDEX}    IN RANGE    1    ${NUMADULTOS}
    \   ${NOMBREADULTO} =     nombreWingo
    \   ${APELLIDOADULTO}=    apellidoWingo
    \   ${ANO}=               Get Current Date   result_format=%Y
    \   ${ANO}=               Convert To Integer   ${ANO}
    \   ${ANOADULTO}=         Evaluate   ${ANO}-30
    \   ${ANOADULTO}=         Convert To String    ${ANOADULTO}
    \   ${DIA}=               Get Current Date   result_format=%d
    \   ${DIA}=               Convert To String    ${DIA}
    \   ${MES}=               Get Current Date   result_format=%m
    \   ${MES}=               Convert To String    ${MES}
    \   ${TxtNOMBREADULTO}=     Evaluate   '${TxtNOMBREADULTO}'.replace("XXX", "${INDEX}")
    \   Input Text    ${TxtNOMBREADULTO}    ${NOMBREADULTO}
    \   ${TxtAPELLIDO}=     Evaluate   '${TxtAPELLIDO}'.replace("XXX", "${INDEX}")
    \   Input Text    ${TxtAPELLIDO}    ${APELLIDOADULTO}
    \    ${LblSEXO}=        Evaluate   '${LblSEXO}'.replace("XXX", "${INDEX}")
    \    Set Focus To Element    ${LblSEXO}
    \    click element    ${LblSEXO}
    \    click element     xpath=//div[@id='sex-ad-${INDEX}']/ul/li[1]
    \    Click element     xpath=(//div[contains(@class,'mobile-combo-datepicker-year')])[${INDEX}]
    \    Click Javascript     xpath=//div[contains(@class, 'col-xs-11') and text() = '1990']
    \    Click element     xpath=(//div[contains(@class,'mobile-combo-datepicker-month')])[${INDEX}]
    #\    Click Javascript     xpath=//div[contains(@class, 'ng-star-inserted')][2]
    \    ${LblMES}=        Evaluate    '${LblMES}'.replace("XXX", "${INDEX}")
    \    Select From List By Index    ${LblMES}      ${MES}
    \    ${LblDIA}=        Evaluate    '${LblDIA}'.replace("XXX", "${INDEX}")
    \    Select From List By Index    ${LblDIA}      4
    \   ${TxtNOMBREADULTO}=     Evaluate   '${TxtNOMBREADULTO}'.replace("${INDEX}", "XXX")
    \    ${TxtAPELLIDO}=         Evaluate   '${TxtAPELLIDO}'.replace("${INDEX}", "XXX")
    \    ${LblSEXO}=             Evaluate   '${LblSEXO}'.replace("${INDEX}", "XXX")
    \    ${LblANO}=              Evaluate   '${LblANO}'.replace("${INDEX}", "XXX",1)
    \    ${LblMES}=              Evaluate   '${LblMES}'.replace("${INDEX}", "XXX",1)
    \    ${LblDIA}=              Evaluate   '${LblDIA}'.replace("${INDEX}", "XXX",1)

Valida_infantes
    Wait Until Page Contains    ${TxtInfantes}    8s
    Set Focus To Element    ${BtnINFANTES}
    Click Element     ${BtnINFANTES}


