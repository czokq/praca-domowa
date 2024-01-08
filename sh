import tkinter as tk
from tkinter import messagebox, Toplevel, scrolledtext
from PIL import Image, ImageTk, ImageSequence
import logging
import random
import time
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

def long_initialization_process(text_widget):
    logging.info("Rozpoczynanie długiego procesu inicjalizacyjnego...")
    for i in range(1, 101):
        time.sleep(0.05)  # Symulacja długiego procesu
        logging.info(f"Inicjalizacja... {i}%")
    logging.info("Inicjalizacja zakończona.")

# Klasa do wyświetlania animowanego GIF
class AnimatedGIF(tk.Label):
    # ... [Klasa AnimatedGIF] ...

# Funkcja do wyświetlania GIF
def show_gif():
    # ... [Funkcja show_gif] ...

# Ustawienie okna Tkinter
root = tk.Tk()
root.title("Okno logowania i konsola")

# Ustawienie pola tekstowego dla logów
text = scrolledtext.ScrolledText(root, state='disabled', height=10)
text.pack()

# Ustawienie handlera dla logowania
handler = TextHandler(text)
logging.getLogger().addHandler(handler)

# ... [Kod interfejsu użytkownika] ...

# ... [Kod gry w kółko i krzyżyk] ...

# ... [Kod funkcji logowania] ...

# Uruchomienie symulacji w tle
threading.Thread(target=long_initialization_process, args=(text,), daemon=True).start()

root.mainloop()