import sys
jp = int(input("wypisz wynik język polski: "))
jo = int(input("wypisz wynik język obcy: "))
ujp = int(input("wypsiz wynik ustny język polski: "))
ujo = int(input("wypisz wynik ustny język obcy: "))
d = int(input("wypisz wynik dodatkowy: "))


if ujp < 0 and ujo < 0 and d < 0 :
    print("niemoże być ujemne")
    sys.exit(0)