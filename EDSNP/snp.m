%clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
snprecall=zeros(1,15);
snpacc=zeros(1,15);
snperr=zeros(1,15);
snprecision=zeros(1,15);
snpf=zeros(1,15);
snpep=zeros(1,15);
snpmse=zeros(1,15);
snpsnr=zeros(1,15);
snppsnr=zeros(1,15);
tp=zeros(1,15);tn=zeros(1,15);fp=zeros(1,15);fn=zeros(1,15);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=zeros(1,15);
load('C:\Users\86131\Desktop\测试\数据\BSDS500\135069.mat')
y=groundTruth{1,1}.Boundaries;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%T=40;
%for num=1:15
num=1
T(num)=40;
%num=1;
%T(num)=50;
img=imread('C:\Users\86131\Desktop\测试\数据\BSDS500\135069.jpg');
image=rgb2gray(img);
[row,col,dim]=size(image);
a=im2double(image(:,:));
g(:,:,1)=2*255*a+1;
g(:,:,15)=2;
g(:,:,16)=0;
for j=2:12
g(:,:,j)=0;
end
g(:,:,13)=9*T(num);
A=max(max(image));
for h=1:A
  for r=1:row
   for c=1:col
    for k=2:11
    g(r,c,k)=0;
    end
if r==1 || r==row||c==1||c==col
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=1,c=1
if r==1 && c==1
if g(1,1,1)>1 && mod(g(1,1,1),2)==1
g(1,1,3)=g(1,1,3)+1;
end
if g(1,2,1)>1 && mod(g(1,2,1),2)==1
g(1,1,3)=g(1,1,3)+1;
end
if g(2,1,1)>1 && mod(g(2,1,1),2)==1
g(1,1,4)=g(1,1,4)+1;
end
if g(2,2,1)>1 && mod(g(2,2,1),2)==1
g(1,1,4)=g(1,1,4)+1;
end
if g(1,1,3)==2
g(1,1,5)=g(1,1,5)+1;
end
if g(1,1,4)==2
    g(1,1,5)=g(1,1,5)+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=1, 1<c<col%%%%%%%
if r==1 && c>1 && c<col
for c1=2:col-1
if g(1,c1-1,1)>1 && mod(g(1,c1-1,1),2)==1
g(1,c1,3)=g(1,c1,3)+1;
end
if g(1,c1,1)>1 && mod(g(1,c1,1),2)==1
g(1,c1,3)=g(1,c1,3)+1;
end
if g(1,c1+1,1)>1 && mod(g(1,c1+1,1),2)==1
g(1,c1,3)=g(1,c1,3)+1;
end
if g(2,c1+1,1)>1 && mod(g(2,c1+1,1),2)==1
g(1,c1,4)=g(1,c1,4)+1;
end
if g(2,c1-1,1)>1 && mod(g(2,c1-1,1),2)==1
g(1,c1,4)=g(1,c1,4)+1;
end
if g(2,c1,1)>1 && mod(g(2,c1,1),2)==1
g(1,c1,4)=g(1,c1,4)+1;
end
if g(2,c1+1,1)>1 && mod(g(2,c1+1,1),2)==1
g(1,c1,4)=g(1,c1,4)+1;
end
if g(1,c1,3)==2||g(1,c1,3)==13
g(1,c1,5)=g(1,c1,5)+1;
end
if g(1,c1,4)==2||g(1,c1,12)==3
g(1,c1,5)=g(1,c1,5)+1;
end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%c=1, 1<r<col%%%%%%%
if c==1 && r>1 && r<col
for r1=2:row-1
if g(r1-1,1,1)>1 && mod(g(r1-1,1,1),2)==1
g(r1,1,2)=g(r1,1,2)+1;
end
if g(r1-1,2,1)>1 && mod(g(r1-1,2,1),2)==1
g(r1,1,2)=g(r1,1,2)+1;
end
if g(r1,1,1)>1 && mod(g(r1,1,1),2)==1
g(r1,1,3)=g(r1,1,3)+1;
end
if g(r1,2,1)>1 && mod(g(r1,2,1),2)==1
g(r1,1,3)=g(r1,1,3)+1;
end
if g(r1+1,1,1)>1 && mod(g(r1+1,1,1),2)==1
g(r1,1,4)=g(r1,1,4)+1;
end
if g(r1+1,2,1)>1 && mod(g(r1+1,2,1),2)==1
g(r1,1,4)=g(r1,1,4)+1;
end
if g(1,c1,2)==2
g(r1,1,5)=g(r1,1,5)+1;
end
if g(1,c1,3)==2
g(r1,1,5)=g(r1,1,5)+1;
end
if g(1,c1,4)==2
g(r1,1,5)=g(r1,1,5)+1;
end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=1, 1<c<col%%%%%%%
if c==col && r>1 && r<row
for r2=2:row-1
if g(r2-1,col-1,1)>1 && mod(g(r2-1,col-1,1),2)==1
g(r2,col,2)=g(r2,col,2)+1;
end
if g(r2,col-1,1)>1 && mod(g(r2,col-1,1),2)==1
g(r2,col,2)=g(r2,col,2)+1;
end
if g(r2-1,col-1,1)>1 && mod(g(r2-1,col-1,1),2)==1
g(r2,col,3)=g(r2,col-1,3)+1;
end
if g(r2,col,1)>1 && mod(g(r2,col,1),2)==1
g(1,c1,3)=g(1,c1,3)+1;
end
if g(r2+1,col-1,1)>1 && mod(g(r2+1,col-1,1),2)==1
g(r2,col,4)=g(r2,col-1,4)+1;
end
if g(r2+1,col,1)>1 && mod(g(r2+1,col,1),2)==1
g(1,c1,4)=g(1,c1,4)+1;
end
if g(r2,col,2)==2
g(r2,col,5)=g(r2,col,5)+1;
end
if g(r2,col,3)==2
g(r2,col,5)=g(r2,col,5)+1;
end
if g(r2,col,4)==2
g(r2,col,5)=g(r2,col,5)+1;
end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=1,c=col
if r==1 && c==col   
if g(1,col,1)>1 && mod(g(1,col,1),2)==1
g(1,col,3)=g(1,col,3)+1;
end
if g(1,col-1,1)>1 && mod(g(1,col-1,1),2)==1
g(1,col,3)=g(1,col,3)+1;
end
if g(2,col-1,1)>1 && mod(g(2,col-1,1),2)==1
g(1,col,4)=g(1,col,4)+1;
end
if g(2,col,1)>1 && mod(g(2,col,1),2)==1
g(1,col,4)=g(1,col,4)+1;
end
if g(1,col,3)==2
g(1,col,5)=g(1,col,5)+1;
end
if g(1,col,4)==2
g(1,col,5)=g(1,col,5)+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=row,c=1,
if r==row && col==1
if g(row-1,1,1)>1 && mod(g(row-1,1,1),2)==1
g(row,1,2)=g(row,1,2)+1;
end
if g(row-1,2,1)>1 && mod(g(row-1,2,1),2)==1
g(row,1,2)=g(row,1,2)+1;
end
if g(row,1,1)>1 && mod(g(row,1,1),2)==1
g(row,1,3)=g(row,1,3)+1; 
end
if g(row,2,1)>1 && mod(g(row,2,1),2)==1
g(row,1,3)=g(row,1,3)+1;
end
if g(row,1,2)==2
g(row,1,5)=g(row,1,5)+1;
end
if g(row,1,3)==2
g(row,1,5)=g(row,1,5)+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=row,1<c<col
if r==row && c>1 && c<col
   for c2=2:col-1
if g(row-1,c2-1,1)>1 && mod(g(row-1,c2-1,1),2)==1
g(row,c2,2)=g(row,c2,2)+1;
end
if g(row-1,c2,1)>1 && mod(g(row-1,c2,1),2)==1
g(row,c2,2)=g(row,c2,2)+1;
end
if g(row-1,c2+1,1)>1 && mod(g(row-1,c2+1,1),2)==1
g(row,c2,2)=g(row,c2,2)+1; 
end
if g(row,c2-1,1)>1 && mod(g(row,c2-1,1),2)==1
g(row,1,3)=g(row,1,3)+1;
end
if g(row,c2,1)>1 && mod(g(row,c2,1),2)==1
g(row,c2,3)=g(row,c2,3)+1;
end
if g(row,c2+1,1)>1 && mod(g(row,c2+1,1),2)==1
g(row,c2,3)=g(row,c2,3)+1;
end
if g(row,c2,2)==2||g(row,c2,2)==3
g(row,c2,5)=g(row,c2,5)+1;
end
if g(row,c2,3)==2||g(row,c2,3)==3
g(row,c2,5)=g(row,c2,5)+1;
end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=row,c=col%%%%%%%
if r==row && c==col
if g(row-1,col-1,1)>1 && mod(g(row-1,col-1,1),2)==1
g(row,col,2)=g(row,col,2)+1;
end
if g(row-1,col,1)>1 && mod(g(row-1,col,1),2)==1
g(row,col,2)=g(row,col,2)+1;
end
if g(row,col-1,1)>1 && mod(g(row,col-1,1),2)==1
g(row,col,3)=g(row,col,3)+1;
end
if g(row,col,1)>1 && mod(g(row,col,1),2)==1
g(row,col,3)=g(row,col,3)+1;
end
if g(row,col,2)==2
g(row,col,5)=g(row,col,5)+1;
end
if g(row,col,3)==2
g(row,col,5)=g(row,col,5)+1;
end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%g(r,c,1)%%%%%%%%%%
if r>1 && r<row && c>1 && c<col
if g(r-1,c-1,1)>1 && mod(g(r-1,c-1,1),2)==1
g(r,c,2)=g(r,c,2)+1;
end
if g(r-1,c,1)>1 && mod(g(r-1,c,1),2)==1
g(r,c,2)=g(r,c,2)+1;
end
if g(r-1,c+1,1)>1 && mod(g(r-1,c+1,1),2)==1
g(r,c,2)=g(r,c,2)+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%
if g(r,c,2)>1
g(r,c,5)=g(r,c,5)+1;
end
%%%%%%%%%%%%%g(r,c,2)%%%%%%%%%%
if g(r,c-1,1)>1 && mod(g(r,c-1,1),2)==1
g(r,c,3)=g(r,c,3)+1;
end
if g(r,c,1)>1 && mod(g(r,c,1),2)==1
g(r,c,3)=g(r,c,3)+1;
end
if g(r,c+1,1)>1 && mod(g(r,c+1,1),1)==1
g(r,c,3)=g(r,c,3)+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%
if g(r,c,3)>1
g(r,c,5)=g(r,c,5)+1;
end
%%%%%%%%%%%%%g(r,c,3)%%%%%%%%%%
if g(r+1,c-1,1)>1 && mod(g(r+1,c-1,1),2)==1
g(r,c,4)=g(r,c,4)+1;
end
if g(r+1,c,1)>1 && mod(g(r+1,c,1),2)==1
g(r,c,4)=g(r,c,4)+1;
end
if g(r+1,c+1,1)>1 && mod(g(r+1,c+1,1),2)==1
g(r,c,4)=g(r,c,4)+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%
if g(r,c,4)>1
g(r,c,5)=g(r,c,5)+1;
end
end
   end%%%%%%%%%%%%%%%%%%%%%%%%%%the end of row
   end%%%%%%%%%%%%%%%%%%%%%%%%%%the end of col
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=1,c=1 g(6)-g(11)
for r=1:row
for c=1:col
        if g(r,c,1)>1
            g(r,c,1)=g(r,c,1)-2;
        end
%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%
if r==1||c==1||r==row||c==col
if r==1 && c==1
if g(1,1,5)>1
g(1,1,7)=g(1,1,7)+1;g(1,1,10)=g(1,1,10)+1;
end
if g(2,1,5)>1
g(1,1,7)=g(1,1,7)+1;g(1,1,11)=g(1,1,11)+1;
end
if g(1,2,5)>1
g(1,1,8)=g(1,1,8)+1;g(1,1,10)=g(1,1,10)+1;
end
if g(2,2,5)>7
g(1,1,8)=g(1,1,8)+1;g(1,1,11)=g(1,1,11)+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=1,1<c<col
if r==1 && c>1 && c<col
    for c1=2:col-1
if g(1,c1-1,5)>1
g(1,c1,6)=g(1,c1,6)+1;g(1,c1,10)=g(1,c1,10)+1;
end
if g(1,c1,5)>1
g(1,c1,7)=g(1,c1,7)+1;
end
if g(1,c1+1,5)>1
g(1,c1,8)=g(1,c1,8)+1;g(1,c1,10)=g(1,c1,10)+1;
end
if g(2,c1-1,5)>1
g(1,c1,6)=g(1,c1,6)+1;g(1,c1,11)=g(1,c1,11)+1;
end
if g(2,c1,5)>1
g(1,c1,7)=g(1,c1,7)+1;
end
if g(2,c1+1,5)>1
g(1,c1,8)=g(1,c1,8)+1;g(1,c1,11)=g(1,c1,11)+1;
end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%c=1,1<r<row
if c==1 && r>1 && r<row
    for r1=2:row-1
if g(r1-1,1,5)>1
g(r1,1,7)=g(r1,1,7)+1;g(r1,1,9)=g(r1,1,9)+1;
end
if g(r1-1,2,5)>1
g(r1,1,8)=g(r1,1,8)+1;g(r1,1,9)=g(r1,1,9)+1;
end
if g(r1,1,5)>1
g(r1,1,10)=g(r1,1,10)+1;
end
if g(r1,2,5)>1
g(r1,1,10)=g(r1,1,10)+1;
end
if g(r1+1,1,5)>1
g(r1,1,7)=g(r1,1,7)+1;g(r1,1,11)=g(r1,1,11)+1;
end
if g(r1+1,2,5)>1
g(r1,1,8)=g(r1,1,8)+1;g(r1,1,11)=g(r1,1,11)+1;
end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=row,1<c<col
if r==row && c>1 && c<col
    for c1=2:col-1
if g(row-1,c1-1,5)>1
g(row,c1,6)=g(row,c1,6)+1;g(row,c1,9)=g(row,c1,9)+1;
end
if g(row-1,c1,5)>1
g(row,c1,7)=g(row,c1,7)+1;
end
if g(row-1,c1+1,5)>1
g(row,c1,8)=g(row,c1,8)+1;g(row,c1,9)=g(row,c1,9)+1;
end
if g(row,c1-1,5)>1
g(row,c1,6)=g(row,c1,6)+1;g(row,c1,10)=g(row,c1,10)+1;
end
if g(row,c1,5)>1
g(row,c1,7)=g(row,c1,7)+1;
end
if g(row,c1+1,5)>1
g(row,c1,8)=g(row,c1,8)+1;g(row,c1,10)=g(row,c1,10)+1;
end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=1,c=col
if r==1 && c==col   
if g(1,col-1,5)>1
g(1,col,6)=g(1,col,6)+1;g(1,col,10)=g(1,col,10)+1;
end
if g(1,col,5)>1
g(1,col,7)=g(1,col,7)+1;g(1,col,10)=g(1,col,10)+1;
end
if g(2,col-1,5)>1
g(1,col,6)=g(1,col,6)+1;g(1,col,11)=g(1,col,11)+1;
end
if g(2,col,5)>1
g(1,col,7)=g(1,col,7)+1;g(1,col,11)=g(1,col,11)+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=row,c=col
if r==row && c==1  
if g(row-1,1,5)>1
g(row,1,7)=g(row,1,7)+1;g(row,1,9)=g(row,1,9)+1;
end
if g(row-1,2,5)>1
g(row,1,8)=g(row,1,8)+1;g(row,1,9)=g(row,1,9)+1;
end
if g(row,1,5)>1
g(row,1,7)=g(row,1,7)+1;g(row,1,10)=g(row,1,10)+1;
end
if g(row,2,5)>1
g(row,1,8)=g(row,1,8)+1;g(row,1,10)=g(row,1,10)+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%1<r<row,c=col
if r>1 && r<row && c==col   
    for r2=2:row-1
if g(r2-1,col-1,5)>1
g(r2,col,6)=g(r2,col,6)+1;g(r2,col,9)=g(r2,col,9)+1;
end
if g(r2-1,col,5)>1
g(r2,col,7)=g(r2,col,7)+1;g(r2,col,9)=g(r2,col,9)+1;
end
if g(r2,col-1,5)>1
g(r2,col,10)=g(r2,col,10)+1;
end
if g(r2,col,5)>1
g(r2,col,10)=g(r2,col,10)+1;
end
if g(r2+1,col-1,5)>1
g(r2,col,6)=g(r2,col,6)+1;g(r2,col,11)=g(r2,col,11)+1;
end
if g(r2+1,col,5)>7
g(r2,col,7)=g(r2,col,7)+1;g(r2,col,11)=g(r2,col,11)+1;
end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%r=row,c=col
if r==row && c==col 
if g(row-1,col-1,5)>1
g(row,col,6)=g(row,col,6)+1;g(row,col,9)=g(row,col,9)+1;
end
if g(row-1,col,5)>1
g(row,col,7)=g(row,col,7)+1;g(row,col,9)=g(row,col,9)+1;
end
if g(row,col-1,5)>1
g(row,col,6)=g(row,col,6)+1;g(row,col,10)=g(row,col,10)+1;
end
if g(row,col,5)>1
g(row,col,7)=g(row,col,7)+1;g(row,col,10)=g(row,col,10)+1;
end
end 
end
if r>1 && r<row && c>1 && c<col
    if g(r-1,c-1,5)>1
    g(r,c,6)=g(r,c,6)+1;g(r,c,9)=g(r,c,9)+1;
    end
    if g(r-1,c,5)>1
    g(r,c,7)=g(r,c,7)+1;
    end
    if g(r-1,c+1,5)>1
    g(r,c,8)=g(r,c,8)+1;g(r,c,9)=g(r,c,9)+1;
    end
    if g(r,c-1,5)>1
    g(r,c,10)=g(r,c,10)+1;
    end
    if g(r,c+1,5)>1
    g(r,c,10)=g(r,c,10)+1;
    end
    if g(r+1,c-1,5)>1
    g(r,c,6)=g(r,c,6)+1;g(r,c,11)=g(r,c,11)+1;
    end
    if g(r+1,c,5)>1
    g(r,c,7)=g(r,c,7)+1;
    end
    if g(r+1,c+1,5)>1
    g(r,c,8)=g(r,c,8)+1;g(r,c,11)=g(r,c,11)+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if g(r,c,6)==1
    g(r,c,12)=g(r,c,12)+1;
end
if g(r,c,7)==1
    g(r,c,12)=g(r,c,12)+2;
end 
if g(r,c,8)==1
    g(r,c,12)=g(r,c,12)+1;
end 
if g(r,c,9)==1
    g(r,c,12)=g(r,c,12)+1;
end
if g(r,c,10)==1
    g(r,c,12)=g(r,c,12)+2;
end 
if g(r,c,11)==1
    g(r,c,12)=g(r,c,12)+1;
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%g(12)-g(17)
if g(r,c,12)>0
   if g(r,c,13)==0
        g(r,c,12)=0;g(r,c,14)=1;
    end 
    if g(r,c,13)>9*g(r,c,12) || g(r,c,13)==9*g(r,c,12)
        g(r,c,13)=g(r,c,13)-9*g(r,c,12);g(r,c,12)=0;g(r,c,14)=2;
    end
    if g(r,c,13)>0 && g(r,c,13)<9*g(r,c,12)
        g(r,c,13)=0;g(r,c,12)=0;g(r,c,14)=1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if g(r,c,14)==2
g(r,c,14)=0; g(r,c,15)=g(r,c,15);
end
if g(r,c,14)==1 
g(r,c,14)=0; g(r,c,15)=g(r,c,15)+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%g(i,j,t1) 
if g(r,c,15)==3
g(r,c,1)=0;g(r,c,15)=0;g(r,c,16)=1;
end
if g(r,c,15)==1
g(r,c,1)=0;g(r,c,15)=0;g(r,c,16)=g(r,c,16);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
end%%%%%%%%%%%%%%%%%%%%%%%%%%the end of col
end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%the end of row
if g(r,c,1)>1
   g(r,c,1)=g(r,c,1)-2;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for r=1:row
    for c=1:col
   if g(r,c,16)==1 && y(r,c)==1
        tp(num)=tp(num)+1;
    end
    if g(r,c,16)==0 && y(r,c)==0
        tn(num)=tn(num)+1;
    end
    if g(r,c,16)==1 && y(r,c)==0
        fp(num)=fp(num)+1;
    end
    if g(r,c,16)==0 && y(r,c)==1
        fn(num)=fn(num)+1;
    end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
snprecall(num)=tp(num)/(tp(num)+fp(num));
snpacc(num)=(tp(num)+tn(num))/(tp(num)+tn(num)+fp(num)+fn(num));
snperr(num)=fp(num)/(tp(num)+fn(num));
snpfpr(num)=fp(num)/(tp(num)+fp(num));
snprecision(num)=tp(num)/(tp(num)+fp(num));
snpf(num)=2*snprecall(num)*snpacc(num)/(snprecall(num)+snpacc(num));
snpmse(num)=sum((sum((g(:,:,16)-y).*(g(:,:,16)-y)))')/(row*col);
snpsnr(num)=(sum((sum((g(:,:,16).*g(:,:,16))))')/(row*col*snpmse(num))).^0.5;
snppsnr(num)=10*log10(255*255/snpmse(num));
%end
disp('输出值为：tp');
disp(tp(num));
disp('输出值为：tn');
disp(tn(num));
disp('输出值为：fp');
disp(fp(num));
disp('输出值为：fn');
disp(fn(num));
disp('输出值为：mse');
disp(snpmse(num));
disp('输出值为：spsnr');
disp(snppsnr(num));
imshow(g(:,:,16),[]);
