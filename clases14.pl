/*suma de numeros pares de una lista*/
dividir([ ],[ ],[ ]).
dividir([L|R],[L|P],I):-
    E is L mod 2,
    E=0,
    dividir(R,P,I),!.
suma([],0).
suma([L|B],R):-
    suma(B,R1),R is L+R1.
sumarPares(L):-
   dividir(L,P,_),
    suma(P,T),
   write("La suma total de pares es "),
   write(T).
/*numero maximo de una lista*/
maximo([R], R).
maximo([X|B], R):-
    maximo(B, T),
    (X > T -> R = X ; R = T).
/*genera los n primeros elementos*/
genera(V).
genera(V):-
    E is V mod 2,E=0,par(),!.
 genera(V,[]):-
    E is V mod 2,E=0,impar(),!.
    par():-
    write("par").
    impar():-
    write("par").










dividir([L|R],P,[L|I]):-C is L mod 2,C>0,dividir(R,P,I),!.



