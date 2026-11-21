empresa(sep_tech,5,2,1,[pon_punto_al_final_sa]).
empresa(ssii_consulting,70,10,7,[]).
empresa(pon_punto_al_final_sa,10,6,1,[sep_tech,nube_norte]).
empresa(fnc_io,10,5,2,[analistas_gutierrez]).
empresa(analistas_gutierrez,18,9,1,[fnc_io]).
empresa(nube_norte,16,4,1,[pon_punto_al_final_sa]).
empresa(datos_sur,16,6,1,[redes_vega]).
empresa(redes_vega,14,8,1,[datos_sur]).
empresa(bio_lumen,3,5,1,[]).

acuerdos([],_).
acuerdos([Emp | Res],B) :- empresa(Emp,Ingre,Gasto,_,_), Bemp is Ingre - Gasto, B + Bemp =< 15, acuerdos(Res,B).
 
startup_puntera(E) :- empresa(E,Ingre,Gasto,Sede,Aso), Sede == 1, B is Ingre - Gasto, B =< 10, acuerdos(Aso,B).

startups_punteras(L) :- findall(E,startup_puntera(E),L).

mayor_empresa(E1,B1,_,B2,E1,B1) :- B1 >= B2, !.
mayor_empresa(_,B1,E2,B2,E2,B2) :- B1 < B2. 

mejor_empresa_lista([E],E,B) :- !, empresa(E,Ingre,Gasto,_,_), B is Ingre - Gasto.
mejor_empresa_lista([E1|Res],Em,Bm) :- mejor_empresa_lista(Res,E2,B2), empresa(E1,Ingre,Gasto,_,_), B1 is Ingre - Gasto, mayor_empresa(E1,B1,E2,B2,Em,Bm).

mejor_startup(E, B) :- startups_punteras(L), mejor_empresa_lista(L,E,B).  


