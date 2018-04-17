Useful commands
----------------------------------------------------------

# folder navigation
pwd, cd, ls, ...

# load
load mydata.dat

# save object A as binary
save mydata.dat A

# save object A as plain text
save -ascii mydata.txt A

# show all var its types and sizes
whos

# clear
clear

# size of matrix, vecto
size(v)		% returns mxn value




Creation
-------------------------------------

# create matrix 3x2
A=[1 2 4; 5 3 4; 6 5 6]

# create vector
v=[ 1 4 5 6 7 8 ]

# creates random 100x30 matrix
A=rand(100,30)

# creates vector with 1..n values
b=[1:6]

# creates a vector from 1 to 0.98 with steps of 0.01
t=[1:0.01:0.98]

# creates column vector ( 3x1 )
c=[1; 2; 3]

# creates from another
	d=[1 2;3 4; 5 6]

	# creates another from first column
	X=(:,1)							

	# creates another from second column
	y=(:,2)							

# creates matrix adding column of ones from another existing matrix
X=[ ones(3,1), data(:,1) ]

# identity ( diagonal matrix )
eye(4)

# fills square matrix with ones
ones(3)

# fills mxn matrix with ones
ones(3,2)

magic(3)

hist(A)

help
help find


Operations
--------------------------------------------

A * B			% multiplies matrix
A ./ 3		% divides each matrix element
A .^ 2		% squares each matrix element
A ./ B      % divides each matrix element A with the correspond B element

A . * eye(9)  % multiplies each element of A and since eye(Identity matrix) 
                only have 1's on its diagonal it creates a diagonal matrix

# element-wise reciprocal
1 ./ v				% divides 1 between each v element

log(v)				% element-wise log v
exp(v)
abs(v)

-v						% negatives of each v elemnt 

A'						% transpose
max(v)				% maximum vector value
[val,ind]=max(A)		% val and index of max value

max(A)				% max value of each column
max(A,[],1)			% max per column
max(A,[],2)			% max per row
max(A(:))			% returns maximum item of the whole matrix

a < 3					% elemnt-wise compare against 3 return 1 or 0 for each item

find( a < 3 )		% returns index of columns where element meets the condition

sum(a)				% returns total sum of all elements
prod(a)		
sum(A,1)				% returns vector with sum of each matrix column	
sum(A,2)				% returns vector with sum of each matrix row

sum(sum(A . * eye(9))) 		% returns total sum of diagonal
sum(sum(A . * flipud(eye(9)))) 		% returns total sum of the opposite diagonal

floor(a)				% rounds to floor each item
ceil(a)

A(:)					% returns matrix as vector mx1

flipud(eye(9))		% returns Identity matrix with diagonal flipped ( the opposite )

pinv(A)				% inverse matrix
pinv(A) * A			% inverse * A returns Identity matrix



Plotting
--------------------------------------------

# creates vector, function and plot with red colour
	t=[1:0.01:0.98];
	y=sin(2 * pi * 4 * t);
	plot(y,t, 'r' )


hold on; 		% mantain plot open to add more graphics
close;			% close plot 

save -dpng myfig.png			% save plot

legend 

close;
figure(1); plot(t,y1);		% plot in one window
figure(2); plot(t,y2);		% plots plot in another window

# subdivides figure into 2 zones and draws plot to each one
	subplot(1,2,1);
	plot(t,y1);
	subplot(1,2,2);
	plot(t,y2);




