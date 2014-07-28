%ANGULO ALPHA

%Para el modelo de paso derecho calculamos los puntos de las dos piernas
P6_der = der(:,16:18);
P7_der = der(:,19:21);
P8_der = der(:,22:24);
V76_der = P6_der - P7_der;
V78_der = P8_der - P7_der;

P24_der = der(:,70:72);
P25_der = der(:,73:75);
P26_der = der(:,76:78);
V2524_der = P24_der - P25_der;
V2625_der = P26_der - P25_der;

%Para el modelo de paso derecho calculamos los valores del angulo
for i=1:1:100
    coalpha_der1(i)=(V76_der(i,1)*V78_der(i,1)+V76_der(i,2)*V78_der(i,2)+V76_der(i,3)*V78_der(i,3))/(sqrt(V76_der(i,1)^2+V76_der(i,2)^2+V76_der(i,3)^2)*sqrt(V78_der(i,1)^2+V78_der(i,2)^2+V78_der(i,3)^2));
    alpha_der1(i)=acos(coalpha_der1(i))*(180/pi);
end

for j=1:1:100
    coalpha_der2(j)=(V2524_der(j,1)*V2625_der(j,1)+V2524_der(j,2)*V2625_der(j,2)+V2524_der(j,3)*V2625_der(j,3))/(sqrt(V2524_der(j,1)^2+V2524_der(j,2)^2+V2524_der(j,3)^2)*sqrt(V2625_der(j,1)^2+V2625_der(j,2)^2+V2625_der(j,3)^2));
    alpha_der2(j)=acos(coalpha_der2(j))*(180/pi);
end

%Para el modelo de paso izquierdo calculamos los puntos de las dos piernas
P6_izq = izq(:,16:18);
P7_izq = izq(:,19:21);
P8_izq = izq(:,22:24);
V76_izq = P6_izq - P7_izq;
V78_izq = P8_izq - P7_izq;

P24_izq = izq(:,70:72);
P25_izq = izq(:,73:75);
P26_izq= izq(:,76:78);
V2524_izq = P24_izq - P25_izq;
V2625_izq = P26_izq - P25_izq;

%Para el modelo de paso izquierdo calculamos los valores del angulo
for a=1:1:100
    coalpha_izq1(a)=(V76_izq(a,1)*V78_izq(a,1)+V76_izq(a,2)*V78_izq(a,2)+V76_izq(a,3)*V78_izq(a,3))/(sqrt(V76_izq(a,1)^2+V76_izq(a,2)^2+V76_izq(a,3)^2)*sqrt(V78_izq(a,1)^2+V78_izq(a,2)^2+V78_izq(a,3)^2));
    alpha_izq1(a)=acos(coalpha_izq1(a))*(180/pi);
end

for b=1:1:100
    coalpha_izq2(b)=(V2524_izq(b,1)*V2625_izq(b,1)+V2524_izq(b,2)*V2625_izq(b,2)+V2524_izq(b,3)*V2625_izq(b,3))/(sqrt(V2524_izq(b,1)^2+V2524_izq(b,2)^2+V2524_izq(b,3)^2)*sqrt(V2625_izq(b,1)^2+V2625_izq(b,2)^2+V2625_izq(b,3)^2));
    alpha_izq2(b)=acos(coalpha_izq2(b))*(180/pi);
end

%Representamos los valores del angulo para ambos modelos
figure(1)
subplot(2,2,1);
plot(alpha_der1,'b');
hold on;
plot(alpha_der2,'g');
title('Modelo de pierna derecha, alpha1 y alpha2');

subplot(2,2,2);
plot(alpha_izq1,'r');
hold on;
plot(alpha_izq2,'y');
title('Modelo de pierna izquierda, alpha1 y alpha2');

subplot(2,2,3);
plot(alpha_der1,'b');
hold on;
plot(alpha_izq1,'r');
hold on;
title('Ambos modelos, alpha1');

subplot(2,2,4);
plot(alpha_der2,'g');
hold on;
plot(alpha_izq2,'y');
title('Ambos modelos, alpha2');

%Calculamos la funcion de asimetria

mostrar = 1;

while (mostrar == 1)
    
    opcion = input('Seleccione la función de asimetría que desea calcular (de 1 a 6): ');
    
    switch opcion
        
        case 1, 
            for i=1:1:100
                if(abs(alpha_izq1(i)-alpha_der1(i))<2)
                    coas1(i)=0;
                else
                    coas1(i)=(alpha_izq1(i)-alpha_der1(i));
                end
            end

            for i=1:1:100
                if(abs(alpha_izq2(i)-alpha_der2(i))<2)
                    coas2(i)=0;
                else
                    coas2(i)=(alpha_izq2(i)-alpha_der2(i));
                end
            end
            
        case 2,
            for i=1:1:100
                if(abs(alpha_izq1(i)-alpha_der1(i))<2)
                    coas1(i)=0;
                else
                    coas1(i)=(alpha_izq1(i)-alpha_der1(i))/(alpha_izq1(i)+alpha_der1(i));
                    coas1(i)=coas1(i)*100;
                end
            end

            for i=1:1:100
                if(abs(alpha_izq2(i)-alpha_der2(i))<2)
                    coas2(i)=0;
                else
                    coas2(i)=(alpha_izq2(i)-alpha_der2(i))/(alpha_izq2(i)+alpha_der2(i));
                    coas2(i)=coas2(i)*100;
                end
            end
            
        case 3,
            for i=1:1:100
                if(abs(alpha_izq1(i)-alpha_der1(i))<2)
                    coas1(i)=0;
                else
                    coas1(i)=abs((alpha_der1(i)/alpha_izq1(i))-(alpha_izq1(i)/alpha_der1(i)));
                    coas1(i)=coas1(i)*100;
                end
            end
            
            for i=1:1:100
                if(abs(alpha_izq2(i)-alpha_der2(i))<2)
                    coas2(i)=0;
                else
                    coas2(i)=abs((alpha_der2(i)/alpha_der2(i))-(alpha_izq2(i)/alpha_der2(i)));
                    coas2(i)=coas2(i)*100;
                end
            end
        
        case 4,
            for i=1:1:100
                if(abs(alpha_izq1(i)-alpha_der1(i))<2)
                    coas1(i)=0;
                else
                    coas1(i)=(alpha_der1(i)/alpha_izq1(i))+(alpha_izq1(i)/alpha_der1(i))-2;
                    coas1(i)=coas1(i)*100;
                end
            end
            
            for i=1:1:100
                if(abs(alpha_izq2(i)-alpha_der2(i))<2)
                    coas2(i)=0;
                else
                    coas2(i)=(alpha_der2(i)/alpha_izq2(i))+(alpha_izq2(i)/alpha_der2(i))-2;
                    coas2(i)=coas2(i)*100;
                end
            end
            
        case 5,
            for i=1:1:100
                if(abs(alpha_izq1(i)-alpha_der1(i))<2)
                    coas1(i)=0;
                else
                    coas1(i)=(alpha_der1(i)-alpha_izq1(i))/max(alpha_der1(i),alpha_izq1(i));
                    coas1(i)=coas1(i)*100;
                end
            end
            
            for i=1:1:100
                if(abs(alpha_izq2(i)-alpha_der2(i))<2)
                    coas2(i)=0;
                else
                    coas2(i)=(alpha_der2(i)-alpha_izq2(i))/max(alpha_der2(i),alpha_izq2(i));
                    coas2(i)=coas2(i)*100;
                end
            end
            
        case 6,
          for i=1:1:100
              if(abs(alpha_izq1(i)-alpha_der1(i))<2)
                    coas1(i)=0;
              else
                    coas1(i)=abs((alpha_der1(i)-alpha_izq1(i))/max(alpha_der1(i),alpha_izq1(i)));
                    coas1(i)=coas1(i)*100;
              end
          end
            
          for i=1:1:100
              if(abs(alpha_izq2(i)-alpha_der2(i))<2)
                    coas2(i)=0;
              else
                    coas2(i)=abs((alpha_der2(i)-alpha_izq2(i))/max(alpha_der2(i),alpha_izq2(i)));
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