mezczyzna(franciszek).
mezczyzna(jan).
mezczyzna(bogdan).
mezczyzna(krzysztof).
mezczyzna(wojciech).
mezczyzna(robert).

kobieta(wanda).
kobieta(maria).
kobieta(anna).
kobieta(ewa).
kobieta(zofia).
kobieta(katarzyna).


malzenstwo(jan, maria).
malzenstwo(bogdan, anna).
malzenstwo(wojciech, zofia).

malzenstwo(maria, jan).
malzenstwo(anna, bogdan).
malzenstwo(zofia, wojciech).


rodzic(franciszek, maria).
rodzic(wanda, bogdan).

rodzic(jan, krzysztof).
rodzic(jan, wojciech).
rodzic(maria, krzysztof).
rodzic(maria, wojciech).

rodzic(bogdan, ewa).
rodzic(bogdan, zofia).
rodzic(anna, ewa).
rodzic(anna, zofia).

rodzic(wojciech, katarzyna).
rodzic(wojciech, robert).
rodzic(zofia, katarzyna).
rodzic(zofia, robert).


matka(X, Y) :- rodzic(X, Y), kobieta(X).
ojciec(X, Y) :- rodzic(X, Y), mezczyzna(X).
babcia(X, Y) :- rodzic(X, Z), rodzic(Z, Y), kobieta(X).
dziadek(X, Y) :- rodzic(X, Z), rodzic(Z, Y), mezczyzna(X).
siostra(X, Y) :- kobieta(X), rodzic(Z, X), rodzic(Z, Y), X\= Y.
brat(X, Y) :- mezczyzna(X), rodzic(Z, X), rodzic(Z, Y), X\= Y.
syn(X,Y) :- mezczyzna(X), rodzic(Y, X).
corka(X,Y) :- kobieta(X), rodzic(Y, X).

przodek(X, Y) :- rodzic(X, Y).
przodek(X, Y) :- rodzic(X, Z), przodek(Z, Y).


potomek(X, Y) :- rodzic(Y, X).
potomek(X, Y) :- rodzic(Y, Z), potomek(X, Z).

ma_dzieci(X) :- rodzic(X, _).
jest_dziadkiem(X) :- dziadek(X, _).

wuj(X, Y) :- rodzic(Z, Y), brat(X, Z).


