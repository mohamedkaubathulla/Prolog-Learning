solve_4queens(Solution) :-
    Solution = [Q1, Q2, Q3, Q4],
    permutation([1, 2, 3, 4], Solution),
    safe_placement(Solution).

safe_placement([]).
safe_placement([Queen | Rest]) :-
    safe_placement(Rest),
    no_conflict(Queen, Rest, 1).

no_conflict(_, [], _).
no_conflict(Q, [Q1 | Rest], Distance) :-
    Q =\= Q1,
    abs(Q - Q1) =\= Distance,
    NextDistance is Distance + 1,
    no_conflict(Q, Rest, NextDistance).

permutation([], []).
permutation(List, [Element | RestPerm]) :-
    select(Element, List, Remaining),
    permutation(Remaining, RestPerm).