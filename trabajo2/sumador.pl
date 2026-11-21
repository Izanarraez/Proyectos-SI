sumador([], _, []).
sumador([ [] | Cola ], Y, [ [] | Resto ]) :- !, sumador(Cola, Y, Resto).
sumador([ [Li|Lic] | Cola], Y, [Lir | Resto ]) :- !, sumador([Li|Lic], Y, Lir), sumador(Cola, Y, Resto).
sumador([X|Cola], Y, [S|Resto]) :- number(X), !, S is X + Y, sumador(Cola, Y, Resto).
sumador([X|Cola], Y, [X|Resto]) :- sumador(Cola, Y , Resto).

suma_numeros([],0).
suma_numeros([ [] | Cola], Y) :- !, suma_numeros(Cola, Y).
suma_numeros([ [Li|Lic] | Cola], Y) :- !, suma_numeros([Li|Lic], Ss), suma_numeros(Cola, Sc), Y is Ss + Sc.
suma_numeros([X|Cola],Y) :- number(X), !, suma_numeros(Cola,S), Y is X + S.
suma_numeros([_|Cola], Y) :- suma_numeros(Cola, Y).
