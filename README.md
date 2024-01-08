# ... [Importy i definicje klas które już masz w kodzie] ...

from tkinter import messagebox
import random

# ... [Pozostały kod] ...

def tic_tac_toe():
    top = Toplevel(root)
    top.title('Kółko i Krzyżyk')

    # Ustawienia wstępne
    turn = 'X'  # X zaczyna grę

    # Funkcje gry
    def check_for_win():
        # ... [Funkcja sprawdzająca warunki wygranej] ...

    def ai_move():
        # Wybór wolnych miejsc
        empty_cells = [(i, j) for i in range(3) for j in range(3) if buttons[i][j]['text'] == ""]
        if empty_cells:  # Jeśli są wolne miejsca
            i, j = random.choice(empty_cells)  # AI wybiera losowe wolne miejsce
            buttons[i][j].config(text='O')  # Umieszczanie O
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
            elif not ai_move():  # Jeśli AI nie wykona ruchu (brak wolnych miejsc), gra się kończy
                messagebox.showinfo("Remis", "Gra zakończona remisem!")
                top.destroy()
            # Nie zmieniaj tury na O, ponieważ AI już wykonało ruch

    buttons = [[None, None, None], [None, None, None], [None, None, None]]
    for i in range(3):
        for j in range(3):
            buttons[i][j] = tk.Button(top, font=('normal', 40), width=5, height=2,
                                      command=lambda i=i, j=j: on_click(i, j))
            buttons[i][j].grid(row=i, column=j)

# ... [Pozostały kod] ...

# W funkcji login() po pomyślnym zalogowaniu uruchom grę w kółko i krzyżyk
def login():
    # ... [Funkcja obsługująca logowanie] ...
    # Bez zmian

# ... [Pozostały kod] ...