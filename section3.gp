/*--------------------
Triples of singular moduli with rational product
Guy Fowler
-----------------------*/

/*-------------------
Scripts for Section 3
--------------------*/

/*---------------
Instructions

Run allbounds() to print all the bounds on discriminants established in Section 3.

Run time is <10 seconds.
----------------*/

/*--------------
allbounds()

Prints a list of all the discriminant bounds established in Section 3
-----------------*/

allbounds()=
{

print("In 1aii abs(Delta) <= "bound1aii());
print("In 1aiii abs(Delta) <= "bound1aiii());
print("In 1aiv abs(Delta) <= "bound1aiv());
print("In 1av abs(Delta) <= "bound1av());
print("In 1avi abs(Delta) <= "bound1avi());

print("In 1biiAII abs(Delta) <= "bound1biiAII());
print("In 1biiAIII abs(Delta) <= "bound1biiAIII());
print("In 1biiAIV abs(Delta) <= "bound1biiAIV());

print("In 1biiBII abs(Delta) <= "bound1biiBII());
print("In 1biiBIII abs(Delta) <= "bound1biiBIII());
print("In 1biiBIV abs(Delta) <= "bound1biiBIV());
print("In 1biiBV abs(Delta) <= "bound1biiBV());

print("In 2biAII abs(Delta) <= "bound2biAII());
print("In 2biAIII abs(Delta) <= "bound2biAIII());
print("In 2biAIV abs(Delta) <= "bound2biAIV());
print("In 2biAV abs(Delta) <= "bound2biAV());

print("In 2biBII abs(Delta) <= "bound2biBII());
print("In 2biBIII abs(Delta) <= "bound2biBIII());
print("In 2biBIV abs(Delta) <= "bound2biBIV());
print("In 2biBV abs(Delta) <= "bound2biBV());

print("In 2biCII abs(Delta) <= "bound2biCII());
print("In 2biCIII abs(Delta) <= "bound2biCIII());

print("In 2biDII abs(Delta) <= "bound2biDII());
print("In 2biDIII abs(Delta) <= "bound2biDIII());

print("In 2biiC Delta <= "bound2biiC());

}

/*----------------
Scripts to compute these bounds
------------------*/

/*---------------
Bound on Delta for 1aii
----------------*/

bound1aii()=
	{
	my(j);
	
	j=0;
	
	while((0.9994*exp(Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))^2<=
	(exp(Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1aiii
----------------*/

bound1aiii()=
	{
	my(j);
	
	j=0;
	
	while((0.9994*exp(Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))^2<=
	(exp(Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1aiv
----------------*/

bound1aiv()=
	{
	my(j);
	
	j=0;
	
	while((0.9994*exp(Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))^2<=
	(exp(Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1av
----------------*/

bound1av()=
	{
	my(j);
	
	j=0;
	
	while((0.9994*exp(Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))^2<=
	(exp(Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/5)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1avi
----------------*/

bound1avi()=
	{
	my(j);
	
	j=0;
	
	while((0.9994*exp(Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))^2<=
	(exp(Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/5)+2079)*(exp(Pi*(j+1)^(1/2)/5)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1biiAII
----------------*/

bound1biiAII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))^2<=
	(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/2)+2079)*(exp(Pi*(j+1)^(1/2)/2)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1biiAIII
----------------*/

bound1biiAIII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))^2<=
	(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/2)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1biiAIV
----------------*/

bound1biiAIV()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))^2<=
	(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1biiBII
----------------*/

bound1biiBII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))*min(4.4*10^(-5),3500*4^(-3)*(j+1)^(-3))<=
	(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/2)+2079)*(exp(2*Pi*(j+1)^(1/2)/3)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1biiBIII
----------------*/

bound1biiBIII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))*min(4.4*10^(-5),3500*4^(-3)*(j+1)^(-3))<=
	(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079)*(exp(2*Pi*(j+1)^(1/2)/3)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1biiBIV
----------------*/

bound1biiBIV()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))*min(4.4*10^(-5),3500*4^(-3)*(j+1)^(-3))<=
	(exp(2*Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079)*(exp(2*Pi*(j+1)^(1/2)/3)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 1biiBV
----------------*/


bound1biiBV()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))*min(4.4*10^(-5),3500*4^(-3)*(j+1)^(-3))<=
	(exp(2*Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079)*(exp(2*Pi*(j+1)^(1/2)/4)+2079),
	j=j+1);
	
	return(j);
}

/*-----------
Bound on Delta for 2biAII
--------------*/

bound2biAII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp((3/2)*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(9/4)^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp((3/2)*Pi*(j+1)^(1/2)/3)+2079)*(exp((3/2)*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079),
	j=j+1);
	
	return(j);
}

/*-----------
Bound on Delta for 2biAIII
--------------*/

bound2biAIII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp((3/2)*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(9/4)^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp((3/2)*Pi*(j+1)^(1/2)/4)+2079)*(exp((3/2)*Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/2)+2079),
	j=j+1);
	
	return(j);
}

/*-----------
Bound on Delta for 2biAIV
--------------*/

bound2biAIV()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp((3/2)*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(9/4)^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp((3/2)*Pi*(j+1)^(1/2)/4)+2079)*(exp((3/2)*Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079),
	j=j+1);
	
	return(j);
}

/*-----------
Bound on Delta for 2biAV
--------------*/

bound2biAV()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp((3/2)*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(9/4)^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp((3/2)*Pi*(j+1)^(1/2)/4)+2079)*(exp((3/2)*Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 2biBII
----------------*/


bound2biBII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*4^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 2biBIII
----------------*/

bound2biBIII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*4^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 2biBIV
----------------*/

bound2biBIV()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*4^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/5)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 2biBV
----------------*/

bound2biBV()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(2*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*4^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp(2*Pi*(j+1)^(1/2)/3)+2079)*(exp(2*Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 2biCII
----------------*/

bound2biCII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(3*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*9^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp(3*Pi*(j+1)^(1/2)/3)+2079)*(exp(3*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/2)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 2biCIII
----------------*/

bound2biCIII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(3*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*9^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp(3*Pi*(j+1)^(1/2)/3)+2079)*(exp(3*Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/2)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 2biDII
----------------*/

bound2biDII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(4*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*16^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp(4*Pi*(j+1)^(1/2)/3)+2079)*(exp(4*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/2)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 2biDIII
----------------*/

bound2biDIII()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(4*Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*16^(-3)*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp(4*Pi*(j+1)^(1/2)/3)+2079)*(exp(4*Pi*(j+1)^(1/2)/3)+2079)*(exp(Pi*(j+1)^(1/2)/3)+2079),
	j=j+1);
	
	return(j);
}

/*---------------
Bound on Delta for 2biiC
----------------*/

bound2biiC()=
{
	my(j);
	
	j=0;
	
	while((0.9994*exp(Pi*(j+1)^(1/2)))*min(4.4*10^(-5),3500*(j+1)^(-3))*min(4.4*10^(-5),3500*(j+1)^(-3))<=
	(exp(Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/4)+2079)*(exp(Pi*(j+1)^(1/2)/5)+2079),
	j=j+1);
	
	return(j);
}














