clear all
data=load('1999-2006_trmm.txt');
rows=16;
[lines,cols]=size(data);
band=lines/rows;
wave='haar';
for irow=1:rows
    for icol=1:cols
        pixelTRMM=getVector(data,irow,icol); % se obtiene un pixel de TRMM
        % elegir la estacion de precipitacion mas cercana y obtener el
        % pixel
        [pixelRain,station]=getRain(irow,icol);
%        map(irow,icol)=station;
%         if irow==9
%            if icol==13
%                save 'rain_9_13.txt' -ascii pixelRain;
%            end
%         end
        % con los dos pixels aplicar la reconstruccion
        reconstruction=reconstruccion4tonivel(pixelTRMM,pixelRain,wave);
        rec(irow,icol,:)=reconstruction;  % este es una prueba de la estructura de una matriz que guarda la reconstruccion espacial, se usa para probar guardar en un archivo de stacks
    end
end


% guardar reconstruccion en un archivo de stacks

fid = fopen('output.txt', 'a+');
for i=1:band
  if i==1
    dlmwrite('output.txt',rec(:,:,i),'delimiter',' ');
  else
    dlmwrite('output.txt',rec(:,:,i),'delimiter',' ','-append');
  end
  fprintf(fid, '\n');    
end
fclose(fid);
