  mode(-1);
   rdef = rt_robot(),

   // create a robot from a list of links:
   // Puma 560 standard (kinematic data only)
   clear L;
   L = list();
          
   L(1) = rt_link([%pi/2 0 0 0 0], "standard");
   L(2) = rt_link([0 1.24968 0 0 0], "standard");
   L(3) = rt_link([0 0 0 -0.29039 0], "standard");
   L(4) = rt_link([0 0.5 0 0 0], "standard");
   L(5) = rt_link([-%pi/2 0 0 -0.20873 0], "standard");   
   L(6) = rt_link([%pi/2 0 0 0 0], "standard");
   L(7) = rt_link([0 0.54679 0 0 0], "standard");
   L(8) = rt_link([0 0.504 0 0 0], "standard");
   L(9) = rt_link([0 0 0 0 0], "standard");

   
   DAIE = rt_robot(L, "DAIE", "Unimation", "params of 8/95");   
  
  inicial=[0 %pi/2 %pi/2 0 %pi/2   0  -%pi/2 0 0];        
   
h0 = scf(0); a0 = h0.children;               // create a new graphic win.
a0.tight_limits = "on";
a0.rotation_angles = [50, -30];              // adjust observation point
rt_plot(DAIE,inicial,"workspace",[-1.5, 0.5, -1, 1, 0,1.8]);                      

    
    
    

    
    
