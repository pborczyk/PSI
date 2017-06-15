kobieta(ania).
kobieta(ala).
kobieta(natalia).

mezczyzna(marek).
mezczyzna(janek).
mezczyzna(piotrek).

lubi(ania, kwiaty).
lubi(ania, ksiazki).
lubi(marek, piwo).
lubi(marek, psy).
lubi(janek, piwo).
lubi(piotrek, ksiazki).

lubi(natalia, kwiaty).
lubi(ala, samochody).

lubi(X, Y) :- kobieta(X), mezczyzna(Y).
lubi(X, kosmetyki) :- kobieta(X).
lubi(X, samochody) :- mezczyzna(X).

lubi(marek, X) :- kobieta(X).
lubi(ala, X) :- lubi(marek, X).






