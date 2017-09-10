jest(X, sportowiec) :- jest(X, plywak); biega(X).
zawody(X) :- jest(X, sportowiec), ma_kondycje(X).
biega(X) :- jest(X, pilkarz).
ma_kondycje(X) :- jest(X, pilkarz). 
jest(marek, pilkarz).
jest(adam, plywak).
jest(jan, pilkarz).
jest(jan, plywak).