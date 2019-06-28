function [] = circle( x,y,r )
rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1],'linewidth',1)%axis equal
hold on
plot( x , y , 'k-o')
end