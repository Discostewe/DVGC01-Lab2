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
/* End of program                                                             */
/******************************************************************************/
