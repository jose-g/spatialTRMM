function [vector]=getVector(trmm,irow,icol)
numrows=16;
[row,col]=size(trmm);
reg=row/numrows;
r=irow;
for i=1:reg
   vec(i,1)=trmm(r,icol);
   r=r+numrows;
end
vector=vec;

