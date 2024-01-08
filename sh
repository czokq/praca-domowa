import tkinter as tk
from tkinter import messagebox, Toplevel
from PIL import Image, ImageTk, ImageSequence
import logging
import random

# Ustawienie loggera
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Definicje funkcji pomocniczych
class TextHandler(logging.Handler):
    def __init__(self, text):
        logging.Handler.__init__(self)
        self.text = text

    def emit(self, record):
        msg = self.format(record)
        def append():
            self.text.configure(state='normal')
            self.text.insert(tk.END, msg + '\n')
            self.text.configure(state='disabled')
            self.text.yview(tk.END)
        self.text.after(0, append)

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

# Ustawienie okna Tkinter
root = tk.Tk()
root.title("Okno logowania i konsola")

# Ustawienie pola tekstowego dla logów
text = tk.Text(root, height=15, state='disabled')
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

# Funkcje gry w kółko i krzyżyk
def tic_tac_toe():
    top = Toplevel(root)
    top.title('Kółko i Krzyżyk')
    turn = 'X'  # X zaczyna grę
    buttons = [[None, None, None], [None, None, None], [None, None, None]]

    def check_for_win():
        for i in range(3):
            if buttons[i][0]['text'] == buttons[i][1]['text'] == buttons[i][2]['text'] != "":
                return buttons[i][0]['text']
            if buttons[0][i]['text'] == buttons[1][i]['text'] == buttons[2][i]['text'] != "":
                return buttons[0][i]['text']
        if buttons[0][0]['text'] == buttons[1][1]['text'] == buttons[2][2]['text'] != "":
            return buttons[0][0]['text']
        if buttons[0][2]['text'] == buttons[1][1]['text'] == buttons[2][0]['text'] != "":
            return buttons[0][2]['text']
        return ""

    def ai_move():
        empty_cells = [(i, j) for i in range(3) for j in range(3) if buttons[i][j]['text'] == ""]
        if empty_cells:
            i, j = random.choice(empty_cells)
            buttons[i][j]['text'] = 'O'
            if check_for_win() == 'O':
                messagebox.showinfo("Wygrana", "O wygrywa!")
                top.destroy()
            return True
        return False

    def on_click(i, j):
        nonlocal turn
        if buttons[i][j]['text'] == "" and turn == 'X':
            buttons[i][j]['text'] = 'X'
            if check_for_win() == 'X':
                messagebox.showinfo("Wygrana", "X wygrywa!")
                top.destroy()
            elif not ai_move():
                if not any(button['text'] == "" for row in buttons for button in row):
                    messagebox.showinfo("Remis", "Gra zakończona remisem!")
                    top.destroy()

    for i in range(3):
        for j in range(3):
            buttons[i][j] = tk.Button(top, font=('normal', 40), width=5, height=2,
                                      command=lambda i=i, j=j: on_click(i, j))
            buttons[i][j].grid(row=i, column=j)

# Funkcja logowania
def login():
    username = entry_username.get()
    password = entry_password.get()
    if username == "admin" and password == "admin":
        logging.info("Logowanie udane.")
        tic_tac_toe()
    else:
        logging.error("Logowanie nieudane. Błędna nazwa użytkownika lub hasło.")

root.mainloop()