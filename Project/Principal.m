%PRINCIPAL

%Carga de los ficheros
disp ('Seleccione el fichero con los datos referentes al movimiento de pierna derecha')
disp (' ')
carga=input('Cargar archivo de entrada:  ','s');
der=load(carga);

disp ('Seleccione el fichero con los datos referentes al movimiento de pierna izquierda')
disp (' ')
carga=input('Cargar archivo de entrada:  ','s');
izq=load(carga);

%Llamada al menu
Menu;