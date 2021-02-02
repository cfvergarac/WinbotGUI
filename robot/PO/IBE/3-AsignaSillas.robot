*** Variables ***

#OW

#RT

${BtnNOCOMPRARSILLA}      xpath=(.//*[normalize-space(text()) and normalize-space(.)='No comprar silla'])[2]/following::button[2]
${BtnCONTINUARSILLAS}     xpath=(//button[contains(.,'Continuar')])[2]

#NO gracias

#//button[@class='btnLinkPopup'][contains(.,'No, gracias')]
#//button[@class='btn btn-default'][contains(.,'No, gracias')]


*** Keywords ***
Asignar elementos pagina sillas
   [Arguments]      ${LENGUA}

    ${TxtSillas}=     set variable if      ${LENGUA}=='ES'       ¿Quieres escoger tu silla?        Do you want to select your seat?
    set test variable       ${TxtSillas}
    #(Opcional)    (Optional)

    ${BtnVUELOREGRESO}=     set variable if      ${LENGUA}=='ES'        xpath=//h3[contains(.,'Vuelo de regreso')]        xpath=//h3[contains(.,'Return flight')]
    set test variable       ${BtnVUELOREGRESO}
    #xpath=//h3[contains(.,' Return flight')]

    ${BtnCONTINUAROWQA}=     set variable if      ${LENGUA}=='ES'          xpath=//button[@class='btn btn-default ng-star-inserted'][contains(.,'No, gracias')]     xpath=//button[@class='btn btn-default ng-star-inserted'][contains(.,'No, thanks')]
    set test variable       ${BtnCONTINUAROWQA}

    ${BtnCONTINUAROWPOPUP}=     set variable if      ${LENGUA}=='ES'       xpath= //button[@class='bt-wingo-blue-pop-up'][contains(.,'No, gracias')]    xpath= //button[@class='bt-wingo-blue-pop-up'][contains(.,'No, thanks')]
    set test variable    ${BtnCONTINUAROWPOPUP}

    ${BtnCONTINUAROW}=     set variable if      ${LENGUA}=='ES'            xpath=//button[@class='btn btn-default'][contains(.,'Continuar')]    xpath=(//button[contains(.,'Continue')])[3]
    set test variable    ${BtnCONTINUAROW}
