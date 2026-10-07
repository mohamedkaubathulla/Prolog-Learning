% Facts

patient(ravi).
fever(ravi).
takes_medicine(ravi).
cough(ravi).

doctor(dr_smith).
sick(ravi).

% Rules

needs_checkup(X) :-
    patient(X),
    fever(X).

healthy(X) :-
    takes_medicine(X),
    gets_better(X).

gets_better(ravi) :-
    takes_medicine(ravi).

treats(X, Y) :-
    doctor(X),
    sick(Y).

needs_medicine(X) :-
    patient(X),
    cough(X).