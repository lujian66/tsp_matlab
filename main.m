clc;clear
data=xlsread('data.xlsx');
figure(1),surf(data);%draw the relief map
%A(30300,89800) B(66000,84700) C(98400,76700) 
%D(73700,61000) E(57900,47600) F(86800,22000) 
%G(93600,48800) 

%first we need get the assemble S 
[d_row,d_col] = size(data);

high_sum = 0;
npoint = 0;
for i=1:d_row
    for j=1:d_col
      	if( judge_in_S(i,j) == 1 )
      		if( data(i,j) < 3000 )
        		high_sum = high_sum + data(i,j);
        		npoint = npoint + 1;
        	end
        end
    end
end

mean_hi = high_sum / npoint 
scan_r = sqrt(3)*(4200 - mean_hi)/ 3.
scan_s= pi*scan_r*scan_r

discrete_r = 2101
view_array = []
view_point = 0

for i= 1:1:d_row
    for j=1:1:d_col
      	if(  ( data(i,j) < 3000 ) ) %&&
      	 	if (judge_in_2101(i,j) == 1 )
		      	if ( judge_in_S(i,j) == 1 ) 
	      			view_point = view_point + 1 ;
	      			view_array(view_point , 1 ) = 38.2 * (i-1) ;
	      			view_array(view_point , 2 ) = 38.2 * (j-1) ;
	      			view_array(view_point , 3 ) = data(i,j) ;
				    end
        	end	
        end
    end
end
%{
for i=1:1%d_row
    for j=1:1:d_col
      	 	if (judge_in_2101(i,j) == 1 )
	      			view_point = view_point + 1 ;
	      			view_array(view_point , 1 ) = 38.2 * (i-1) ;
	      			view_array(view_point , 2 ) = 38.2 * (j-1) ;
	      			view_array(view_point , 3 ) = data(i,j) ;
        	end
    end
end
%}

%draw 4.1
figure(2)

circle( 30300, 89800, 10000)
hold on
circle( 66000, 84700, 10000)
hold on
circle( 98400, 76700, 10000)
hold on
circle( 73700, 61000, 10000)
hold on
circle( 57900, 47600, 10000)
hold on
circle( 86800, 22000, 10000)
hold on
circle( 93600, 48800, 10000)
hold on

view_point

[view_array_row , view_array_col] = size(view_array);
figure(2)
for	i = 1 : view_array_row
	plot( view_array(i , 1 ) , view_array(i , 2 ), 'r-*')
	hold on
end

%this is to use the mtspf_ga.m
%{
n = view_point + 1 ;
H_base = [110000. , 0.]
xy = [ H_base ; view_array( : , 1:2 ) ];
userConfig = struct('xy',xy);
resultStruct = mtspf_ga(userConfig);
%}


%this is to use the mtsp_ga.m
%{
n = view_point + 1 ;
%xy = 10*rand(n,2);
H_base = [110000. , 0.]
xy = [ H_base ; view_array( : , 1:2 ) ];
nSalesmen = 5;
minTour = 3;
popSize = 80;
numIter = 5e3;
a = meshgrid(1:n);
dmat = reshape(sqrt(sum((xy(a,:)-xy(a',:)).^2,2)),n,n);
[optRoute,optBreak,minDist] = mtsp_ga(xy,dmat,nSalesmen,minTour, ...
popSize,numIter,1,1);
%}



%MAX_TOUR (scalar integer) is the maximum tour length for each salesmen
%TW (scalar_integer) is the time window for each location
%use the MTSP_ga.m
n = view_point + 1 ;
%xy = 10*rand(n,2);
H_base = [110000. , 0.]
xy = [ H_base ; view_array( : , 1:2 ) ];
nSalesmen = 8;
minTour = 3;
max_tour = 4 *60.0*1000 ;%we could change it value to 4 or 8, the reason is plane only have 8 hours
%if the value is 4 ,we need 5 salemans if it is 8, we need 2.
%the difference with the paper 
tw = 0 ;
popSize = 80;
numIter = 5e3;
a = meshgrid(1:n);
dmat = reshape(sqrt(sum((xy(a,:)-xy(a',:)).^2,2)),n,n);
[optRoute,optBreak,minDist] = mtsp_ga_multi_ch(xy,dmat,nSalesmen,minTour, ...
max_tour, tw, popSize,numIter,0,1,1);


%{
[num , num_saleman] = size(optRoute.ch)
distance_saleman = []
for i=1:num_saleman
    cell2mat( optRoute.ch(i) )
    rte = [1 opt_rte.ch{s} ] 
    rte1 = [ opt_rte.ch{s} 1]
    for j = rte
      for k = rte1
    sqrt ( pow( xy( k , 1) - xy( j , 1) )-+
    xy(rte,1),xy(rte,2)
    distance_saleman
    %plot( view_array(i , 1 ) , view_array(i , 2 ), 'r-*')

end  
%=optRoute.ch(1)
%}