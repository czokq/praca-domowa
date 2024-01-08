import tkinter as tk
from tkinter import messagebox, Toplevel, scrolledtext
from PIL import Image, ImageTk, ImageSequence
import logging
import random
import time
import threading
import math

# Ustawienie loggera
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Definicje funkcji pomocniczych
class TextHandler(logging.Handler):
    def __init__(self, text_widget):
        logging.Handler.__init__(self)
        self.text_widget = text_widget

    def emit(self, record):
        msg = self.format(record)
        def append():
            self.text_widget.configure(state='normal')
            self.text_widget.insert(tk.END, msg + '\n')
            self.text_widget.configure(state='disabled')
            self.text_widget.yview(tk.END)
        self.text_widget.after(0, append)

# Symulacja długiego procesu inicjalizacyjnego
def long_initialization_process():
    for i in range(1, 101):
        time.sleep(0.05)  # Symulacja długiego procesu
        logging.info(f"Inicjalizacja... {i}%")
    logging.info("Inicjalizacja zakończona.")

# Klasa do wyświetlania animowanego GIF
class AnimatedGIF(tk.Label):
    # ... [Kod klasy AnimatedGIF] ...

# Funkcja do wyświetlania GIF
def show_gif():
    top = Toplevel(root)
    top.title('GIF Animation')
    AnimatedGIF(top, r'C:\Users\marek\Downloads\200w.gif').pack()

# Funkcja gry w kółko i krzyżyk
def tic_tac_toe():
    # ... [Kod gry w kółko i krzyżyk] ...

# Funkcja logowania
def login():
    username = entry_username.get()
    password = entry_password.get()
    if username == "admin" and password == "admin":
        logging.info("Logowanie udane.")
        threading.Thread(target=long_initialization_process, daemon=True).start()
        tic_tac_toe()
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

# Dodanie przycisku do otwarcia okna z GIFem
button_show_gif = tk.Button(frame_login, text="Pokaż GIF", command=show_gif)
button_show_gif.pack(side=tk.LEFT)

root.mainloop()