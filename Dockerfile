FROM python:3.10.12-slim

WORKDIR /app
COPY . /app

# pip, wheel güncelle
RUN pip install --upgrade pip wheel

# Binary wheel’leri tercih et
RUN pip install --prefer-binary -r requirements.txt

# Port belirt (Flask default 5000)
EXPOSE 5000

# Uygulamayı başlat
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
