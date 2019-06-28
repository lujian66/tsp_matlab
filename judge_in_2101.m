% Input:
%     X : x coordinate
%	  Y : y coordinate
%
% Output:
%     ture_flase : if (x,y) in s output 1  otherwise 0 
%A(30300,89800) B(66000,84700) C(98400,76700) 
%D(73700,61000) E(57900,47600) F(86800,22000) 
%G(93600,48800) 

function ture_flase = judge_in_2101(x,y)
		x0 = x-1;
		y0 = y-1;
	if( ( mod( x0, 55) == 0 )  &&(  mod( y0, 55) == 0 ) ) 
		ture_flase = 1;
	else
		ture_flase = 0 ;
	end

	%{
	in here you can try judge_in_2101(166,1) and judge_in_2101(111,1)

	if
	x0 = 38.2 * ( x-1 ) ;
	y0 = 38.2 * ( y-1 ) ;
	x0
	if(  rem( x0, 2101) )  
		ture_flase = 1;
	else
		ture_flase = 0 ;
	end
	%}
end
