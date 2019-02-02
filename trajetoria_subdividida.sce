
n=10; //numero de subdivisoes
t = [0:1:10];
jt = rt_jtraj(inicial, angulo, t);        
for i=0:n
 disp(i,"Enter para visualizar da posicao","string");
 resp=input("aperte a para continuar:","string");
 while resp~= ascii(97) do
 resp=input("ENTER:","string");
 end
 resp=0;
  exec ('E:\Google Drive\TCC\robot\models\model_robot.sce');disp('exec done');
 h0 = scf(0); a0 = h0.children;               // create a new graphic win.
 a0.tight_limits = "on";
 a0.rotation_angles = [60, 33];              // adjust observation point
 //rt_plot(DAIE, jt(i,:),"workspace",[-1.9, 1.9, -1.6, 1.6, -1.9,1.9]);  
 rt_plot(DAIE, jt(i+1,:),"workspace",[-2, 2, -2, 2, 0,2]); 
end