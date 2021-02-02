
import functions
from datetime import date
from tkinter import *
from tkinter.ttk import Combobox


#CONFIGURACION DE LA VENTANA PRINCIPAL
window = Tk()
window.call('wm', 'iconphoto', window._w,PhotoImage(file='img/flighticon.PNG'))
window.title("WINGBOT")
window.geometry('460x200')


#FRAME NAVEGADORES
framenav = LabelFrame(window, width=100, height=50, text="Navegador:" )
framenav.grid(column=1, row=0)

imgff = PhotoImage(file='img/ff.PNG') 
imggc = PhotoImage(file='img/gc.PNG') 

nav = StringVar()

radgc = Radiobutton(framenav,image=imggc, value='gc', variable=nav)
radgc.pack(side=LEFT)
radgc.select()
raff = Radiobutton(framenav,image=imgff, value='ff', variable=nav)
raff.pack(side=RIGHT)


#FRAME AMBIENTE
frameAmb = LabelFrame(window, width=50, height=150, text="Ambiente:" )
frameAmb.grid(column=2, row=0)
comboAmb = Combobox(frameAmb)
comboAmb['values']= ('QA', 'QAIN', 'PROD', 'PRODIN')
comboAmb.current(0)
comboAmb.pack()


#FRAME MONEDA
frameMod = LabelFrame(window, width=100, height=100, text="Moneda:" )
frameMod.grid(column=3, row=0)
comboMod = Combobox(frameMod)
comboMod['values']= ('COP', 'USD')
comboMod.current(0)
comboMod.pack()


#FRAME RUTAS
rutas =   ['AUA', 'BAQ', 'BOG', 'CLO', 'CUN', 'CCS', 'CTG', 'CUR', 'HAV', 'MDE', 'GYE', 'PUJ', 'UIO', 'ADZ', 'SJO', 'SDQ', 'PTY', 'SMR']

frameRU = LabelFrame(window, width=100, height=100, text="Rutas:" )
frameRU.grid(column=1, row=1)
comboIDA = Combobox(frameRU)
comboIDA['values']= rutas
comboIDA.current(2)
comboIDA.pack()

comboVUELTA = Combobox(frameRU)
comboVUELTA['values']= rutas
comboVUELTA.current(16)
comboVUELTA.pack()

#FRAME PASAJEROS
framePA = LabelFrame(window, width=100, height=100, text="Pasajeros:" )
framePA.grid(column=2, row=1)

lblAdultos = Label(framePA,text="AD")
lblAdultos.pack(side=LEFT)
txtAdultos = Entry(framePA,width=2)
txtAdultos.insert(0,"1" )
txtAdultos.pack(side=LEFT)

lblninos = Label(framePA,text="NI")
lblninos.pack(side=LEFT)
txtninos = Entry(framePA,width=2)
txtninos.insert(0,"0" )
txtninos.pack(side=LEFT)

lblinf = Label(framePA,text="IF")
lblinf.pack(side=LEFT)
txtinf = Entry(framePA,width=2)
txtinf.insert(0,"0" )
txtinf.pack(side=RIGHT)

#FRAME FECHAS
today = date.today()

meses = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
dias =  ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18','19','20','21','22','23','24','25','26','27','28','29','30','31']

frameFE = LabelFrame(window, width=150, height=100, text="Fechas (AAAA/MM/DD):" )
frameFE.grid(column=3, row=1)

frameFEV = LabelFrame(window, width=150, height=100)
frameFEV.grid(column=3, row=3)

lblIDA = Label(frameFE,text="IDA")
lblIDA.pack(side=LEFT)

lblVUELTA = Label(frameFEV,text="VUE")

txtAnoIda = Spinbox(frameFE, from_=today.year, to=2050, width=4)
txtAnoIda.pack(side=LEFT)

txtMesIda = Spinbox(frameFE, from_=today.month, to=12, width=2)
txtMesIda.pack(side=LEFT)

txtDiaIda = Spinbox(frameFE, from_=today.day, to=31, width=2)
txtDiaIda.pack(side=LEFT)

txtAnoVuelta = Spinbox(frameFEV, from_=today.year, to=2050, width=4)
txtMesVuelta = Spinbox(frameFEV, from_=today.month, to=12, width=2)
txtDiaVuelta = Spinbox(frameFEV, from_=today.day, to=31, width=2)


isRT = BooleanVar()  # Declara variable de tipo booleana
isRT.set(False)

def agregaRT():
    if isRT.get() == True:
        lblVUELTA.pack(side=LEFT)
        txtAnoVuelta.pack(side=LEFT)
        txtMesVuelta.pack(side=LEFT)
        txtDiaVuelta.pack(side=LEFT)
    elif isRT.get() == False:
        lblVUELTA.pack_forget()
        txtAnoVuelta.pack_forget()
        txtMesVuelta.pack_forget()
        txtDiaVuelta.pack_forget()
        

ChRT = Checkbutton (frameFE, text="RT", variable = isRT, onvalue =True , offvalue =False, command=agregaRT )
ChRT.pack(side=LEFT)




#BOTON EJECUTAR
def ejecutar():
    mes= meses[int(txtMesIda.get())-1]
    dia= dias[int(txtDiaIda.get())-1]
    fechaIda = "-".join([txtAnoIda.get(),mes, dia])
    
    if isRT.get() == True:
      mesVuelta= meses[int(txtMesVuelta.get())-1]
      diaVuelta= dias[int(txtDiaVuelta.get())-1]
      fechaVuelta = "-".join([txtAnoVuelta.get(),mesVuelta, diaVuelta])
  
    elif isRT.get() == False:
      fechaVuelta = 'x'
    
    #print(isRT)
    functions.ejecuta(nav.get(), comboAmb.get(), comboMod.get(), comboIDA.get(), comboVUELTA.get(),txtAdultos.get(), txtninos.get(), txtinf.get(), fechaIda, fechaVuelta )
    
btn = Button(window, text="Ejecutar", bg="purple", fg="white", command=ejecutar)
btn.grid(column=1, row=3)



window.mainloop()


