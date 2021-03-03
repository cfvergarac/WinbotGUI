*** Settings ***
Resource          ../RecursosQA.robot
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
${TIPOVUELO}    OW


*** Test Cases ***
CP_001
    Abrir_Pagina_Principal     ${AMBIENTE}      ${NAVEGADOR} 
    Ingresar_tipo_vuelo        ${TIPOVUELO}
    Ingresar_lugares           ${RIDA}    ${RVUELTA} 
    Seleccionar_Fechas         ${FIDA}   ${FVUELTA}
    Seleccionar_moneda         ${MONEDA} 
    Ingresa_Pasajeros          ${NAD}   ${NNINOS}   ${NINF} 
    Continuar
    Manejo_flex
    Seleccionar_flex      no
    Llena_datos_viajero
    Agregar_ancillarie    no
    continuar_a_sillas
    Selecciona_sillas
    hacer_pago    tc


