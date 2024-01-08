import tkinter as tk
from tkinter import Toplevel
import turtle

# Funkcja gry w kółko i krzyżyk
def tic_tac_toe():
    # ... [Kod gry w kółko i krzyżyk] ...

# Funkcja logowania
def login():
    # ... [Kod funkcji logowania] ...

# Funkcja rysująca parabolę za pomocą turtle
def draw_parabola_turtle():
    # Ustawienia dla okna turtle
    top = Toplevel(root)
    top.title('Wykres Paraboli z użyciem Turtle')
    canvas = tk.Canvas(master=top, width=500, height=400)
    canvas.pack()

    screen = turtle.TurtleScreen(canvas)
    t = turtle.RawTurtle(screen)

    t.speed(0)  # Ustawienie najszybszej prędkości rysowania
    screen.setworldcoordinates(-10, -10, 10, 100)  # Zakres współrzędnych

    # Rysowanie osi
    t.up()
    t.goto(-10, 0)
    t.down()
    t.goto(10, 0)
    t.up()
    t.goto(0, -10)
    t.down()
    t.goto(0, 100)
    t.up()

    # Rysowanie paraboli y = x^2
    t.color("blue")
    for x in range(-10, 11):
        y = x ** 2
        if x == -10:
            t.up()
            t.goto(x, y)
            t.down()
        else:
            t.goto(x, y)

    t.hideturtle()  # Ukrycie żółwia

# Ustawienie okna Tkinter
root = tk.Tk()
root.title("Okno logowania i konsola")

# ... [Kod ustawienia interfejsu użytkownika] ...

# Dodanie przycisku do rysowania paraboli turtle
button_draw_parabola = tk.Button(root, text="Rysuj Parabolę Turtle", command=draw_parabola_turtle)
button_draw_parabola.pack(side=tk.BOTTOM)

root.mainloop()