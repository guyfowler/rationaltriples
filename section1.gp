/*--------------------
Triples of singular moduli with rational product
Guy Fowler
-----------------------*/

/*--------------------
Scripts for Section 1
---------------------*/

/*------------------
Instructions

Run whichrat() for the list of all the non-zero rational numbers which are the product 
of three singular moduli, corresponding to the cases (1)-(3) of Theorem 1.2. List is 
sorted in increasing order, without duplicates.

Run time is <10 seconds.
--------------------*/

/*-------------------
Scripts on discriminants
---------------------*/

/*--------------------------------------------------------------------
list of discriminants up to n
input: positive integer n
output: discriminants Delta with abs(Delta) \leq n
----------------------------------------------------------------------*/
deltas(n)=
{
my(v,j,u);

v=vector(n,i,0);
j=1;

for(i=1,n,

if(Mod(-i,4)==0||Mod(-i,4)==1,
v[j]=-i;
j=j+1;
);
);

u=vector(j-1,i,0);
u=v[1..j-1];

return(u);
}

/*--------------------------------------------------------------------
list of discriminants up to n with class number exactly h
input: n, h positive integers
output: discriminants Delta with abs(Delta) \leq n and h(Delta) = h
----------------------------------------------------------------------*/
deltas_eq_h(n,h)=
{
my(u,v,w,m,j);

u=deltas(n);
m=length(u);
v=vector(m,i,0);
j=1;

for(i=1,m,
if(qfbclassno(u[i])==h, 
v[j]=u[i];
j=j+1;
);
);

w=vector(j-1,i,0);
w=v[1..j-1];

return(w);
}

/*-----------------------
Scripts to find the rational products
------------------------*/

/*-------------------------
Which non-zero rational numbers arise (no duplicates)
--------------------------*/

whichrat()=
{
my(u,v,w,n,m,case1,case2,case3,case1or2,allcase);

/* Discriminants, use sage function cm_orders(h) to obtain upper bounds on discriminants of class number h */
u=deltas_eq_h(163,1); /* discriminants with class number 1 */
v=deltas_eq_h(427,2); /* discriminants with class number 2 */
w=deltas_eq_h(907,3); /* discriminants with class number 3 */

/*Exclude the singular modulus zero */
n=length(u);
u=u[2..n];

/* Preparation */
u=vector(length(u),i,-Vecrev(polclass(u[i]))[1]); /* rational singular moduli */
v=vector(length(v),i,Vecrev(polclass(v[i]))[1]); /* products of pairs of degree 2 conjugate singular moduli */
w=vector(length(w),i,-Vecrev(polclass(w[i]))[1]); /* products of triples of degree 3 conjugate singular moduli */


/* Products arising in Case (1) of Theorem 1.2 */
n=length(u);
case1=[];

for(i=1,n,
	for(j=i,n,
		for(k=j,n,
			case1=concat(case1,u[i]*u[j]*u[k]);
		);
	);
	);
	
	
	case1=vecsort(case1,,8); /* Remove duplicates */

/* Products arising in Case (2) of Theorem 1.2 */
case2=[];
m=length(v);

for(i=1,n,
	for(j=1,m,
	case2=concat(case2,u[i]*v[j]);
	);
	);
	
	case2=vecsort(case2,,8); /* Remove duplicates */
	
/* Products arising in Case (3) of Theorem 1.2 */
	
case3=w;
case3=vecsort(case3,,8); /* Remove duplicates */

/* Products arising in Cases (1) or (2) */

case1or2=concat(case1,case2);
case1or2=vecsort(case1or2,,8); /* Remove duplicates */

/* Products arising in Cases (1), (2), or (3) */

allcase=concat(case1or2,case3);
allcase=vecsort(allcase,,8); /* Remove duplicates */

return(allcase);

}




