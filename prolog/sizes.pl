bigger(ant, flea).
bigger(mouse, ant).
bigger(cat, mouse).
bigger(aneta, cat).
bigger(mike, aneta).
bigger(horse, mike).
bigger(whale, horse).

bigger_than(A, B) :- bigger(A, B).
bigger_than(A, B) :- bigger(A, X), bigger_than(X, B).


% ?- bigger_than(cat, X).
% X = mouse;
% X = ant;
% X = flea;
