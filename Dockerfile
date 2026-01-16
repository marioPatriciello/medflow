# Usa l'immagine base di Python
FROM python:3.11-slim-bullseye

# Imposta la cartella di lavoro dentro il container
WORKDIR /app

# 1. Copia il file dei requisiti (requirements.txt)
# Assicurati che questo file sia nella cartella principale del tuo progetto su GitHub
COPY requirements.txt .

# 2. Installa le librerie
RUN pip install --no-cache-dir -r requirements.txt

# 3. Copia TUTTO il resto del tuo codice (che Render ha già scaricato) dentro il container
# Questo sostituisce il "git clone"
COPY . .

# Esponi la porta (se usi Streamlit solitamente è la 8501, se usi altro lascia 7860)
EXPOSE 7860

# Comando per avviare l'app (Esempio: modifica 'app.py' con il nome del tuo file principale)
CMD ["python", "run.py"]
