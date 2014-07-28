%MENU PRINCIPAL

%Seleccion de opciones entre distintos angulos
correcto = 0;
while (correcto == 0)

    disp(' ')
    disp('MENU')
    disp(' ')
    disp('1.- Angulo alpha')
    disp(' ')
    disp('2.- Angulo beta')
    disp(' ')
    disp('3.- Angulo gamma')
    disp(' ')
    disp('4.- Seleccionar nuevo paciente')
    disp(' ')
    disp('0.- Salir')
    
    opcion = input('Seleccione una opcion: ');
    
    switch opcion
        
        case 1, 
            anguloAlpha;
            correcto = 1;
        case 2, 
            anguloBeta;
            correcto = 1;
        case 3, 
            anguloGamma;
            correcto = 1;
        case 4,
            Principal;
            clear all;
            correcto = 1;
        case 0,
            correcto = 1;
        otherwise,
            disp('No ha seleccionado una opcion correcta. Vuelva a intentarlo')
    
    end

end

