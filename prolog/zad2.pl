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

rodzic(bogdan, ewa).
rodzic(bogdan, zofia).

rodzic(wojciech, katarzyna).
rodzic(wojciech, robert).

rodzic(X, Y) :- malzenstwo(X, Z), rodzic(Z, Y).

matka(X, Y) :- rodzic(X, Y), kobieta(X).
ojciec(X, Y) :- rodzic(X, Y), mezczyzna(X).
babcia(X, Y) :- rodzic(X, Z), rodzic(Z, Y), kobieta(X).
dziadek(X, Y) :- rodzic(X, Z), rodzic(Z, Y), mezczyzna(X).
siostra(X, Y) :- kobieta(X), rodzic(Z, X) = rodzic(Z, Y).




