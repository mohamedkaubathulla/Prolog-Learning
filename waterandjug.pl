% Water Jug Problemgg
move(C1, _, (X,Y), (C1,Y)) :-
    X < C1.

move(_, C2, (X,Y), (X,C2)) :-
    Y < C2.

move(_, _, (X,Y), (X,0)) :-
    Y > 0.

move(_, _, (X,Y), (0,Y)) :-
    X > 0.

move(C1, _, (X,Y), (X1,Y1)) :-
    T is X + Y,
    ( T >= C1 ->
        X1 is C1,
        Y1 is T - C1
    ;
        X1 is T,
        Y1 is 0
    ).

move(_, C2, (X,Y), (X1,Y1)) :-
    T is X + Y,
    ( T >= C2 ->
        Y1 is C2,
        X1 is T - C2
    ;
        Y1 is T,
        X1 is 0
    ).

search(_, _, Goal, Goal, _, [Goal]) :- !.

search(C1, C2, Goal, State, Visited, [State|Path]) :-
    move(C1, C2, State, Next),
    \+ member(Next, Visited),
    search(C1, C2, Goal, Next, [Next|Visited], Path).

find(C1, C2, Goal, Path) :-
    search(C1, C2, Goal, (0,0), [(0,0)], Path).