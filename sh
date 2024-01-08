import tkinter as tk
import logging
import random
import time
import math

# Ustawienie loggera
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Definicje funkcji pomocniczych

class TextHandler(logging.Handler):
    """Klasa do obsługi logowania - przekierowuje logi do widgetu Tkinter Text"""
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

def fake_weather_data():
    """Symuluje dane pogodowe i loguje je"""
    weather_conditions = ["słonecznie", "pochmurno", "deszczowo", "śnieżnie"]
    temperature = random.randint(-10, 35)
    condition = random.choice(weather_conditions)
    logging.info(f"Pogoda na dziś: {condition}, temperatura: {temperature} stopni C.")

def long_initialization_process():
    """Symuluje długi proces inicjalizacji i loguje postęp z losowym wzrostem procentowym"""
    logging.info("Rozpoczynanie długiego procesu inicjalizacyjnego...")
    percentage = 0
    while percentage < 100:
        increment = random.randint(1, 10)
        percentage += increment
        percentage = min(percentage, 100)
        logging.info(f"Inicjalizacja... {percentage}%")
        time.sleep(0.1)  # symulacja długiego procesu
    logging.info("Inicjalizacja zakończona.")

def calculate_collision_time():
    """Oblicza czas zderzenia dwóch ciał"""
    t = 0
    dt = 0.001
    while True:
        y1 = 50 * t - 4.905 * t ** 2
        y2 = 200 - 4.905 * t ** 2

        if math.isclose(y1, y2, abs_tol=0.001):
            return t
        t += dt

def login():
    """Funkcja obsługująca logowanie i uruchamiająca symulację zderzenia"""
    username = entry_username.get()
    password = entry_password.get()
    if username == "admin" and password == "admin":
        logging.info("Logowanie udane.")
        # Uruchamianie symulacji zderzenia po udanym zalogowaniu
        collision_time = calculate_collision_time()
        logging.info(f"Ciała zderzą się w sekundzie: {collision_time:.3f} s.")
    else:
        logging.error("Logowanie nieudane. Błędna nazwa użytkownika lub hasło.")

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

# Uruchomienie symulacji danych pogodowych i procesu inicjalizacji w tle
fake_weather_data()
long_initialization_process()

root.mainloop() dodaj wykres rysowany za pomocą bibloteki turtle