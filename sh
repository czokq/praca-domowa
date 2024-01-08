import tkinter as tk
from tkinter import messagebox, Toplevel
from PIL import Image, ImageTk, ImageSequence
import logging
import random
import time
import math

# Ustawienie loggera
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Definicje funkcji pomocniczych
class TextHandler(logging.Handler):
    def emit(self, record):
        msg = self.format(record)
        def append():
            self.text.configure(state='normal')
            self.text.insert(tk.END, msg + '\n')
            self.text.configure(state='disabled')
            self.text.yview(tk.END)
        self.text.after(0, append)

# Symulacja długiego procesu inicjalizacyjnego (przykładowa funkcja)
def long_initialization_process():
    logging.info("Rozpoczynanie długiego procesu inicjalizacyjnego...")
    # ... Reszta funkcji ...

# Klasa do wyświetlania animowanego GIF
class AnimatedGIF(tk.Label):
    def __init__(self, master, path_to_gif):
        tk.Label.__init__(self, master)
        self.path_to_gif = path_to_gif
        self.img = Image.open(self.path_to_gif)
        self.frames = [ImageTk.PhotoImage(image) for image in ImageSequence.Iterator(self.img)]
        self.index = 0
        self.label = tk.Label(self)
        self.label.grid()
        self.cancel = self.after(0, self.play)

    def play(self):
        self.config(image=self.frames[self.index])
        self.index += 1
        if self.index == len(self.frames):
            self.index = 0
        self.cancel = self.after(50, self.play)

# Funkcja do wyświetlania GIF
def show_gif():
    top = Toplevel(root)
    top.title('GIF Animation')
    AnimatedGIF(top, r'C:\Users\marek\Downloads\200w.gif').pack()

# Funkcja gry w kółko i krzyżyk
def tic_tac_toe():
    top = Toplevel(root)
    top.title('Kółko i Krzyżyk')
    turn = 'X'

    # ... Tutaj dodasz całą logikę gry w kółko i krzyżyk ...

# Funkcja logowania
def login():
    username = entry_username.get()
    password = entry_password.get()
    if username == "admin" and password == "admin":
        logging.info("Logowanie udane.")
        tic_tac_toe()
    else:
        logging.error("Logowanie nieudane. Błędna nazwa użytkownika lub hasło.")

# Ustawienie okna Tkinter
root = tk.Tk()
root.title("Okno logowania i konsola")

# ... Tutaj skonfigurujesz resztę interfejsu użytkownika ...

# Dodanie przycisku do otwarcia okna z GIFem
button_show_gif = tk.Button(root, text="Pokaż GIF", command=show_gif)
button_show_gif.pack(side=tk.BOTTOM)

# ... Tutaj umieścisz resztę kodu aplikacji ...

root.mainloop()