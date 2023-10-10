import sys
jp = int(input("wypisz wynik język polski: "))
jo = int(input("wypisz wynik język obcy: "))

ujp = int(input("wypsiz wynik ustny język polski: "))
if ujp < 0:
    print("liczba nie może być ujemna")
    sys.exit(0)

ujo = int(input("wypisz wynik ustny język obcy: "))
if ujo < 0:
    print("liczba nie może być ujemna")
    sys.exit(0)
d = int(input("wypisz wynik dodatkowy: "))
if d < 0:
    print("liczba nie może być ujemna")
    sys.exit(0)
wynik = (jp + jo + ujp + ujo + d) / 4


if jp > 30 and jo > 30 and ujp > 30 and ujo > 30 and d > 30:
    print("zdałeś bez amnesti")
    sys.exit(0)

if wynik > 30:
    print("zdałeś z amnestią")

else:
    print("nie zdałeś")


#
