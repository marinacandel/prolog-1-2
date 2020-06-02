familia(
    persona(
            [tomas,garcia,perez],
            fecha(7,mayo,1960),
            trabaja(profesor,60)), %->papa
    persona(
        [ana,lopez,ruiz],
        fecha(10,marzo,1962),
        trabaja(medico,90)), %->mama
    [
    persona([juan,garcia,lopez],fecha(5, enero,1980),estudiante),
    ]
    %->[]hijos
).
%papa(juan,pedro).
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
    persona([jose_maria,perez,perez],fecha(5,julio,1990),estudiante),
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
/*total de sueldos por dia de padre**/
total:-write("funciona"),nl,
    findall(G,familia(persona(_,_,trabaja(_,G)),_,_),L),
    suma(L,T),
    write("la suma total de sueldo de padres es"),
    write(L).
%caso basico detiene la recursividad
suma([],0).
%suma(A,R):-H is length(A),H<=0,R is0.
%caso general
suma([L|B],R):-
    suma(B,R1),R is L+R1.
% L=60,E=(120,50)
/*saber si pertenece a una familia como hijo*/
/*soyhijo(A,F):-familia(F,_,[persona(A,_,_)]).*/
soyhijo(X):- familia(_,_,Hijos),member(X,Hijos).

/* Mostrar los padres que ganen >90 */
sueldo(X):-
    familia(persona([X,_,_],_,trabaja(_,G)),_,_),G<=60;
    familia(_,persona([P,_,_],_,trabaja(_,G)),_),G<=60.

personas(X):-
    soyhijo(X);
    familia(X,_,_);
    familia(_,X,_).

fecha_nac(persona(_,Y,_),Y).

separaNombre(persona(N,_,_),N).

lista:-personas(X),fecha_nac(X,fecha(_,_,Año)),Año<1990,separaNombre(X,T),write(T).



















