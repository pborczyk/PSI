sportowiec(X) :- plywa(X); biega(X).
zawody(X) :- sportowiec(X), ma_kondycje(X).
pilkarz(X) :- biega(X), ma_kondycje(X).

biega(marek).
biega(jan).

ma_kondycje(marek).
ma_kondycje(jan).

plywa(adam).
plywa(jan).