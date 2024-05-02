% Relaciones familiares
padre(jose, larissa).
padre(jose, hector).
padre(jose, yulibeth).
padre(jose, adahir).
padre(isidro, david).
padre(isidro, gustavo).
padre(martin, lucero).
padre(martin, eduardo).
padre(martin, paola).
padre(raymundo, vanessa).
padre(raymundo, carlos).
padre(raymundo, emily).

padre(marcelino, yadira).
padre(marcelino, noemi).
padre(marcelino, noe).

padre(tomas, emilia).
padre(tomas, olivia).
padre(tomas, leticia).
padre(tomas, graciela).

padre(carmelo, jose).
padre(carmelo, marcelino).


madre(emilia, larissa).
madre(emilia, hector).
madre(emilia, yulibeth).
madre(emilia, adahir).
madre(leticia, lucero).
madre(leticia, eduardo).
madre(leticia, paola).
madre(olivia, david).
madre(olivia, gustavo).
madre(graciela, vanessa).
madre(graciela, carlos).
madre(graciela, emily).
madre(isidra, yadira).
madre(isidra, noemi).
madre(isidra, noe).
madre(elia, olivia).
madre(elia, emilia).
madre(elia, leticia).
madre(elia, graciela).
madre(guadalupe, jose).
madre(guadalupe, marcelino).
padre(gabriel, tomas).
madre(carmen, elia).
padre(manuel, carmelo).
madre(clara, guadalupe).

% hijo o hija  hijo(hector,jose).
hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).

%abuelo o abuela      abuelo(tomas,hector).
abuelo(X, Y) :- padre(X, Z), (padre(Z, Y); madre(Z, Y)).
abuelo(X, Y) :- madre(X, Z), (padre(Z, Y); madre(Z, Y)).
%hermano o hermana   hermano(eduardo,lucero).
hermano(X, Y) :-padre(Z, X), hijo(Y, Z),X\=Y.
hermano(X, Y) :-madre(Z, X), hijo(Y, Z),X\=Y.
%tio o tia        tio(olivia,hector).
tio(X, Y) :- padre(Z, Y), hermano(Z, X).
tio(X, Y) :- madre(Z, Y), hermano(Z, X).
%esposo o esposa esposos(jose,emilia).
esposos(X, Y) :-padre(X, Z), madre(Y, Z).
esposos(X, Y) :-madre(X, Z), padre(Y, Z).
%sobrino o sobrina sobrino(hector,olivia).
sobrino(X,Y) :-tio(Y, X).
%primo o prima            primo(hector,david).
primo(X, Y) :-padre(Z, Y), tio(Z, X).
primo(X, Y) :-madre(Z, Y), tio(Z, X).
%%cunado o cunada         cunado(isidro,emilia).
cunado(X, Y) :-hermano(Z, Y), esposos(Z, X).
cunado(X, Y) :-hermano(Z, X), esposos(Z, Y).
%nieto o nieta             nieto(david,elia).
nieto(X, Y) :-abuelo(Y, X).
%bisabuelo o bisabuela    bisabuelo(carmen,david).   
bisabuelo(X, Y) :-abuelo(X, Z), padre(Z, Y).
bisabuelo(X, Y) :-abuelo(X, Z), madre(Z, Y).
%bisnieto o bisnieta       bisnieto(hector,gabriel).
bisnieto(X, Y) :-bisabuelo(Y, X).
%yerno o nuera             yerno_nuera(jose,elia).
yerno_nuera(X, Y) :-hijo(Z,Y), esposos(X, Z).
%suegro o suegra           suegro(elia,jose).
suegro(X, Y) :-yerno_nuera(Y, X).

%--------------------------------------------------------------------------------------------------------------

%¿Quienes son mis primos? ----------- lista_primos(adahir, L).
lista_primos(Persona, ListaPrimos) :-setof(Primo, primo(Primo, Persona), ListaPrimos).

%¿Quienes son los suegros de mi papa?  -----------lista_suegros(emilia, L).
lista_suegros(Persona, ListaSuegros) :-setof(Suegro, suegro(Suegro, Persona), ListaSuegros).

%¿Quienes son mis cuñados? ------------lista_cunados(emilia, L).
lista_cunados(Persona, ListaCunados) :-setof(Cunado, cunado(Cunado, Persona), ListaCunados).

%¿Quienes son mis tios  --------lista_tios(adahir, L)
lista_tios(Persona, ListaTios) :-setof(Tio, tio(Tio, Persona), ListaTios).

%Obtener todos los que son mis sobrinos o sobrinas  --------lista_sobrinos(olivia, L).
lista_sobrinos(Persona, ListaSobrinos) :- setof(Sobrino, sobrino(Sobrino, Persona), ListaSobrinos).

%Obtener todos los bisnietos
lista_bisnietos(Persona, ListaBisnietos) :-setof(Bisnieto, bisnieto(Bisnieto, Persona), ListaBisnietos).


