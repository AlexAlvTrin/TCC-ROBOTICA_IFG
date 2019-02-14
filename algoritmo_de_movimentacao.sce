////////// PADRAO PARA ANGULO = a_n PADRAO PARA T = T_n
//////////////////// PROXIMIDADE X Y
exec('E:\Google Drive\TCC\robot\models\model_robot.sce');disp('exec done');

//DEFINICAO DO PONTO x1, y1, z1
x1=1.3;
y1=0.5;
z1=0.6;
//

ang=inicial;
ang1=ang;
ang1_1=ang;
p=1000;
g=1000;
while abs((p)-(x1))>0.1 & abs((g)-(y1))>0.1 do
 ang1(1)=ang1(1)+(1/180)*%pi;
 T=rt_fkine(DAIE,ang1);
 T_n=T;
 p1=T(1,4);
 g1=T(2,4);
 ang1_1(1)=ang1_1(1)-(1/180)*%pi;
 T=rt_fkine(DAIE,ang1_1);
 T_n=T;
 p2=T(1,4);
 g2=T(2,4);
 if abs((p1)-(x1))<abs((p2)-(x1)) then
  p=p1;
  ang2=ang1;
 else p=p2;
      ang2=ang1_1; 
 end 
 if abs((g1)-(y1))<abs((g2)-(y1)) then
  g=g1;
  ang2=ang1;
 else g=g2;
      ang2=ang1_1; 
 end 
end

disp("x=");disp(p);
disp("y=");disp(g);
disp("");

////////////////////////////// AJUSTE DE X Y
while abs((p)-(x1))>0.001 & abs((g)-(y1))>0.001 do
 ang1(1)=ang1(1)+(0.01/180)*%pi;
 T=rt_fkine(DAIE,ang1);
 T_n=T;
 p1=T(1,4);
 g1=T(2,4);
 ang1_1(1)=ang1_1(1)-(0.01/180)*%pi;
 T=rt_fkine(DAIE,ang1_1);
 T_n=T;
 p2=T(1,4);
 g2=T(2,4);
 if abs((p1)-(x1))<abs((p2)-(x1)) then
  p=p1;
  ang2=ang1;
 else p=p2;
      ang2=ang1_1;
 end 
 if abs((g1)-(y1))<abs((g2)-(y1)) then
  g=g1;
  ang2=ang1;
 else g=g2;
      ang2=ang1_1;
 end 
end
disp("x=");disp(p);
disp("y=");disp(g);
disp("");


//////////////////////////////// PROXIMIDADE ALTURA Z1
j=1000;
ang2_2=ang2;
while abs((j)-(z1))>0.01 do
 ang2(3)=ang2(3)+(1/180)*%pi;
 T1=rt_fkine(DAIE,ang2);
 j1=T1(3,4);
 ang2_2(3)=ang2_2(3)-(1/180)*%pi;
 T2=rt_fkine(DAIE,ang2_2);
 j2=T2(3,4);
 if abs((j1)-(z1))<abs((j2)-(z1)) then
  j=j1;
  a_n=ang2;
  T_n=T1;
 else j=j2;
       a_n=ang2_2;
	   T_n=T2;
 end
end
disp("x=");disp (T_n(1,4));
disp("y=");disp(T_n(2,4));
disp("z=");disp(T_n(3,4));
disp("");

////// PLOTAR O GRAFICO

t = [0:0.056:10];
jt = rt_jtraj(inicial, a_n, t);          

clf(0, "clear");
h0 = scf(0); a0 = h0.children; a0.tight_limits = "on";
a0.rotation_angles = [73, 33];              

h1 = scf(1); a1 = h1.children; a1.tight_limits = "on";
a1.rotation_angles = [73, -61];              

a0.rotation_angles = [73, 33];              
a1.rotation_angles = [73, 128];

a0.rotation_angles = [90, 0];                
a1.rotation_angles = [0, 0];                 

xdel(h1.figure_id);
clf(0, "clear");
h0 = scf(0); a0 = h0.children; a0.tight_limits = "on";
a0.rotation_angles = [74, -30];

clf(0, "clear");
h0 = scf(0); a0 = h0.children; a0.tight_limits = "on";
a0.rotation_angles = [74, -30];
exec('E:\Google Drive\TCC\robot\models\model_robot.sce');disp('exec done');
rt_plot(DAIE, jt, "base", "loop", 1);
rt_drivebot(DAIE);
////