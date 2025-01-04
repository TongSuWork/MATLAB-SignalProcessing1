ome = -2*pi:pi/100:2*pi;
 x1 = cos(ome);
 x2 = sin(ome);
 str = {'-2\pi','-3\pi/2','-\pi','-\pi/2','0','\pi/2','\pi','3\pi/2','2\pi'};
 figure,
 subplot(221), plot(ome,x1,ome,x2), grid
 xticks([-2*pi -3*pi/2 -pi -pi/2 0 pi/2 pi 3*pi/2 2*pi])
 xticklabels(str);
 xlim([-2*pi 2*pi])
 ylim([-1.5 1.5])
 subplot(222), plot(ome,x1,ome,x2,ome,-x2), grid
 xticks([-2*pi -3*pi/2 -pi -pi/2 0 pi/2 pi 3*pi/2 2*pi])
 xticklabels(str);
 xlim([-2*pi 2*pi])
 ylim([-1.5 1.5])
 subplot(223), plot(ome,x1,ome,-x1), grid
 xticks([-2*pi -3*pi/2 -pi -pi/2 0 pi/2 pi 3*pi/2 2*pi])
 xticklabels(str);
 xlim([-2*pi 2*pi])
 ylim([-1.5 1.5])
 xlabel('\theta') 
subplot(224), plot(ome,x2,ome,-x2), grid
 xticks([-2*pi -3*pi/2 -pi -pi/2 0 pi/2 pi 3*pi/2 2*pi])
 xticklabels(str);
 xlim([-2*pi 2*pi])
 ylim([-1.5 1.5])
 xlabel('\theta')