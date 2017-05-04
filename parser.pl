/******************************************************************************/
/* Prolog Lab 2 example - Grammar test bed                                    */
/******************************************************************************/

/******************************************************************************/
/* Grammar Rules in Definite Clause Grammar form                              */
/* This the set of productions, P, for this grammar                           */
/* This is a slightly modified from of the Pascal Grammar for Lab 2 Prolog    */
/******************************************************************************/

prog       --> prog_head, var_part, stat_part.

/******************************************************************************/
/* Program Header                                                             */
/******************************************************************************/
prog_head     	--> program, id, lpar, input, comma, output, rpar, scolon.



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
operand			-->  id | number.

/******************************************************************************/
/* Lexer								      */	
/******************************************************************************/


/******************************************************************************/
/* Reader								      */	
/******************************************************************************/

/******************************************************************************/
/* Parser								      */	
/******************************************************************************/
testall :-  parseFiles( [ 'testfiles/testok1.pas', 'testfiles/testok2.pas', 'testfiles/testok3.pas', 'testfiles/testok4.pas', 
                          'testfiles/testok5.pas', 'testfiles/testok6.pas', 'testfiles/testok7.pas', 'testfiles/testa.pas',
                          'testfiles/testb.pas', 'testfiles/testc.pas', 'testfiles/testd.pas', 'testfiles/teste.pas', 'testfiles/testf.pas',
                          'testfiles/testg.pas', 'testfiles/testh.pas', 'testfiles/testi.pas', 'testfiles/testj.pas', 'testfiles/testk.pas',
                          'testfiles/testl.pas', 'testfiles/testm.pas', 'testfiles/testn.pas', 'testfiles/testo.pas', 'testfiles/testp.pas',
                          'testfiles/testq.pas', 'testfiles/testr.pas', 'testfiles/tests.pas', 'testfiles/testt.pas', 'testfiles/testu.pas',
                          'testfiles/testv.pas', 'testfiles/testw.pas', 'testfiles/testx.pas', 'testfiles/testy.pas', 'testfiles/testz.pas',
                          'testfiles/fun1.pas', 'testfiles/fun2.pas', 'testfiles/fun3.pas', 'testfiles/fun4.pas', 'testfiles/fun5.pas', 
                          'testfiles/sem1.pas', 'testfiles/sem2.pas', 'testfiles/sem3.pas', 'testfiles/sem4.pas', 'testfiles/sem5.pas']).
testallout :- tell('tests.out'),
	write('Testing OK programs'), nl, nl,

parseFiles(['testfiles/testok1.pas', 'testfiles/testok2.pas', 'testfiles/testok3.pas', 'testfiles/testok4.pas', 
            'testfiles/testok5.pas', 'testfiles/testok6.pas', 'testfiles/testok7.pas']),
nl, write('Testing a-z programs'), nl, nl,
	  parseFiles(['testfiles/testa.pas', 'testfiles/testb.pas', 'testfiles/testc.pas', 'testfiles/testd.pas', 'testfiles/teste.pas',
	    	      'testfiles/testf.pas', 'testfiles/testg.pas', 'testfiles/testh.pas', 'testfiles/testi.pas', 'testfiles/testj.pas',
	              'testfiles/testk.pas', 'testfiles/testl.pas', 'testfiles/testm.pas', 'testfiles/testn.pas', 'testfiles/testo.pas',
	              'testfiles/testp.pas', 'testfiles/testq.pas', 'testfiles/testr.pas', 'testfiles/tests.pas', 'testfiles/testt.pas',
		      'testfiles/testu.pas', 'testfiles/testv.pas', 'testfiles/testw.pas', 'testfiles/testx.pas', 'testfiles/testy.pas',
		      'testfiles/testz.pas']),
		
nl, write('Testing fun programs'), nl, nl,

parseFiles(['testfiles/fun1.pas', 'testfiles/fun2.pas', 'testfiles/fun3.pas', 'testfiles/fun4.pas', 'testfiles/fun5.pas']),

nl, write('Testing sem programs'), nl, nl,

parseFiles(['testfiles/sem1.pas', 'testfiles/sem2.pas', 'testfiles/sem3.pas', 'testfiles/sem4.pas', 'testfiles/sem5.pas']),
													told.

parseFiles([]). 
parseFiles([H|T]) :-  write('Testing '), write(H), nl, 
                      read_in(H,L), lexer(L, Tokens),
                      write(L), nl, write(Tokens), nl,
                      parser(Tokens, []), nl,
                      write(H), write(' end of parse'), nl, nl,
                      parseFiles(T).

parser(Tokens, Res) :- (prog(Tokens, Res), Res = [], write('Parse OK!'));  
                        write('Parse Fail!').

/******************************************************************************/
/* End of program                                                             */
/******************************************************************************/
