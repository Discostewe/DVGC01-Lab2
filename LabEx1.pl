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
/* Var_part                                                                   */
/******************************************************************************/
var_part             --> var_part_todo.
var_part_todo(_,_)   :-  write('var_part:  To Be Done'), nl.

/******************************************************************************/
/* Stat part                                                                  */
/******************************************************************************/
stat_part		-->  [begin], stat_list, [end], ['.'].
stat_list		-->  stat | stat, [';'], stat_list.
stat			-->  assign_stat.
assign_stat		-->  id, [assign], expr.
expr			-->  term | term, ['+'], expr.
term			-->  factor | factor, ['*'], term.
factor			-->  ['('], expr, [')'] | operand.
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

testps :- stat_part([begin, a, assign, b, '*', c, ';', a, assign, b, '+', c, end, '.'], []).
testph :- prog_head([program, c, '(', input, ',', output, ')', ';'], []).
testpr :-   program([program, c, '(', input, ',', output, ')', ';'], []).

/******************************************************************************/
/* End of program                                                             */
/******************************************************************************/
