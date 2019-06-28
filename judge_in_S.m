% Input:
%     X : x coordinate
%	  Y : y coordinate
%
% Output:
%     ture_flase : if (x,y) in s output 1  otherwise 0 
%A(30300,89800) B(66000,84700) C(98400,76700) 
%D(73700,61000) E(57900,47600) F(86800,22000) 
%G(93600,48800) 

function ture_flase = judge_in_S(x,y);
	x0 = 38.2 * ( x-1 ) ;
	y0 = 38.2 * ( y-1 ) ;
	distA = sqrt( power( ( x0 - 30300 ) ,2 ) + power( ( y0 - 89800 ) ,2 ) );
	distB = sqrt( power( ( x0 - 66000 ) ,2 ) + power( ( y0 - 84700 ) ,2 ) );
	distC = sqrt( power( ( x0 - 98400 ) ,2 ) + power( ( y0 - 76700 ) ,2 ) );
	distD = sqrt( power( ( x0 - 73700 ) ,2 ) + power( ( y0 - 61000 ) ,2 ) );
	distE = sqrt( power( ( x0 - 57900 ) ,2 ) + power( ( y0 - 47600 ) ,2 ) );
	distF = sqrt( power( ( x0 - 86800 ) ,2 ) + power( ( y0 - 22000 ) ,2 ) );
	distG = sqrt( power( ( x0 - 93600 ) ,2 ) + power( ( y0 - 48800 ) ,2 ) );

	if ( (distA < 10000 )||( distB < 10000 )||( distC < 10000 )||( distD < 10000 )||( distE < 10000 )||( distF < 10000 )||( distG < 10000 ) )
		ture_flase = 1 ;
	else
		ture_flase = 0 ;
	end

	
end

