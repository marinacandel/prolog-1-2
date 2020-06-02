/*suma de numeros pares de una lista*/
dividir([ ],Pares).
dividir([L|R],[L|P],I):-E is L mod 2,E=0,dividir(R,P,I),!.
suma([],0).
suma([L|B],R):-
    suma(B,R1),R is L+R1.
/*numero maximo de una lista*/
