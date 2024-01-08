import tkinter as tk
from tkinter import messagebox, scrolledtext, Toplevel
import logging
import random
import threading
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

# Ustawienie loggera
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Definicje funkcji pomocniczych
class TextHandler(logging.Handler):
    # ... [Kod klasy TextHandler] ...

# Symulacja długiego procesu inicjalizacyjnego
def long_initialization_process():
    # ... [Kod symulacji długiego procesu] ...

# Funkcja gry w kółko i krzyżyk
def tic_tac_toe():
    # ... [Kod gry w kółko i krzyżyk] ...

# Funkcja logowania
def login():
    # ... [Kod funkcji logowania] ...

# Funkcja rysowania paraboli
def draw_parabola():
    top = Toplevel(root)
    top.title('Wykres Paraboli')

    # Definicja paraboli y = x^2
    x = range(-10, 11)
    y = [i**2 for i in x]

    # Utworzenie wykresu
    fig, ax = plt.subplots()
    ax.plot(x, y)
    ax.set_title("Wykres Paraboli: y = x^2")
    ax.grid(True)

    # Umieszczenie wykresu na Toplevel Tkinter
    canvas = FigureCanvasTkAgg(fig, master=top)  # A tk.DrawingArea.
    canvas.draw()
    canvas.get_tk_widget().pack()

# Ustawienie okna Tkinter
root = tk.Tk()
root.title("Okno logowania i konsola")

# ... [Kod ustawienia interfejsu użytkownika] ...

# Dodanie przycisku do rysowania paraboli
button_draw_parabola = tk.Button(root, text="Rysuj Parabolę", command=draw_parabola)
button_draw_parabola.pack(side=tk.BOTTOM)

root.mainloop()