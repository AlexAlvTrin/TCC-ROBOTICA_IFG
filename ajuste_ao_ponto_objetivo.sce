  exec('D:\Google Drive\TCC\robot\models\model_robot.sce');disp('exec done');
//DEFINE x1, y1,z1
x1=-1.2;
y1=-0.95;
z1=1.24;

T_n=0;
a_n=inicial;
angulo=0;
diferenca=0.5; //GRAUS 
n_menor_q=360/diferenca;
erro=0.3;  
STOP=0;
n=0;
j=1000;
g=1000;
h=1000;

pontok=0;
pontok1=0;
pontok2=0;

ang1=a_n;ang2=a_n;ang3=a_n;ang4=a_n;ang5=a_n;ang6=a_n;ang7=a_n;ang8=a_n;

l=-3;
o=0;
T=matrix([rt_fkine(DAIE,a_n)],4,4);	 
while STOP==0 & n<n_menor_q do
	n=n+1;

	
	 ang1(1)=ang1(1)+(diferenca/180)*%pi;
	 ang1(3)=ang1(3)+(diferenca/180)*%pi;
	 T1=rt_fkine(DAIE,ang1);
	 j1=T1(1,4);
	 g1=T1(2,4);
	 h1=T1(3,4);
	 l=l+4;
	 o=l+3;	 
	 T(l:o,:)=T1;
	 
	 ang2(1)=ang2(1)-(diferenca/180)*%pi;
	 ang2(3)=ang2(3)-(diferenca/180)*%pi;
	 T2=rt_fkine(DAIE,ang2);
	 j2=T2(1,4);
	 g2=T2(2,4);
	 h2=T2(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T2;
	 
	 ang3(1)=ang3(1)+(diferenca/180)*%pi;
	 ang3(3)=ang3(3)-(diferenca/180)*%pi;
	 T3=rt_fkine(DAIE,ang3);
	 j3=T3(1,4);
	 g3=T3(2,4);
	 h3=T3(3,4);
	 l=l+4;
	 o=l+3;	 
	 T(l:o,:)=T3;
	 
	 ang4(1)=ang4(1)-(diferenca/180)*%pi;
	 ang4(3)=ang4(3)+(diferenca/180)*%pi;
	 T4=rt_fkine(DAIE,ang4);
	 j4=T4(1,4);
	 g4=T4(2,4);
	 h4=T4(3,4);
	 l=l+4;
	 o=l+3;	 
	 T(l:o,:)=T4;

	 
	 a1=abs((j1)-(x1));
	 a2=abs((j2)-(x1));
	 a3=abs((j3)-(x1));
	 a4=abs((j4)-(x1));
 
	 b1=abs((g1)-(y1));
	 b2=abs((g2)-(y1));
	 b3=abs((g3)-(y1));
	 b4=abs((g4)-(y1));

	 c1=abs((h1)-(z1));
	 c2=abs((h2)-(z1));
	 c3=abs((h3)-(z1));
	 c4=abs((h4)-(z1));	 
	 
	 A=[a1 a2 a3 a4 ];
	 B=[b1 b2 b3 b4 ];
	 C=[c1 c2 c3 c4];
	 //disp(A,'A') 
	 
	 [m,k]=min(A);
	 [m1,k1]=min(B);
	 [m2,k2]=min(C);
	 
	  
	 if m<erro & m1<erro & m2<erro & B(k)<erro & B(k2)<erro & A(k1)<erro & A(k2)<erro & C(k)<erro & C(k1)<erro then
	    if B(k)<B(k2) then
	       pontok=pontok+1;
        elseif B(k)>B(k2) then 
	       pontok2=pontok2+1;
        end
	    if A(k1)<A(k2) then
	       pontok1=pontok1+1;
        elseif A(k1)>A(k2) then 
	       pontok2=pontok2+1;
        end
	    if C(k)<C(k1) then
	       pontok=pontok+1;
        elseif C(k)>C(k1) then 
	       pontok1=pontok1+1;
        end      
	    ponto = [pontok,pontok1,pontok2];
	    [m3,k3]=max(ponto);
	    if k3==1 then
	       k1=k;
        elseif k3==2 then
	       k1=k1;
        elseif k3==3 then
	       k1=k2;
	    end   
	    if k1==4 then
		 T_n=T(l:o,:);
		 angulo=ang4;
		elseif k1==3 then
		 T_n=T(l-4:o-4,:);
		  angulo=ang3;
		elseif k1==2 then
		 T_n=T(l-8:o-8,:);	
			angulo=ang2;
		elseif k1==1 then
		 T_n=T(l-12:o-12,:);
			angulo=ang1;
		end
		j=T_n(1,4);
		g=T_n(2,4);
		h=T_n(3,4);
		disp(k1,'k1');
		STOP=1;
	 end	
end	


disp('done');



//diferenca=0.5;
//erro=erro-0.1;
n=0;
STOP=0;
pontok=0;
pontok1=0;
pontok2=0;
ang1=ang1;ang2=ang2;ang3=ang3;ang4=ang4;ang5=ang5;ang6=ang6;ang7=ang7;ang8=ang8;
l=-3;
o=0;
T=matrix([rt_fkine(DAIE,a_n)],4,4);	 

while STOP==0 & n<n_menor_q do
	n=n+1;

	 ang1(1)=ang1(1)+(diferenca/180)*%pi;
	 ang1(3)=ang1(3)+(diferenca/180)*%pi;
	 ang1(6)=ang1(6)+(diferenca/180)*%pi;
	 T1=rt_fkine(DAIE,ang1);
	 j1=T1(1,4);
	 g1=T1(2,4);
	 h1=T1(3,4);
	 l=l+4;
	 o=l+3;	 
	 T(l:o,:)=T1;
	 
	 ang2(1)=ang2(1)-(diferenca/180)*%pi;
	 ang2(3)=ang2(3)-(diferenca/180)*%pi;
	 ang2(6)=ang2(6)-(diferenca/180)*%pi;
	 T2=rt_fkine(DAIE,ang2);
	 j2=T2(1,4);
	 g2=T2(2,4);
	 h2=T2(3,4);
	 l=l+4;
	 o=l+3;	 
	 T(l:o,:)=T2;
	 
	 ang3(1)=ang3(1)+(diferenca/180)*%pi;
	 ang3(3)=ang3(3)-(diferenca/180)*%pi;
	 ang3(6)=ang3(6)-(diferenca/180)*%pi;
	 T3=rt_fkine(DAIE,ang3);
	 j3=T3(1,4);
	 g3=T3(2,4);
	 h3=T3(3,4);
	 l=l+4;
	 o=l+3; 
	 T(l:o,:)=T3;
	 
	 ang4(1)=ang4(1)+(diferenca/180)*%pi;
	 ang4(3)=ang4(3)-(diferenca/180)*%pi;
	 ang4(6)=ang4(6)+(diferenca/180)*%pi;
	 T4=rt_fkine(DAIE,ang4);
	 j4=T4(1,4);
	 g4=T4(2,4);
	 h4=T4(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T4;
	 
	 ang5(1)=ang5(1)-(diferenca/180)*%pi;
	 ang5(3)=ang5(3)+(diferenca/180)*%pi;
	 ang5(6)=ang5(6)+(diferenca/180)*%pi;
	 T5=rt_fkine(DAIE,ang5);
	 j5=T5(1,4);
	 g5=T5(2,4);
	 h5=T5(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T5;

	 ang6(1)=ang6(1)-(diferenca/180)*%pi;
	 ang6(3)=ang6(3)-(diferenca/180)*%pi;
	 ang6(6)=ang6(6)+(diferenca/180)*%pi;
	 T6=rt_fkine(DAIE,ang6);
	 j6=T6(1,4);
	 g6=T6(2,4);
	 h6=T6(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T6;
	 
	 ang7(1)=ang7(1)+(diferenca/180)*%pi;
	 ang7(3)=ang7(3)+(diferenca/180)*%pi;
	 ang7(6)=ang7(6)-(diferenca/180)*%pi;	
	 T7=rt_fkine(DAIE,ang7);
	 j7=T7(1,4);
	 g7=T7(2,4);
	 h7=T7(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T7;
	 
	 ang8(1)=ang8(1)-(diferenca/180)*%pi;
	 ang8(3)=ang8(3)+(diferenca/180)*%pi;
	 ang8(6)=ang8(6)-(diferenca/180)*%pi;
	 T8=rt_fkine(DAIE,ang8);
	 j8=T8(1,4);
	 g8=T8(2,4);
	 h8=T8(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T8;
	 
	 a1=abs((j1)-(x1));
	 a2=abs((j2)-(x1));
	 a3=abs((j3)-(x1));
	 a4=abs((j4)-(x1));
	 a5=abs((j5)-(x1));
	 a6=abs((j6)-(x1));
	 a7=abs((j7)-(x1));
	 a8=abs((j8)-(x1));
	 
	 b1=abs((g1)-(y1));
	 b2=abs((g2)-(y1));
	 b3=abs((g3)-(y1));
	 b4=abs((g4)-(y1));
	 b5=abs((g5)-(y1));
	 b6=abs((g6)-(y1));
	 b7=abs((g7)-(y1));
	 b8=abs((g8)-(y1));
	 
	 c1=abs((h1)-(z1));
	 c2=abs((h2)-(z1));
	 c3=abs((h3)-(z1));
	 c4=abs((h4)-(z1));
	 c5=abs((h5)-(z1));
	 c6=abs((h6)-(z1));
	 c7=abs((h7)-(z1));
	 c8=abs((h8)-(z1));	 
	
	 A=[a1 a2 a3 a4 a5 a6 a6 a8];
	 B=[b1 b2 b3 b4 b5 b6 b7 b8];
	 C=[c1 c2 c3 c4 c5 c6 c7 c8];	 
	 
	 [m,k]=min(A);
	 [m1,k1]=min(B);
	 [m2,k2]=min(C);
	 
	 if m<erro & m1<erro & m2<erro & B(k)<erro & B(k2)<erro & A(k1)<erro & A(k2)<erro & C(k)<erro & C(k1)<erro then
	    if B(k)<B(k2) then
	       pontok=pontok+1;
        elseif B(k)>B(k2) then 
	       pontok2=pontok2+1;
        end
	    if A(k1)<A(k2) then
	       pontok1=pontok1+1;
        elseif A(k1)>A(k2) then 
	       pontok2=pontok2+1;
        end
	    if C(k)<C(k1) then
	       pontok=pontok+1;
        elseif C(k)>C(k1) then 
	       pontok1=pontok1+1;
        end      
	    ponto = [pontok,pontok1,pontok2];
	    [m3,k3]=max(ponto);
	    if k3==1 then
	       k1=k;
        elseif k3==2 then
	       k1=k1;
        elseif k3==3 then
	       k1=k2;
	    end 	   
	    if k1==8 then
		 T_n=T(l:o,:);
		 angulo=ang8;
		elseif k1==7  then
		 T_n=T(l-4:o-4,:);
		 angulo=ang7;
		elseif k1==6  then
		 T_n=T(l-8:o-8,:);
			angulo=ang6;
		elseif k1==5  then
		 T_n=T(l-12:o-12,:);
		 angulo=ang5;
		elseif k1==4  then
		 T_n=T(l-16:o-16,:);
		 angulo=ang4;
		elseif k1==3 then
		  T_n=T(l-20:o-20,:);
		  angulo=ang3;
		elseif k1==2  then
		 T_n=T(l-24:o-24,:);
		 angulo=ang2;
		elseif k1==1  then
		  T_n=T(l-28:o-28,:);
		  angulo=ang1;
		end
		j=T_n(1,4);
		g=T_n(2,4);
		h=T_n(3,4);
		disp(k1,'k1');
		STOP=1;
	 end
end	

disp('done');




//diferenca=0.5;
//erro=erro-0.1;
n=0;
STOP=0;
pontok=0;
pontok1=0;
pontok2=0;

ang1=ang1;ang2=ang2;ang3=ang3;ang4=ang4;ang5=ang5;ang6=ang6;ang7=ang7;ang8=ang8;	
l=-3;
o=0;
T=matrix([rt_fkine(DAIE,a_n)],4,4);	 

while STOP==0 & n<n_menor_q do
	n=n+1;
	
	 ang1(5)=ang1(5)+(diferenca/180)*%pi;
	 ang1(6)=ang1(6)+(diferenca/180)*%pi;
	 ang1(8)=ang1(8)+(diferenca/180)*%pi;
	 T1=rt_fkine(DAIE,ang1);
	 j1=T1(1,4);
	 g1=T1(2,4);
	 h1=T1(3,4);
	 l=l+4;
	 o=l+3;	 
	 T(l:o,:)=T1;
	 
	 ang2(5)=ang2(5)-(diferenca/180)*%pi;
	 ang2(6)=ang2(6)-(diferenca/180)*%pi;
	 ang2(8)=ang2(8)-(diferenca/180)*%pi;
	 T2=rt_fkine(DAIE,ang2);
	 j2=T2(1,4);
	 g2=T2(2,4);
	 h2=T2(3,4);
	 l=l+4;
	 o=l+3;	 
	 T(l:o,:)=T2;
	 
	 ang3(5)=ang3(5)+(diferenca/180)*%pi;
	 ang3(6)=ang3(6)-(diferenca/180)*%pi;
	 ang3(8)=ang3(8)-(diferenca/180)*%pi;
	 T3=rt_fkine(DAIE,ang3);
	 j3=T3(1,4);
	 g3=T3(2,4);
	 h3=T3(3,4);
	 l=l+4;
	 o=l+3; 
	 T(l:o,:)=T3;
	 
	 ang4(5)=ang4(5)+(diferenca/180)*%pi;
	 ang4(6)=ang4(6)-(diferenca/180)*%pi;
	 ang4(8)=ang4(8)+(diferenca/180)*%pi;
	 T4=rt_fkine(DAIE,ang4);
	 j4=T4(1,4);
	 g4=T4(2,4);
	 h4=T4(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T4;
	 
	 ang5(5)=ang5(5)-(diferenca/180)*%pi;
	 ang5(6)=ang5(6)+(diferenca/180)*%pi;
	 ang5(8)=ang5(8)+(diferenca/180)*%pi;
	 T5=rt_fkine(DAIE,ang5);
	 j5=T5(1,4);
	 g5=T5(2,4);
	 h5=T5(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T5;

	 ang6(5)=ang6(5)-(diferenca/180)*%pi;
	 ang6(6)=ang6(6)-(diferenca/180)*%pi;
	 ang6(8)=ang6(8)+(diferenca/180)*%pi;
	 T6=rt_fkine(DAIE,ang6);
	 j6=T6(1,4);
	 g6=T6(2,4);
	 h6=T6(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T6;
	 
	 ang7(5)=ang7(5)+(diferenca/180)*%pi;
	 ang7(6)=ang7(6)+(diferenca/180)*%pi;
	 ang7(8)=ang7(8)-(diferenca/180)*%pi;	
	 T7=rt_fkine(DAIE,ang7);
	 j7=T7(1,4);
	 g7=T7(2,4);
	 h7=T7(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T7;
	 
	 ang8(5)=ang8(5)-(diferenca/180)*%pi;
	 ang8(6)=ang8(6)+(diferenca/180)*%pi;
	 ang8(8)=ang8(8)-(diferenca/180)*%pi;
	 T8=rt_fkine(DAIE,ang8);
	 j8=T8(1,4);
	 g8=T8(2,4);
	 h8=T8(3,4);
	 l=l+4;
	 o=l+3;
	 T(l:o,:)=T8;
	 
	 a1=abs((j1)-(x1));
	 a2=abs((j2)-(x1));
	 a3=abs((j3)-(x1));
	 a4=abs((j4)-(x1));
	 a5=abs((j5)-(x1));
	 a6=abs((j6)-(x1));
	 a7=abs((j7)-(x1));
	 a8=abs((j8)-(x1));
	 
	 b1=abs((g1)-(y1));
	 b2=abs((g2)-(y1));
	 b3=abs((g3)-(y1));
	 b4=abs((g4)-(y1));
	 b5=abs((g5)-(y1));
	 b6=abs((g6)-(y1));
	 b7=abs((g7)-(y1));
	 b8=abs((g8)-(y1));
	 
	 c1=abs((h1)-(z1));
	 c2=abs((h2)-(z1));
	 c3=abs((h3)-(z1));
	 c4=abs((h4)-(z1));
	 c5=abs((h5)-(z1));
	 c6=abs((h6)-(z1));
	 c7=abs((h7)-(z1));
	 c8=abs((h8)-(z1));	 

	 A=[a1 a2 a3 a4 a5 a6 a6 a8];
	 B=[b1 b2 b3 b4 b5 b6 b7 b8];
	 C=[c1 c2 c3 c4 c5 c6 c7 c8];	 
	 
	 [m,k]=min(A);
	 [m1,k1]=min(B);
	 [m2,k2]=min(C);
	 if m<erro & m1<erro & m2<erro & B(k)<erro & B(k2)<erro & A(k1)<erro & A(k2)<erro & C(k)<erro & C(k1)<erro  then
	    if B(k)<B(k2) then
	       pontok=pontok+1;
        elseif B(k)>B(k2) then 
	       pontok2=pontok2+1;
        end
	    if A(k1)<A(k2) then
	       pontok1=pontok1+1;
        elseif A(k1)>A(k2) then 
	       pontok2=pontok2+1;
        end
	    if C(k)<C(k1) then
	       pontok=pontok+1;
        elseif C(k)>C(k1) then 
	       pontok1=pontok1+1;
        end      
	    ponto = [pontok,pontok1,pontok2];
	    [m3,k3]=max(ponto);
	    if k3==1 then
	       k1=k;
        elseif k3==2 then
	       k1=k1;
        elseif k3==3 then
	       k1=k2;
	    end 	   
	    if k1==8  then
		 T_n=T(l:o,:);
		 angulo=ang8;
		elseif k1==7  then
		 T_n=T(l-4:o-4,:);
		 angulo=ang7;
		elseif k1==6  then
		 T_n=T(l-8:o-8,:);
			angulo=ang6;
		elseif k1==5  then
		 T_n=T(l-12:o-12,:);
		 angulo=ang5;
		elseif k1==4  then
		 T_n=T(l-16:o-16,:);
		 angulo=ang4;
		elseif k1==3  then
		  T_n=T(l-20:o-20,:);
		  angulo=ang3;
		elseif k1==2  then
		 T_n=T(l-24:o-24,:);
		 angulo=ang2;
		elseif k1==1  then
		  T_n=T(l-28:o-28,:);
		  angulo=ang1;
		end
		j=T_n(1,4);
		g=T_n(2,4);
		h=T_n(3,4);
		disp(k1,'k1');
		STOP=1;
	 end
end
//
disp ('done')
//

