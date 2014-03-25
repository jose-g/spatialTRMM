function [rec]=reconstruccion4tonivel(trmm,lluvia,wave)

factor0=mean(lluvia)/mean(trmm);
%descomposcion
[ca1,cd1]=dwt(lluvia,wave);
[ca2,cd2]=dwt(ca1,wave);
[ca3,cd3]=dwt(ca2,wave);
[ca4,cd4]=dwt(ca3,wave);

[cat1,cdt1]=dwt(trmm,wave);
[cat2,cdt2]=dwt(cat1,wave);
[cat3,cdt3]=dwt(cat2,wave);
[cat4,cdt4]=dwt(cat3,wave);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cat4=cat4*factor0;
%caN3=caN3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rR3ro=idwt(cat4,cd4,wave);
%  figure(99); plot(rR2do); title('3er level, rec en 2 level'); xlabel('dias/2'); ylabel('2*mm')
Rec3=size(rR3ro); Real3=size(cd3);
if max(Rec3) > max(Real3)
    rR3ro=rR3ro(1:(max(Rec3)-1));
elseif max(Rec3) < max(Real3)
    cd2=cd2(1:(max(Real3)-1));
end
%%%%%%%%%%%%%
for i=1:(length(rR3ro))
    if cd3(i)==0
        rR3ro(i)=0;
    end
end

rR2do=idwt(rR3ro,cd3,wave);
%  figure(100); plot(rR2do); title('3er level, rec en 2 level'); xlabel('dias/2'); ylabel('2*mm')
Rec2=size(rR2do); Real2=size(cd2);
if max(Rec2) > max(Real2)
    rR2do=rR2do(1:(max(Rec2)-1));
elseif max(Rec2) < max(Real2)
    cd2=cd2(1:(max(Real2)-1));
end
%%%%%%%%%%%%%
for i=1:(length(rR2do))
    if cd2(i)==0
        rR2do(i)=0;
    end
end

rR1er=idwt(rR2do,cd2,wave);
%  figure(101); plot(rR1er); title('3er level, rec en 1 level'); xlabel('dias/2'); ylabel('2*mm')
%%%%%%%%%%%%%
Rec1er=size(rR1er); Real1er=size(cd1);
if max(Rec1er) > max(Real1er)
    rR1er=rR1er(1:(max(Rec1er)-1));
elseif max(Rec1er) < max(Real1er)
    cd1=cd1(1:(max(Real1er)-1));
end
%%%%%%%%%%%%%%%
for i=1:(length(rR1er))
    if cd1(i)==0
        rR1er(i)=0;
    end
end
rR0=idwt(rR1er,cd1,wave);
%figure(102); plot(rR0); title('3er level RECONSTRUCCION'); xlabel('dias'); ylabel('mm')
RECONSTRUCCION1eraTECNICA=rR0;
% save resultados/RECONSTRUCCION3ernivelreconstruccion. rR0 -ascii
for i=1:max(size(rR0))
    if rR0(i)<0
        rR0(i)=0;
    end
end
% figure(103); plot(rR0); title('3er level RECONSTRUCCION > 0'); xlabel('dias'); ylabel('mm')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tamlluvia=size(lluvia);
% recposlluvia3er=rR0(1:tamlluvia);                   % ETIQUETANDO LA RECONSTRUCCION PERO LA PARTE POSITIVA.
rec=rR0(1:tamlluvia);                   % ETIQUETANDO LA RECONSTRUCCION PERO LA PARTE POSITIVA.

%save reconstruccion.txt rec -ascii

%%% EStO ES PARA GENERAR LA FIGURA 5 DEL PAPER DE LLUVIAS
% x=1:tamlluvia;
% caN3L=length(caN3); x3=1:caN3L; cd3L=length(cd3); x3r=1:cd3L;
% cd2L=length(cd2); x2r=1:cd2L; cd1L=length(cd1); x1r=1:cd1L;
% x2=1:length(rR2do); x1=1:length(rR1er);
% 
% figure(20);
% subplot(4,1,1); plot(x,rec,'r',x,lluvia)
% subplot(4,2,3); plot(x1,rR1er); subplot(4,2,4); plot(x1r,cd1);
% subplot(4,2,5); plot(x2,rR2do); subplot(4,2,6); plot(x2r,cd2);
% subplot(4,2,7); plot(x3,caN3); subplot(4,2,8); plot(x3r,cd3);


