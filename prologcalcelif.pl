:- use_module(library(readutil)).

calculator :-
    write('Enter expression (e.g., 5 + 3) or "exit" to quit: '),
    read_line_to_string(user_input, Input),
    (   Input = "exit" -> writeln('Goodbye!') ;
        split_string(Input, " ", " ", Tokens),
        (   Tokens = [FirstStr, Oper, SecondStr],
            number_string(First, FirstStr),
            number_string(Second, SecondStr),
            calculate(First, Oper, Second, Result) ->
            format('\nResult: ~w ~w ~w = ~w\n\n', [First, Oper, Second, Result]),
            calculator
        ;   writeln('\nInvalid input. Please enter in format: number operator number\n'),
            calculator
        )
    ).

calculate(First, "+", Second, Result) :- Result is First + Second.
calculate(First, "-", Second, Result) :- Result is First - Second.
calculate(First, "*", Second, Result) :- Result is First * Second.
calculate(_, "/", 0, _) :- writeln('\nCannot divide by 0\n'), fail.
calculate(First, "/", Second, Result) :- Result is First / Second.

:- initialization(calculator).
