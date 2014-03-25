function [rain,stat]=getRain(irow,icol)
numstation=25;
cX(1)=4;cX(2)=2;cX(3)=4;cX(4)=3;cX(5)=5;cX(6)=2;cX(7)=7;cX(8)=4;cX(9)=8;cX(10)=5;cX(11)=7;cX(12)=6;cX(13)=7;cX(14)=2;cX(15)=3;cX(16)=1;cX(17)=3;cX(18)=6;cX(19)=5;cX(20)=2;cX(21)=7;cX(22)=3;cX(23)=4;cX(24)=8;cX(25)=8;
cY(1)=5;cY(2)=4;cY(3)=4;cY(4)=7;cY(5)=7;cY(6)=4;cY(7)=5;cY(8)=2;cY(9)=11;cY(10)=5;cY(11)=6;cY(12)=9;cY(13)=9;cY(14)=8;cY(15)=6;cY(16)=4;cY(17)=8;cY(18)=11;cY(19)=4;cY(20)=6;cY(21)=12;cY(22)=3;cY(23)=8;cY(24)=10;cY(25)=1;


  distance=0.0;
  mindis=0.0;
  station=1;
  for i=1:numstation
	fact1=cX(i)-icol;
	pot1=fact1^2;
	fact2=cY(i)-irow;
	pot2=fact2^2;
	distance=sqrt(pot1+pot2);
	if i==1
	  mindis=distance;
	  station=1;
    end
	if distance<mindis
	  mindis=distance;
	  station=i;
    end
  end

switch station
    case 1
        vector=load('datos\Arapa.txt');
    case 2
        vector=load('datos\Ayaviri.txt');
    case 3
        vector=load('datos\Azangaro.txt');
    case 4
        vector=load('datos\Cabanillas.txt');
    case 5
        vector=load('datos\Capachica.txt');
    case 6
        vector=load('datos\Chuquibambilla.txt');
    case 7
        vector=load('datos\Cojata.txt');
    case 8
        vector=load('datos\Crucero.txt');
    case 9
        vector=load('datos\Desaguadero.txt');
    case 10
        vector=load('datos\Huancane.txt');
    case 11
        vector=load('datos\Huarayamoho.txt');
    case 12
        vector=load('datos\Ilave.txt');
    case 13
        vector=load('datos\Juli.txt');
    case 14
        vector=load('datos\Lagunillas.txt');
    case 15
        vector=load('datos\Lampa.txt');
    case 16
        vector=load('datos\Llally.txt');
    case 17
        vector=load('datos\Manazo.txt');
    case 18
        vector=load('datos\Mazocruz.txt');
    case 19
        vector=load('datos\Munani.txt');
    case 20
        vector=load('datos\Pampahuta.txt');
    case 21
        vector=load('datos\Pizacoma.txt');
    case 22
        vector=load('datos\Progreso.txt');
    case 23
        vector=load('datos\Puno.txt');
    case 24
        vector=load('datos\Tahuacoyunguyo.txt');
    case 25
        vector=load('datos\Tambopata.txt');
end
  
  
rain=vector;
stat=station;
