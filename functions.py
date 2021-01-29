import os
from subprocess import call

def ejecuta(navegador, ambiente, moneda, ida, vuelta, nadultos, nninos, ninfantes, fida, fvuelta):
    
    ruta= 'D:\Automatizacion python\Wingo\Wingo\Test\GUI.robot'
    variable = '--variable'
    
    call(['robot','-d', 'resgui',
    variable , 'NAVEGADOR:'+navegador,
    variable , 'AMBIENTE:'+ambiente,
    variable , 'MONEDA:'+moneda,
    variable , 'RIDA:'+ida,
    variable , 'RVUELTA:'+vuelta,
    variable , 'NAD:'+nadultos,
    variable , 'NNINOS:'+nninos,
    variable , 'NINF:'+ninfantes,
    variable , 'FIDA:'+fida,
    variable , 'FVUELTA:'+fvuelta,
    ruta])
    


#robot --variable NAVEGADOR:ff -d res GUI.robot
