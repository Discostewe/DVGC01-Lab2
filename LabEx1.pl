/******************************************************************************/
/* Prolog Lab 2 example - Grammar test bed                                    */
/******************************************************************************/

/******************************************************************************/
/* Grammar Rules in Definite Clause Grammar form                              */
/* This the set of productions, P, for this grammar                           */
/* This is a slightly modified from of the Pascal Grammar for Lab 2 Prolog    */
/******************************************************************************/

program       --> prog_head, var_part, stat_part.

/******************************************************************************/
/* Program Header                                                             */
/******************************************************************************/
prog_head     	--> [program], id, ['('], [input], [','], [output], [')'], [';'].
id		--> [a]|[b]|[c].
num		--> [0],[1],[2],[3],[4],[5],[6],[7],[8],[9].



/******************************************************************************/
/* Terminals                                                                  */
/******************************************************************************/
lpar    -->  [40].  % (
rpar    -->  [41].  % )
mult    -->  [42].  % *
add     -->  [43].  % +
comma   -->  [44].  % ,
dot     -->  [46].  % .
colon   -->  [58].  % :
scolon  -->  [59].  % ;

program --> [256].  % program
input   --> [257].  % input 
output  --> [258].  % output 
var     --> [259].  % var
integer --> [260].  % integer
begin   --> [261].  % begin
end     --> [262].  % end
boolean --> [263].  % boolean
real    --> [264].  % real
id      --> [270].  %id
a       --> [270].
b       --> [270].
c       --> [270].
assign  --> [271].  % assign
number  --> [272].  % number

/******************************************************************************/
/* Var_part                                                                   */
/******************************************************************************/
var_part             --> var, var_dec_list.
var_dec_list	     --> var_dec | var_dec, var_dec_list.
var_dec		     --> id_list, colon, type, scolon.
id_list		     --> id | id, comma, id_list.
type		     --> integer | boolean | real.

/******************************************************************************/
/* Stat part                                                                  */
/******************************************************************************/
stat_part		-->  begin, stat_list, end, dot.
stat_list		-->  stat | stat, scolon, stat_list.
stat			-->  assign_stat.
assign_stat		-->  id, assign, expr.
expr			-->  term | term, add, expr.
term			-->  factor | factor, mult, term.
factor			-->  lpar, expr, rpar | operand.
operand			-->  id | num.


stat_part_todo(_,_)  :-   write('stat_part: To Be Done'), nl.

/******************************************************************************/
/* Testing the system: this may be done stepwise in Prolog                    */
/* below are some examples of a "bottom-up" approach - start with simple      */
/* tests and buid up until a whole program can be tested                      */
/******************************************************************************/
/* Stat part                                                                  */
/******************************************************************************/
/*  op(['+'], []).                                                            */
/*  op(['-'], []).                                                            */
/*  op(['*'], []).                                                            */
/*  op(['/'], []).                                                            */
/*  addop(['+'], []).                                                         */
/*  addop(['-'], []).                                                         */
/*  mulop(['*'], []).                                                         */
/*  mulop(['/'], []).                                                         */
/*  factor([a], []).                                                          */
/*  factor(['(', a, ')'], []).                                                */
/*  term([a], []).                                                            */
/*  term([a, '*', a], []).                                                    */
/*  expr([a], []).                                                            */
/*  expr([a, '*', a], []).                                                    */
/*  assign_stat([a, assign, b], []).                                          */
/*  assign_stat([a, assign, b, '*', c], []).                                  */
/*  stat([a, assign, b], []).                                                 */
/*  stat([a, assign, b, '*', c], []).                                         */
/*  stat_list([a, assign, b], []).                                            */
/*  stat_list([a, assign, b, '*', c], []).                                    */
/*  stat_list([a, assign, b, ';', a, assign, c], []).                         */
/*  stat_list([a, assign, b, '*', c, ';', a, assign, b, '*', c], []).         */
/*  stat_part([begin, a, assign, b, '*', c, end, '.'], []).                   */
/******************************************************************************/
/* Var part                                                                   */
/******************************************************************************/
/* typ([integer], []).                                                        */
/* typ([real], []).                                                           */
/* typ([boolean], []).                                                        */
/* id([a], []).                                                               */
/* id([b], []).                                                               */
/* id([c], []).                                                               */
/* id_list([a], []).                                                          */
/* id_list([a, ',', b], []).                                                  */
/* id_list([a, ',', b, ',', c], []).                                          */
/* var_dec([a, ':', integer], []).                                            */
/* var_dec_list([a, ':', integer], []).                                       */
/* var_dec_list([a, ':', integer, b, ':', real], []).                         */
/* var_part([var, a, ':', integer], []).                                      */
/******************************************************************************/
/* Program header                                                             */
/******************************************************************************/
/* prog_head([program, c, '(', input, ',', output, ')', ';'], []).            */
/******************************************************************************/

/******************************************************************************/
/* Whole program                                                              */
/******************************************************************************/
/* program([program, c, '(', input, ',', output, ')', ';',                    */
/*          var, a,    ':', integer, ';',                                     */
/*               b, c, ':', real,    ';',                                     */
/*          begin,                                                            */
/*             a, assign, b, '*', c, ';',                                     */  
/*             a, assign, b, '+', c,                                          */
/*          end, '.'], []).                                                   */
/******************************************************************************/

/******************************************************************************/
/* Define the above tests                                                     */
/******************************************************************************/

testvar :- var_part([var, a, ':', integer, ';', b, ',' , c,':', real, ';'], []).
teststat :- stat_part([begin, a, assign, b, '*', c, ';', a, assign, b, '+', c, end, '.'], []).
testph :- prog_head([program, c, '(', input, ',', output, ')', ';'], []).
testpr :-   program([program, c, '(', input, ',', output, ')', ';'], []).

/******************************************************************************/
/* End of program                                                             */
/******************************************************************************/
