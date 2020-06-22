/*--------------------
Triples of singular moduli with rational product
Guy Fowler
-----------------------*/

/*-------------------
Scripts for Section 4
--------------------*/

/*---------------------
References: 
[ABPM15] B. Allombert, Yu. Bilu and A. Pizarro-Madariaga, CM-points on straight lines, in Analytic Number Theory, 2015, pp.1--18.

Notes:
Upper bounds for the discriminants of a given class number h may be computed in Sage using the function cm_orders(h).
All functions run in <1 min (approx) unless noted otherwise.
-----------------------*/

/*--------------------
Instructions 

Run elimall() to prove Theorem 1.2.

The function elimall() finds all triples Delta=(Delta_1, Delta_2, Delta_3) of discriminants satisfying one of the 
conditions listed at the beginning of Section 4, and then for each such triple Delta tests if there are any 
corresponding triples (x_1, x_2, x_3) of pairwise distinct singular moduli with x_1*x_2*x_3 \in \Q and disc(x_i) = Delta_i for i=1,2,3.

Output: 0 if for some such Delta there is such a triple; 1 otherwise (i.e. if Theorem 1.2 holds).

Caution: run time of elimall() is approximately 12 hours on a standard laptop computer with 2.5 GHz Intel Core 
i5-7200U processor and 8GB RAM. PARI maximum stack size should be set at 600MB or above.
------------------------*/


/*---------------------
Scripts for the proof of Theorem 1.2
-----------------------*/

/*----------------------
General scripts on discriminants 
-----------------------*/

/*--------------------
list of discriminants up to n
input: positive integer n
output: discriminants Delta with abs(Delta) \leq n
---------------------*/
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

/*---------------------------
list of discriminants up to n with class number at least h
input: n, h positive integers
output: discriminants Delta with abs(Delta) \leq n and h(Delta) \geq h
------------------------------*/
deltas_ge_h(n,h)=
{
my(u,v,w,m,j);

u=deltas(n);
m=length(u);
v=vector(n,i,0);
j=1;

for(i=1,m,
if(qfbclassno(u[i])>=h, 
v[j]=u[i];
j=j+1;
);
);

w=vector(j-1,i,0);
w=v[1..j-1];

return(w);
}

/*-----------------------------
list of discriminants up to n with class number at least k and at most h
input: n, h, k positive integers
output: discriminants Delta with abs(Delta) \leq n and k \leq h(Delta) \leq h
--------------------------------*/
deltas_ge_le_h(n,k,h)=
{
my(u,v,w,m,j);

u=deltas(n);
m=length(u);
v=vector(m,i,0);
j=1;

for(i=1,m,
if(qfbclassno(u[i])<=h&&qfbclassno(u[i])>=k, 
v[j]=u[i];
j=j+1;
);
);

w=vector(j-1,i,0);
w=v[1..j-1];

return(w);
}

/*-----------------------------
list of discriminants up to n with class number exactly h
input: n, h positive integers
output: discriminants Delta with abs(Delta) \leq n and h(Delta) = h
--------------------------------*/
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

/*------------------
Disriminants to check for the proof of Theorem 1.2

Find the discriminants satisfying one of the conditions listed at beginning of Section 4.
-------------------*/


/*-------------------------------------------
Scripts for 1a
-----------------------------------------*/

/*-----------------------
Discriminants for 1ai
---------------------------*/
deltas1ai()=
{
my(u,n,deltas);

u=deltas_ge_le_h(15667,4,11); /* 15667 hardcode upper bound for discriminants of class number \leq 11 */
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1aii
---------------------------*/
deltas1aii()=
{
my(u,n,deltas);

u=deltas_ge_le_h(30339,12,13);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1aiii
---------------------------*/
deltas1aiii()=
{
my(u,n,deltas);

u=deltas_ge_le_h(4124,14,15);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1aiv
---------------------------*/
deltas1aiv()=
{
my(u,n,deltas);

u=deltas_ge_le_h(1045,16,17);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1av
---------------------------*/
deltas1av()=
{
my(u,n,deltas);

u=deltas_ge_le_h(488,18,19);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1avi
---------------------------*/
deltas1avi()=
{
my(u,n,deltas);

u=deltas_ge_h(334,20);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/* ---------------------------
Scripts for 1bi
----------------------------- */

/* ----------------
Discriminants corresponding to fields L where L=\Q(x_1)=\Q(x_2) \neq \Q for singular moduli x_1, x_2 of 
distinct fundamental discriminants. Source: Table 4.1 of ABPM15
----------------*/

ListA=
{
[[-24,-32,-64,-88],[-36,-48],[-15,-20,-35,-40,-60,-75,-100,-115,-235],
[-52,-91,-403],[-51,-187],[-96,-192,-288],[-180,-240],[-195,-520,-715],[-120,-160,-280,-760],[-340,-595],[-480,-960]];
}

/*-----------------------
Discriminants for 1bi
------------------*/

deltas1bi()=
{
my(l,v,n,delta1,delta2,delta3);

l=length(ListA);
v=[];

for(i=1,l,

n=length(ListA[i]);

for(j=1,n-1,
for(k=j+1,n,
for(r=j,n,

delta1=ListA[i][k];
delta2=ListA[i][j];
delta3=ListA[i][r];

v=concat(v,[[delta1,delta2,delta3]]);

););););

return(v);
}



/* ---------------------
Scripts for 1bii
---------------------- */

/* ------------------
Discriminants satisfying additional conditions on Delta3 in 1bii
input: list of discriminants
output: sublist of those discriminants which are 1 mod 8 and such that 4 * them is also a discriminant of the same class number (``good'')
---------------------- */

gooddelt(v)=
{
my(u,w,n,i,j);

n=length(v);
w=vector(n,i,0);
j=1;

for(i=1,n,
if(Mod(v[i],8)==1&&qfbclassno(4*v[i])==qfbclassno(v[i]),
w[j]=v[i];
j=j+1;););

u=vector(j-1,i,0);
u=w[1..j-1];
return(u);
}

/*---------------
Discriminants for 1biiA
----------------*/

deltas1biiA()=
{
my(u1,u2,u3,u4,w,deltas,n);

u1=deltas_ge_le_h(907,2,3); /* 907 hardcode upper bound for discriminants of class number \leq 3 */
u2=deltas_ge_le_h(367,4,5);
u3=deltas_ge_le_h(163,6,7);
u4=deltas_ge_h(93,8);

w=concat(u1,concat(u2,concat(u3,u4)));

deltas=gooddelt(w);

n=length(deltas);

return(vector(n,i,[4*deltas[i],deltas[i],deltas[i]]));
}


/*---------------
Discriminants for 1biiB
----------------*/

deltas1biiB()=
{
my(u1,u2,u3,u4,u5,w,deltas,n);

u1=deltas_ge_le_h(907,2,3); /* 907 hardcode upper bound for discriminants of class number \leq 3 */
u2=deltas_ge_le_h(5781,4,5);
u3=deltas_ge_le_h(650,6,7);
u4=deltas_ge_le_h(192,8,9);
u5=deltas_ge_h(92,10);

w=concat(u1,concat(u2,concat(u3,concat(u4,u5))));

deltas=gooddelt(w);

n=length(deltas);

return(vector(n,i,[4*deltas[i],deltas[i],4*deltas[i]]));
}



/*-----------------
Scripts for 2b
-------------------*/

/*-----------------
Scripts for 2bi
-------------------*/

/*---------------
Discriminants for 2biAI
---------------*/

deltas2biAI()=
{
my(deltas,v,n);

deltas=[];

for(i=2,9,

v=deltas_eq_h(10627,i); /* 10627 hardcoded upper bound for all discriminants with class number \leq 9*/

n=length(v);

for(j=1,n,
if((Mod(v[j],4)==0&&(Mod((9/4)*v[j],4)==0||Mod((9/4)*v[j],4)==1))&&qfbclassno((9/4)*v[j])==2*i,
deltas=concat(deltas,[[(9/4)*v[j],(9/4)*v[j],v[j]]]);
);
);
);

return(deltas);
}

/*-------------
Discriminants for 2biAII-V
--------------*/

deltas2biArest()=
{
my(u1,u2,u3,u4,w,n,v,k,u);

u1=deltas_ge_le_h(5076,10,11);
u2=deltas_ge_le_h(1430,12,13);
u3=deltas_ge_le_h(255,14,15);
u4=deltas_ge_h(164,16);


w=concat(u1,concat(u2,concat(u3,u4)));

n=length(w);
v=vector(n,i,0);
k=1;

for(i=1,n,
if((Mod(w[i],4)==0&&(Mod((9/4)*w[i],4)==0||Mod((9/4)*w[i],4)==1))&&qfbclassno((9/4)*w[i])==2*qfbclassno(w[i]),
v[k]=[(9/4)*w[i],(9/4)*w[i],w[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=v[1..k-1];

return(u);
}

/*---------------
Discriminants for 2biBI
---------------*/

deltas2biBI()=
{
my(deltas,v,n);

deltas=[];

for(i=2,9,

v=deltas_eq_h(10627,i); /* 10627 hardcoded upper bound for all discriminants with class number \leq 9 */

n=length(v);

for(j=1,n,
if(qfbclassno(4*v[j])==2*i,
deltas=concat(deltas,[[4*v[j],4*v[j],v[j]]]);
);
);
);

return(deltas);
}

/*-----------------
Discriminants for 2biBII-V
-----------------*/

deltas2biBrest()=
{
my(u0,u1,u2,u3,w,n,v,k,u);

u0=deltas_ge_le_h(650,10,11);
u1=deltas_ge_le_h(317,12,13);
u2=deltas_ge_le_h(236,14,15);
u3=deltas_ge_h(129,16);

w=concat(u0, concat(u1,concat(u2,u3)));

n=length(w);
v=vector(n,i,0);
k=1;

for(i=1,n,
if(qfbclassno(4*w[i])==2*qfbclassno(w[i]),
v[k]=[4*w[i],4*w[i],w[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=v[1..k-1];

return(u);
}

/*---------------
Discriminants for 2biCI
---------------*/

deltas2biCI()=
{
my(deltas,v,n);

deltas=[];

for(i=2,7,

v=deltas_eq_h(5923,i); /* 5923 hardcoded upper bound for all discriminants with class number \leq 7*/

n=length(v);

for(j=1,n,
if((Mod(9*v[j],4)==0||Mod(9*v[j],4)==1)&&qfbclassno(9*v[j])==2*i,
deltas=concat(deltas,[[9*v[j],9*v[j],v[j]]]);
);
);
);

return(deltas);
}

/*---------------
Discriminants for 2biCII-III
---------------*/

deltas2biCrest()=
{
my(u1,u2,w,n,v,k,u);

u1=deltas_ge_le_h(255,8,9);
u2=deltas_ge_h(85,10);


w=concat(u1,u2);

n=length(w);
v=vector(n,i,0);
k=1;

for(i=1,n,
if((Mod(9*w[i],4)==0||Mod(9*w[i],4)==1)&&qfbclassno(9*w[i])==2*qfbclassno(w[i]),
v[k]=[9*w[i],9*w[i],w[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=v[1..k-1];

return(u);
}

/*---------------
Discriminants for 2biDI
---------------*/

deltas2biDI()=
{
my(deltas,v,n);

deltas=[];

for(i=2,7,

v=deltas_eq_h(5923,i); /* 5923 hardcode upper bound for discriminants with class number \leq 7 */

n=length(v);

for(j=1,n,
if(qfbclassno(16*v[j])==2*i,
deltas=concat(deltas,[[16*v[j],16*v[j],v[j]]]);
);
);
);

return(deltas);
}

/*-----------------
Discriminants for 2biDII-III
-----------------*/

deltas2biDrest()=
{
my(u1,u2,w,n,v,k,u);

u1=deltas_ge_le_h(79,8,9);
u2=deltas_ge_h(52,10);

w=concat(u1,u2);

n=length(w);
v=vector(n,i,0);
k=1;

for(i=1,n,
if(qfbclassno(16*w[i])==2*qfbclassno(w[i]),
v[k]=[16*w[i],16*w[i],w[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=v[1..k-1];

return(u);
}

/*---------------
Scripts for 2bii
---------------*/

/*---------------
Scripts for 2biiA
-----------------*/

/*----------------
List of discriminants with class number \geq 4 and class group annihilated by 2 (i.e. possible listed Delta1)
Source: Table 2.1 of ABPM15
-------------------*/
 ListB=
 {
 [-3*8^2,-7*8^2,-8*6^2,-15*4^2,-15*8^2,-20*3^2,-24*2^2,-35*3^2,-40*2^2,
 -84,-88*2^2,-120,-120*2^2,-132,-168,-168*2^2,-195,-228,-232*2^2,
 -280,-280*2^2,-312,-312*2^2,-340,-372,-408,-408*2^2,-420,-435,
 -483,-520,-520*2^2,-532,-555,-595,-627,-660,-708,-715,
 -760,-760*2^2,-795,-840,-840*2^2,-1012,-1092,-1155,-1320,-1320*2^2,
 -1380,-1428,-1435,-1540,-1848,-1848*2^2,-1995,-3003,-3315,-5460]
 };
 
 /*------------------
 Class numbers corresponding to singular moduli with discriminants in ListB
 Note that they are all in {4,8,16}
 --------------------*/
 ListC=qfbclassno(ListB);
 
 
 /*-----------------
 Number fields corresponding to singular moduli with discriminants in ListB
 -----------------*/
 fields2biii()=
 {
 my(n,v,f,L);
 
 n=length(ListB);
 v=vector(n,i,0);
 
 for(i=1,n,
 f=polclass(ListB[i],0,'x);
 f=polredbest(f);
 L=nfinit(f);
 v[i]=L;
 );
 
 return(v);
 
 }
 
 
 /*-----------------
Discriminants for 2biiA
Run time approx. 6 mins
 ------------------*/
 
 deltas2biiA()=
 {
 my(n,deltas,h,d3,m);
 
 n=length(ListB);
 deltas=[];
 
 for(i=1,n,
 
 h=ListC[i];
 f=polclass(ListB[i]);
 d3=deltas_eq_h(7987,h/2); /*7987 hard code upper bound for discriminants with class number \leq 8, 
                                                since h3 \leq 8 as every delta in ListA has class number \leq 16*/
 m=length(d3);
 
 u=vector(m,j,0);
 l=1;
 
 for(k=1,m,
 
 if(nfisincl(polclass(d3[k]),f)==0,
 ,
 u[l]=[ListB[i],ListB[i],d3[k]];
 l=l+1;
 );
 );
 
 w=vector(l,j,0);
w=u[1..l-1];
 
 deltas=concat(deltas,w);
 );
 
 return(deltas);
 }
 
 /*----------------
Scripts for 2biiB
-----------------*/

/*----------------
List of discriminants with class number =2 and class group annihilated by 2 (i.e. possible listed Delta3 not on ListB)
Source: Table 2.1 of ABPM15
-------------------*/
 List2=
 {
 [-3*4^2,-3*5^2,-3*7^2,-4*3^2,-4*4^2,-4*5^2,-7*4^2,-8*2^2,-8*3^2,-11*3^2,
 -15,-15*2^2,-20,-24,-35,-40,-51,-52,-88,-91,-115,-123,-148,
 -187,-232,-235,-267,-403,-427]
 };
 
 /*---------------
Discriminants for 2biiB with h(Delta3)=2
 -----------------*/
 deltas2biiB2()=
{
my(n,v,a,m,u,deltas,w);

n=length(List2);
v=vector(n,i,polclass(List2[i]));
a=deltas_eq_h(1555,4); /* 1555 hardcode upper bound for discriminants with class number = 4 */

m=length(a);
u=vector(m,i,polclass(a[i]));
deltas=[];

for(i=1,n,
for(j=1,m,
w=[];
if(nfisincl(v[i],u[j])==0,,w=[[a[j],a[j],List2[i]]]);

deltas=concat(deltas,w);
);
);

return(deltas);

}

/*----------------
List of discriminants with class number =4 and class group annihilated by 2 (i.e. possible listed Delta3 of class number 4)
Source: Table 2.1 of ABPM15
-------------------*/

List4()=
{
my(n,v,j,u);

n=length(ListB);
v=vector(n,i,0);
j=1;

for(i=1,n,

if(qfbclassno(ListB[i])==4,
v[j]=ListB[i];
j=j+1;
);
);

u=vector(j-1,i,0);
u=v[1..j-1];

return(u);
}


/*---------------
Discriminants for 2biiB with h(Delta3)=4
 -----------------*/
 deltas2biiB4()=
{
my(b,n,v,a,m,u,deltas,w);

b=List4();
n=length(b);
v=vector(n,i,polclass(b[i]));
a=deltas_eq_h(7987,8); /* 7987 hardcode upper bound for discriminants with class number =8 */

m=length(a);
u=vector(m,i,polclass(a[i]));
deltas=[];

for(i=1,n,
for(j=1,m,
w=[];
if(nfisincl(v[i],u[j])==0,,w=[[a[j],a[j],b[i]]]);

deltas=concat(deltas,w);
);
);

return(deltas);

}

/*----------------
List of discriminants with class number =8 and class group annihilated by 2 (i.e. possible listed Delta3 of class number 8)
Source: Table 2.1 of ABPM15
-------------------*/
List8()=
{
my(n,v,j,u);

n=length(ListB);
v=vector(n,i,0);
j=1;

for(i=1,n,

if(qfbclassno(ListB[i])==8,
v[j]=ListB[i];
j=j+1;
);
);

u=vector(j-1,i,0);
u=v[1..j-1];

return(u);
}


/*---------------
 Discriminants for 2biiB with h(Delta3)=8
 Run time approx. 21 mins
 -----------------*/
deltas2biiB8()=
{
my(b,n,v,a,m,u,deltas,w);

b=List8();
n=length(b);
v=vector(n,i,polclass(b[i]));
a=deltas_eq_h(35275,16); /* 35275 hardcode upper bound for discriminants with class number = 16*/

m=length(a);
u=vector(m,i,polclass(a[i]));
deltas=[];

for(i=1,n,
for(j=1,m,
w=[];
if(nfisincl(v[i],u[j])==0,,w=[[a[j],a[j],b[i]]]);

deltas=concat(deltas,w);
);
);

return(deltas);

}


/*----------------
List of discriminants with class number =16 and class group annihilated by 2 (i.e. possible listed Delta3 of class number 16)
Source: Table 2.1 of ABPM15
-------------------*/
List16()=
{
my(n,v,j,u);

n=length(ListB);
v=vector(n,i,0);
j=1;

for(i=1,n,

if(qfbclassno(ListB[i])==16,
v[j]=ListB[i];
j=j+1;
);
);

u=vector(j-1,i,0);
u=v[1..j-1];

return(u);
}


/*---------------
Discriminants for 2biiB with h(Delta3)=16
Run time approx. 5 hours (CAUTION!)
 -----------------*/
deltas2biiB16()=
{
my(b,n,v,a,m,u,deltas,w);

b=List16();
n=length(b);
v=vector(n,i,polclass(b[i]));
a=deltas_eq_h(164803,32); /* Hardcode upper bound for discriminants with class number = 32 */

m=length(a);
u=vector(m,i,polclass(a[i]));
deltas=[];

for(i=1,n,
for(j=1,m,
w=[];
if(nfisincl(v[i],u[j])==0,,w=[[a[j],a[j],b[i]]]);

deltas=concat(deltas,w);
);
);

return(deltas);

}
 
 
 /*-------------------
 Discriminants for 2biiC
 ---------------------*/
 
 deltas2biiC()=
 {
 return(deltas_ge_h(488,128));
 }
 
 /*---------------------
 Checking discriminants
 
 Scripts to show that possible choices of discriminants have no corresponding singular moduli with rational product.
 (Note that 2biiB must be checked separately.)
 ------------------------*/
 
 /*-----------------
Check whether three elements of a number field have product equal to 1
Input: (L,x,y,z) where x,y,z are elements of a number field L
Output: 1 if xyz=1, 0 otherwise
---------------------*/

testprod(L, x,y,z) =
{
my (u,u0);
x = nfbasistoalg(L,x);
y = nfbasistoalg(L,y); 
z=nfbasistoalg(L,z);
u = ((x*y)*z);
u0 = nfbasistoalg(L, 1);
if(u==u0,return(1),return(0));
}

/*----------------------------
Check whether one of the above found triples of discriminants (NOT IN 2biiB) has an associated triple of pairwise distinct singular moduli with rational product
Input: (Delta1,Delta2,Delta3) (when Delta1=Delta2=Delta3, require that their class number is \geq 3)
Output: 1 if x_1*x_2*x_3 is rational for some pairwise distinct choice of x_i \in {singular moduli of discriminant Delta_i}, 0 otherwise

Caution: cannot apply testtrip() to an arbitrary triple of discriminants because the number field L it chooses will not necessarily be right.
		Must only apply it to discriminants satisfying one of the conditions listed in Section 4 (and not in 2biiB).
-------------------------------*/
testtrip(triple)=
{
my([Delta1,Delta2,Delta3]=triple);
my(f1,f2,f3,L,x,y,z,G,n,u,v,w,m);

f1=polclass(Delta1,0,'y);
f2=polclass(Delta2,0,'y);
f3=polclass(Delta3,0,'y);

if(quaddisc(Delta1)==quaddisc(Delta2)&&quaddisc(Delta1)==quaddisc(Delta3),
L=subst(rnfequation(polredbest(f1),'x^2-Delta1),'x,'y),
L=f1);

L=nfinit(polredbest(L));
x=nfroots(L,subst(f1,'y,'x));
y=nfroots(L,subst(f2,'y,'x));
z=nfroots(L,subst(f3,'y,'x));

G=nfgaloisconj(L);
n=length(G);

for(i=if(Delta1==Delta2,2,1),length(y),
for(j=if(Delta2==Delta3,i+1,if(Delta1==Delta3,2,1)),length(z),

m=0;

for(k=1,n,
u=nfgaloisapply(L,G[k],x[1]);
v=nfgaloisapply(L,G[k],y[i]);
w=nfgaloisapply(L,G[k],z[j]);

if(testprod(L,x[1]/u,y[i]/v,z[j]/w)==1,m=m+1,break());
);

if(m==n,return(1));

);
);


return(0);
}

/*-------------------
Check whether a list of triples of discriminants found above (and NOT IN 2biiB) has any associated triple of pairwise distinct singular moduli with rational product
Input: vector of triples of discriminants [Delta1,Delta2,Delta3]
Output: 1 if testtrip([Delta1,Delta2,Delta3])=0 for all [Delta1,Delta2,Delta3] in the list; 
		otherwise prints the sublist comprising those [Delta1,Delta2,Delta3] with testtrip([Delta1,Delta2,Delta3])=1
		
Caution: cannot apply testall() to an arbitrary list of triples of discriminants because testtrip() may not be applicable for such triples.
		Must only apply it to lists of discriminants satisfying one of the conditions listed in Section 4 (and not in 2biiB).
---------------------*/

testall(v)=
{
my(l,k);

l=length(v);
k=0;

for(i=1,l,

if(testtrip(v[i])==1,print(v[i]),k=k+1);

);

if(k==l,return(1),);
}

/*----------------------
Scripts to check 2biiB
-----------------------*/

/*----------------------------
Check whether a triple of discriminants in 2biiB has an associated triple of pairwise distinct singular moduli with rational product
Input: (Delta1,Delta2,Delta3) in 2biiB
Output: 1 if x_1*x_2*x_3 is rational for some pairwise distinct choice of x_i \in {singular moduli of discriminant Delta_i}, 0 otherwise

Caution: cannot apply testtrip2biiB() to an arbitrary triple of discriminants because the number field L it chooses will not necessarily be right.
		Must only apply it to discriminants satisfying one of the conditions of 2biiB.
-------------------------------*/
testtrip2biiB(triple)=
{
my([Delta1,Delta2,Delta3]=triple);
my(f1,f2,f3,L,x,y,z,G,n,u,v,w,m);

f1=polclass(Delta1,0,'y);
f2=polclass(Delta2,0,'y);
f3=polclass(Delta3,0,'y);


L=subst(rnfequation(polredbest(f1),'x^2-Delta1),'x,'y);


L=nfinit(polredbest(L));
x=nfroots(L,subst(f1,'y,'x));
y=nfroots(L,subst(f2,'y,'x));
z=nfroots(L,subst(f3,'y,'x));

G=nfgaloisconj(L);
n=length(G);

for(i=if(Delta1==Delta2,2,1),length(y),
for(j=if(Delta2==Delta3,i+1,if(Delta1==Delta3,2,1)),length(z),

m=0;

for(k=1,n,
u=nfgaloisapply(L,G[k],x[1]);
v=nfgaloisapply(L,G[k],y[i]);
w=nfgaloisapply(L,G[k],z[j]);

if(testprod(L,x[1]/u,y[i]/v,z[j]/w)==1,m=m+1,break());
);

if(m==n,return(1));

);
);


return(0);
}

/*-------------------
Check whether a list of triples of discriminants in 2biiB has any associated triple of pairwise distinct singular moduli with rational product
Input: vector of triples of discriminants [Delta1,Delta2,Delta3] in 2biiB
Output: 1 if testtrip2biiB([Delta1,Delta2,Delta3])=0 for all [Delta1,Delta2,Delta3]; 
		otherwise list of [Delta1,Delta2,Delta3] with testtrip2biiB([Delta1,Delta2,Delta3])=1
		
Caution: cannot apply testall2biiB() to an arbitrary list of triples of discriminants because testtrip2biiB() may not be applicable for such triples.
		Must only apply it to lists of discriminants satisfying the conditions of 2biiB.
---------------------*/

testall2biiB(v)=
{
my(l,k);

l=length(v);
k=0;

for(i=1,l,

if(testtrip2biiB(v[i])==1,print(v[i]),k=k+1);

);

if(k==l,return(1),);
}

/*------------------
Run entire program
--------------------*/

/*---------------------
Find and eliminate all possible discriminants satisfying one of the conditions listed in Section 4,
and thereby complete the proof of Theorem 1.2.
Output: 1 if no possible triple of singular moduli corresponding to one of the possible triples of discriminats has rational product; 
		otherwise outputs 0.

Caution: takes a long time to run, c.12 hours
------------------------*/

elimall()=
{
my(u,a,w,b);

u=deltas1ai();
u=concat(u,deltas1aii());
u=concat(u,deltas1aiii());
u=concat(u,deltas1aiv());
u=concat(u,deltas1av());
u=concat(u,deltas1avi());

u=concat(u,deltas1bi());
u=concat(u,deltas1biiA());
u=concat(u,deltas1biiB());

u=concat(u,deltas2biAI());
u=concat(u,deltas2biArest());
u=concat(u,deltas2biBI());
u=concat(u,deltas2biBrest());
u=concat(u,deltas2biCI());
u=concat(u,deltas2biCrest());
u=concat(u,deltas2biDI());
u=concat(u,deltas2biDrest());

u=concat(u,deltas2biiA());
/*2biiB must be handled separately*/
u=concat(u,deltas2biiC());

if(testall(u)==1,a=1,a=0);

/*Now we handle 2biiB separately*/

w=deltas2biiB2();
w=concat(w,deltas2biiB4());
w=concat(w,deltas2biiB8());
w=concat(w,deltas2biiB16());

if(testall2biiB(w)==1,b=1,b=0);

if(a*b==1,return(1),return(0));

}

