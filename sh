import tkinter as tk
from tkinter import messagebox, scrolledtext
import turtle
import logging

# Ustawienie loggera
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Definicje funkcji pomocniczych
class TextHandler(logging.Handler):
    # ... [Kod klasy TextHandler] ...

# Funkcja rysująca parabolę za pomocą turtle
def draw_parabola_turtle():
    # Ustawienia dla turtle
    screen = turtle.TurtleScreen(canvas)
    t = turtle.RawTurtle(screen)

    t.speed(0)  # Ustawienie najszybszej prędkości rysowania
    screen.setworldcoordinates(-25, -10, 25, 100)  # Zakres współrzędnych

    # Rysowanie osi
    t.up()
    t.goto(-25, 0)
    t.down()
    t.goto(25, 0)
    t.up()
    t.goto(0, -10)
    t.down()
    t.goto(0, 100)
    t.up()

    # Rysowanie paraboli y = x^2
    t.color("blue")
    t.goto(-10, 0)
    t.down()
    for x in range(-10, 11):
        y = x ** 2
        t.goto(x, y)

    t.hideturtle()  # Ukrycie żółwia

# Funkcja logowania
def login():
    username = entry_username.get()
    password = entry_password.get()
    if username == "admin" and password == "admin":
        logging.info("Logowanie udane.")
        draw_parabola_turtle()
    else:
        logging.error("Logowanie nieudane. Błędna nazwa użytkownika lub hasło.")

# Ustawienie okna Tkinter
root = tk.Tk()
root.title("Okno logowania i konsola")

# Ustawienie pola tekstowego dla logów
text = scrolledtext.ScrolledText(root, state='disabled', height=10)
text.pack()

# Ustawienie handlera dla logowania
handler = TextHandler(text)
logging.getLogger().addHandler(handler)

# Ustawienie interfejsu logowania
frame_login = tk.Frame(root)
frame_login.pack(pady=10)

label_username = tk.Label(frame_login, text="Nazwa użytkownika:")
label_username.pack(side=tk.LEFT)
entry_username = tk.Entry(frame_login)
entry_username.pack(side=tk.LEFT)

label_password = tk.Label(frame_login, text="Hasło:")
label_password.pack(side=tk.LEFT)
entry_password = tk.Entry(frame_login, show="*")
entry_password.pack(side=tk.LEFT)

button_login = tk.Button(frame_login, text="Logowanie", command=login)
button_login.pack(side=tk.LEFT)

# Ustawienie obszaru rysowania Turtle w Tkinter
canvas = turtle.ScrolledCanvas(root)
canvas.pack(fill=tk.BOTH, expand=True)

root.mainloop()