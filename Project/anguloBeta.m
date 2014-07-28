%ANGULO BETA

%Para el modelo de paso derecho calculamos los puntos de las dos piernas
P4_der = der(:,10:12);
P5_der = der(:,13:15);
P6_der = der(:,16:18);
P7_der = der(:,19:21);
V54_der = P5_der - P4_der;
V67_der = P7_der - P6_der;

P22_der = der(:,64:66);
P23_der = der(:,67:69);
P24_der = der(:,70:72);
P25_der = der(:,73:75);
V2322_der = P23_der - P22_der;
V2524_der = P25_der - P24_der;

%Para el modelo de paso derecho calculamos los valores del angulo
for i=1:1:100
    cobeta_der1(i)=(V54_der(i,1)*V67_der(i,1)+V54_der(i,2)*V67_der(i,2)+V54_der(i,3)*V67_der(i,3))/(sqrt(V54_der(i,1)^2+V54_der(i,2)^2+V54_der(i,3)^2)*sqrt(V67_der(i,1)^2+V67_der(i,2)^2+V67_der(i,3)^2));
    beta_der1(i)=180-(acos(cobeta_der1(i))*(180/pi));
end

for j=1:1:100
    cobeta_der2(j)=(V2322_der(j,1)*V2524_der(j,1)+V2322_der(j,2)*V2524_der(j,2)+V2322_der(j,3)*V2524_der(j,3))/(sqrt(V2322_der(j,1)^2+V2322_der(j,2)^2+V2322_der(j,3)^2)*sqrt(V2524_der(j,1)^2+V2524_der(j,2)^2+V2524_der(j,3)^2));
    beta_der2(j)=180-(acos(cobeta_der2(j))*(180/pi));
end

%Para el modelo de paso izquierdo calculamos los puntos de las dos piernas
P4_izq = izq(:,10:12);
P5_izq = izq(:,13:15);
P6_izq = izq(:,16:18);
P7_izq = izq(:,19:21);
V54_izq = P5_izq - P4_izq;
V67_izq = P7_izq - P6_izq;

P22_izq = izq(:,64:66);
P23_izq = izq(:,67:69);
P24_izq = izq(:,70:72);
P25_izq = izq(:,73:75);
V2322_izq = P23_izq - P22_izq;
V2524_izq = P25_izq - P24_izq;

%Para el modelo de paso izquierdo calculamos los valores del angulo
for i=1:1:100
    cobeta_izq1(i)=(V54_izq(i,1)*V67_izq(i,1)+V54_izq(i,2)*V67_izq(i,2)+V54_izq(i,3)*V67_izq(i,3))/(sqrt(V54_izq(i,1)^2+V54_izq(i,2)^2+V54_izq(i,3)^2)*sqrt(V67_izq(i,1)^2+V67_izq(i,2)^2+V67_izq(i,3)^2));
    beta_izq1(i)=180-(acos(cobeta_izq1(i))*(180/pi));
end

for j=1:1:100
    cobeta_izq2(j)=(V2322_izq(j,1)*V2524_izq(j,1)+V2322_izq(j,2)*V2524_izq(j,2)+V2322_izq(j,3)*V2524_izq(j,3))/(sqrt(V2322_izq(j,1)^2+V2322_izq(j,2)^2+V2322_izq(j,3)^2)*sqrt(V2524_izq(j,1)^2+V2524_izq(j,2)^2+V2524_izq(j,3)^2));
    beta_izq2(j)=180-(acos(cobeta_izq2(j))*(180/pi));
end

%Representamos los valores del angulo para ambos modelos
figure(2)
subplot(2,2,1);
plot(beta_der1,'b');
hold on;
plot(beta_der2,'g');
title('Modelo de pierna derecha, beta1 y beta2');

subplot(2,2,2);
plot(beta_izq1,'r');
hold on;
plot(beta_izq2,'y');
title('Modelo de pierna izquierda, beta1 y beta2');

subplot(2,2,3);
plot(beta_der1,'b');
hold on;
%plot(beta_der2,'g');
%hold on;
plot(beta_izq1,'r');
hold on;
%plot(beta_izq2,'y');
title('Ambos modelos, beta1');

subplot(2,2,4);
%plot(beta_der1,'b');
%hold on;
plot(beta_der2,'g');
hold on;
%plot(beta_izq1,'r');
%hold on;
plot(beta_izq2,'y');
title('Ambos modelos, beta2');

%Calculamos la funcion de asimetria

mostrar = 1;

while (mostrar == 1)
    
    opcion = input('Seleccione la función de asimetría que desea calcular (de 1 a 6): ');
    
    switch opcion
        
        case 1, 
            for i=1:1:100
              if(abs(beta_izq1(i)-beta_der1(i))<2)
                 coas1(i)=0;
              else
                 coas1(i)=(beta_izq1(i)-beta_der1(i));
              end
            end

            for i=1:1:100
              if(abs(beta_izq2(i)-beta_der2(i))<2)
                 coas2(i)=0;
              else
                 coas2(i)=(beta_izq2(i)-beta_der2(i));
              end
            end
            
        case 2,
            for i=1:1:100
              if(abs(beta_izq1(i)-beta_der1(i))<2)
                coas1(i)=0;
              else
                coas1(i)=(beta_izq1(i)-beta_der1(i))/(beta_izq1(i)+beta_der1(i));
                coas1(i)=coas1(i)*100;
              end
            end

            for i=1:1:100
              if(abs(beta_izq2(i)-beta_der2(i))<2)
                coas2(i)=0;
              else
                coas2(i)=(beta_izq2(i)-beta_der2(i))/(beta_izq2(i)+beta_der2(i));
                coas2(i)=coas2(i)*100;
              end
            end
            
        case 3,
            for i=1:1:100
              if(abs(beta_izq1(i)-beta_der1(i))<2)
                coas1(i)=0;
              else
                coas1(i)=abs((beta_der1(i)/beta_izq1(i))-(beta_izq1(i)/beta_der1(i)));
                coas1(i)=coas1(i)*100;
              end
            end
            
            for i=1:1:100
              if(abs(beta_izq2(i)-beta_der2(i))<2)
                coas2(i)=0;
              else
                coas2(i)=abs((beta_der2(i)/beta_der2(i))-(beta_izq2(i)/beta_der2(i)));
                coas2(i)=coas2(i)*100;
              end
            end
        
        case 4,
            for i=1:1:100
              if(abs(beta_izq1(i)-beta_der1(i))<2)
                coas1(i)=0;
              else
                coas1(i)=(beta_der1(i)/beta_izq1(i))+(beta_izq1(i)/beta_der1(i))-2;
                coas1(i)=coas1(i)*100;
              end
            end
            
            for i=1:1:100
              if(abs(beta_izq2(i)-beta_der2(i))<2)
                coas2(i)=0;
              else
                coas2(i)=(beta_der2(i)/beta_izq2(i))+(beta_izq2(i)/beta_der2(i))-2;
                coas2(i)=coas2(i)*100;
              end
            end
            
        case 5,
            for i=1:1:100
              if(abs(beta_izq1(i)-beta_der1(i))<2)
                coas1(i)=0;
              else
                coas1(i)=(beta_der1(i)-beta_izq1(i))/max(beta_der1(i),beta_izq1(i));
                coas1(i)=coas1(i)*100;
              end
            end
            
            for i=1:1:100
              if(abs(beta_izq2(i)-beta_der2(i))<2)
                coas2(i)=0;
              else
                coas2(i)=(beta_der2(i)-beta_izq2(i))/max(beta_der2(i),beta_izq2(i));
                coas2(i)=coas2(i)*100;
              end
            end
            
        case 6,
            for i=1:1:100
              if(abs(beta_izq1(i)-beta_der1(i))<2)
                coas1(i)=0;
              else
                coas1(i)=abs((beta_der1(i)-beta_izq1(i))/max(beta_der1(i),beta_izq1(i)));
                coas1(i)=coas1(i)*100;
              end
            end
            
            for i=1:1:100
              if(abs(beta_izq2(i)-beta_der2(i))<2)
                coas2(i)=0;
              else
                coas2(i)=abs((beta_der2(i)-beta_izq2(i))/max(beta_der2(i),beta_izq2(i)));
                coas2(i)=coas2(i)*100;
              end
            end  
            
        case 0,
            mostrar = 0;
            Menu;
            
        otherwise,
            disp ('Opción incorrecta ')
            for i=1:1:100
                coas1(i)=0;
                coas2(i)=0;
            end

    end
    
    %Calculamos el coeficiente de asimetria
    media1=mean(coas1);
    media2=mean(coas2);
    for i=1:1:100
        resultado1(i)=(coas1(i)-media1)^2;
        resultado2(i)=(coas2(i)-media2)^2;
    end
   
    coeficiente1=sqrt(mean(resultado1));
    coeficiente2=sqrt(mean(resultado2));
    
    %Representamos el coeficiente de asimetria
    disp(' ');
    disp('El coeficiente de asimetría para la primera pierna es: ');disp(coeficiente1);
    disp(' ');
    disp('El coeficiente de asimetría para la segunda pierna es: ');disp(coeficiente2);
    
    %Representamos la funcion de asimetria
    if (opcion==1)
        figure(4)
        subplot(2,1,1);
        plot(coas1,'b');
        title('Función de asimetría entre ambos modelos - Primera pierna')
        ylabel('Valor en º');
    
        subplot(2,1,2);
        plot(coas2,'g');
        title('Función de asimetría entre ambos modelos - Segunda pierna');
        ylabel('Valor en º');
    else
        figure(4)
        subplot(2,1,1);
        plot(coas1,'b');
        title('Función de asimetría entre ambos modelos - Primera pierna')
        ylabel('Valor en %');
    
        subplot(2,1,2);
        plot(coas2,'g');
        title('Función de asimetría entre ambos modelos - Segunda pierna');
        ylabel('Valor en %');
    end
    
end