lexer([],[]).
lexer([H|T],[F|S]) :- match(H,F), lexer(T,S). 

match(L,T) :- name(L, [H|Tail]), char_type(H, end_of_file), T is 275.
match(L,T) :- L = 'program', T is 256.
match(L,T) :- L = 'input'  , T is 257.
match(L,T) :- L = 'output' , T is 258.
match(L,T) :- L = 'var'    , T is 259.
match(L,T) :- L = 'integer', T is 260.
match(L,T) :- L = 'begin'  , T is 261.
match(L,T) :- L = 'end'    , T is 262.
match(L,T) :- L = 'boolean', T is 263.
match(L,T) :- L = 'real'   , T is 264.
match(L,T) :- L = ':='     , T is 271.
match(L,T) :- L = '('      , T is 40.
match(L,T) :- L = ')'      , T is 41.
match(L,T) :- L = '*'      , T is 42.
match(L,T) :- L = '+'      , T is 43.
match(L,T) :- L = ','      , T is 44.
match(L,T) :- L = '.'      , T is 46.
match(L,T) :- L = ':'      , T is 58.
match(L,T) :- L = ';'      , T is 59.



match(L,T) :- name(L, [H|Tail]), char_type(H, alpha), match_id(Tail), T is 270.

match(L,T) :- name(L, [H|Tail]), char_type(H,digit), match_num(Tail), T is 272.

match(L,T) :- char_type(L, ascii)  , T is 273.



match_id([]).
match_id([H|T]) :- char_type(H, alnum), match_id(T).

match_num([]).
match_num([H|T]) :- char_type(H,digit), match_num(T).

test_lexer(File, X) :- read_in(File, L), lexer(L,X), write(X).
