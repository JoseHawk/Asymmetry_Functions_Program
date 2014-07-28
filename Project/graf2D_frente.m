%REPRESENTACION 2D VISTA DESDE EL FRENTE

function graf2D_frente(a,b)

n=size(a,1);
for i=1:1:3
    
    cont=0;

    while(cont<200)
    for q=1:n
        j=1:26;
        r=j-1;
            plot((a(q,3*j-2)),(-a(q,3*j-1)),'ro');
            hold on
            plot((b(q,3*j-2)),(-b(q,3*j-1)),'.');
            axis([-1000 1000 -1000 1000]);
            grid
            legend('Modelo', 'Original','Location','Best')
            hold off
            drawnow
            pause((30/1000));
            cont=cont+1;
    end
    end
end


end