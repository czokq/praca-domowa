import sys
ocena = int(input("podaj swoją ocenę z klasy 8: "))#
wynik = int(input("podaj swój wynik z  testu: "))

if wynik >= 90:
    print("dostałeś się do grupy zawansowanej")
    sys.exit(0)

if ocena >= 5:
    print("dostałeś się do grupy zawansowanej")
    sys.exit(0)
else:
    print("dostałeś się do grupy niezawannsowanej")
    sys.exit(0)