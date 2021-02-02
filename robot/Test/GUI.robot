*** Settings ***
Resource          ../RecursosQA.robot
Test Template    Flujo_compra
#Test Setup       Register Keyword To Run On Failure    close browser
*** Variables ***
${NAVEGADOR}    gc
${AMBIENTE}     QA
${MONEDA}       COP
${RIDA}         BOG
${RVUELTA}      PTY
${NAD}          1
${NNINOS}       0
${NINF}         0
${FIDA}         2021-05-28
${FVUELTA}      2021-06-28

*** Test Cases ***
1		${AMBIENTE}    	${RIDA} 	${RVUELTA} 	 	${FIDA}	   ${FVUELTA}   ${NAD}    ${NNINOS}   ${NINF}    ${MONEDA}    ${NAVEGADOR}


*** Keywords ***
Flujo_compra
    [Arguments]     ${AMBIENTE}    ${ORIGEN}     ${DESTINO}    ${FECHAIDA}    ${FECHAVUELTA}   ${NADULTOS}    ${NNINOS}    ${NINFANTES}    ${MONEDA}    ${NAVEGADOR}
    ${URL}=    concatena url       ${AMBIENTE}   ${ORIGEN}     ${DESTINO}    ${FECHAIDA}    ${FECHAVUELTA}    ${NADULTOS}   ${NNINOS}   ${NINFANTES}   ${MONEDA}   ${NAVEGADOR}
    #Manejo_flex
    #Seleccionar_flex      no
	Sleep   30s
    Llena_datos_viajero
    Agregar_ancillarie    no
    continuar_a_sillas
    Selecciona_sillas
    hacer_pago    tc


