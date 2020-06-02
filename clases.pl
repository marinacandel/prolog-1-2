familia(
    persona(
        [tomas,garcia,perez],
        fecha(7,mayo,1960),
        trabaja(profesor,60)), %->papa
    persona(
        [ana,lopez,ruiz],
        fecha(10,marzo,1962),
        trabaja(medica,90)),   %->mama
        [
        persona([juan,garcia,lopez] ,fecha(5, enero,1980) ,estudiante),
        persona([maria,garcia,lopez],fecha(12,abril,1992) ,estudiante)
        ] %->[]hijos
        ).%papa(juan,pedro).
familia(
    persona(
        [jose,perez,ruiz],
        fecha(6, marzo, 1963),
        trabaja(pintor,120)
           ),
    persona(
        [luisa,galvez,perez],
        fecha(12,mayo,1964),
        trabaja(medica,90)
           ),
        [
        persona([juan_luis,perez,perez],fecha(5,febrero,1990),estudiante),
        persona([maria_jose,perez,perez],fecha(12,junio,1990),estudiante),
        persona([jose_maria,perez,perez],fecha(5,julio,1990),estudiante)
        ]
        ).
familia(
    persona(
        [pedro,soliz,mamani],
        fecha(15,abril,1989),
        trabaja(policia,50)
    ),
    persona(
        [sonia,postelo,erquicia],
        fecha(23,febrero,1995),
        estudiante
    ),
    []
).
/* total de sueldos por dia de padres **/
total:-write("funciona"),nl,
   findall(G,familia(persona(_,_,trabaja(_,G)),_,_),L),
   suma(L,T),
   write("La suma total de sueldos de padres es "),
   write(T).
%caso basico, detiene la recursividad
suma([],0).
%suma(A,R):-length(A)H<=0,R is 0.
%caso general
suma([L|B],R):-
    suma(B,R1),R is L+R1.
% L =60 ,B=[120,50]
/*saber si pertenece a una familia como hijo*/
soyhijo(X):-familia(_,_,Hijos),member(X,Hijos).

/* Mostrar los padres que ganen >90 */
padresGanen(P):-
    familia(persona([P,_,_],_,trabaja(_,G)),_,_),G >= 60.
personas(X):-
    soyhijo(X);
    familia(X,_,_);
    familia(_,X,_).
fecha_nac(persona(_,Y,_),Y).
separaNombre(persona(N,_,_),N).
/*lista los que son menos a 1990*/
lista:-personas(X),fecha_nac(X,fecha(_,_,A�o)),A�o<1990,
    separaNombre(X,T),write(T).
/*promedio sueldo por familia*/
promFa:-
   familia(persona(_,_,trabaja(_,P)),_,_),
   familia(_,persona(_,_,trabaja(_,M)),_),
   X is (P+M)/2,
   write("Promedio de sueldos de familia es "),
   write(X),nl.
lPromFam:-
   findall(_,promFa,_).
/*promedio hijos por familia*/
promHijos:-
    findall(_,familia(_,_,_),L),
  prom(L,T),
   write("La cantidad de hijos es "),
   write(T).
prom([],0).
prom([L|B],R):-
    prom(B,R1),R is 1+R1.
/*lPromHijos:-
    findall(_,promHijos,_).*/

















