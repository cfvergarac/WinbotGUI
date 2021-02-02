*** Variables ***

#DATOS AMBIENTE

&{URL}          QA=https://vuela-uat-old.wingo.com/    QAIN=https://vuela-uat-old.wingo.com/en/inicio     QAL=http://vuela.wingo.landsoft.com.co/    QALIN=http://vuela.wingo.landsoft.com.co/en/inicio       PROD=https://www.wingo.com/es/inicio    PRODIN=https://www.wingo.com/en   PALIADOSQA=https://aliados-qa.wingo.com/es
&{URLCHECKIN}   QACI=https://webcheckin-qa.wingo.com/webcheckin/es     QACIEN=https://webcheckin-qa.wingo.com/webcheckin/en     QACIPROD=https://webcheckin.wingo.com/
&{URLMMB}       QAMMB=https://mmb-qa.wingo.com       QAMMBEN=https://mmb-qa.wingo.com
&{URLBOOKING}    QA=https://booking-uat.wingo.com/es/search     PROD=https://booking.wingo.com/es/search    QAIN=https://booking-uat.wingo.com/en/search     PRODIN=https://booking.wingo.com/en/search

#CORREO RESERVA
${CORREORESERVA}     pruebas.wingo@gmail.com    #cristianvergara@sqdm.com    #BeDiaz@wingo.com     #katyeslava@gmail.com      #cristianvergara@sqdm.com     #bot@sqdm.com       ginpao126@hotmail.com     santiagonzalez.sgl@gmail.com

#DATOS PERSONA PAGOS AUTOMATIZADOS
${NOMBREAUT}     Pagos
${APELLIDOAUT}   Automatizacion

#FECHAS CALENDARIO
&{SUMAFECHA}     Enero=4    Febrero=5    Marzo=0     Abril=2   Mayo=4    Julio=2  Junio=0    Agosto=3    Septiembre=6    Octubre=3    Noviembre=6    Diciembre=1    January=4    February=5    March=6     April=2   May=4   July=2    June=0    September=6    October=3    November=6    December=1

&{MESESES}         1=Enero    2=Febrero    3=Marzo    4=Abril    5=Mayo    6=Junio    7=Julio    8=Agosto    9=Septiembre   10=Octubre    11=Noviembre    12=Diciembre
&{MESESEN}         1=January    2=February    3=March    4=April    5=May    6=June   7=July    8=August    9=September   10=October       11=November    12=December
&{MESES}           MESESES=${MESESES}    MESESEN=${MESESEN}


#ANCILLARIES
&{ANCI}     CA=Checkin en aeropuerto      PA=Prioridad de abordaje   no=no

#DATOS TARJETAS
${NumeroTarjeta}       5454545454545454         #5454545454541111   #4539 4175 1776 7891
${FechaExpiracion}    0621     #0729     #0621  #0221
${MesExpiracion}      02
${AnoExpiracion}      21
${CodigoExpiracion}   555     # 814   #555
${Direccion}        Cra 75K No 56-13
${Ciudad}        Bogota

#DATOS PSE
${mailSoportePse}    soporte4@zonavirtual.com.co

#VUELOS INTERNACIONALES
@{VINTERNACIONALES} =    AUA    CUN    CCS    MEX    CUR    GUA    GYE    HAV    PTY    BLB    PUJ    UIO    SJO    STI    SDQ

#IDIOMA PAGINAS

@{PAGINASESP} =    QA   QAL   PROD
@{PAGINASIN} =     QAIN   QALIN   PRODIN

#DATOS SP
${UsernameOB}    test

#GIFS

${GIFAVION}        xpath=//div[@class='wng-loader']