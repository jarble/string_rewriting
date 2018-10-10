:- initialization(main).
:- set_prolog_flag('double_quotes','chars').

main :-
	recursive_rewrite([if,a,is,greater,than,b,then,c,is,less,than,d],Output),
	writeln(Output).
	
recursive_rewrite(Input,Output) :-
	rewrite(Input,Output1),recursive_rewrite(Output1,Output);
	Input = Output.

rewrite(Input,Output) :-
	rewrite_system(Rules),
	member([Input1,Output1],Rules),
	replace(Input1,Output1,Input,Output).

rewrite_system([
	[[even,though],[but]],
	[[A,is,more,than,B],[A>B]],
	[[A,is,less,than,B],[A<B]],
	[[greater],[more]],
	[[though],[and]],
	[[but],[though]],
	[[A,and,B]],
	[[neither,A,nor,B],[not,[A,or,B]]],
	[[if,A,then,B],[A,implies,B]],
	[[yet],[but]]
]).	

replace(ToReplace, ToInsert, List, Result) :-
    once(append([Left, ToReplace, Right], List)),
    append([Left, ToInsert, Right], Result).
