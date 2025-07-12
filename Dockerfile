FROM python:3.10.12-slim

# Sistem bağımlılıklarını yükle
RUN apt-get update && apt-get install -y \
    libcairo2 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libgdk-pixbuf2.0-0 \
    libffi-dev \
    shared-mime-info \
 && rm -rf /var/lib/apt/lists/*

# Uygulama kodunu ekleyin
COPY . /app
WORKDIR /app

# Python bağımlılıklarını yükleyin
RUN pip install --upgrade pip wheel
RUN pip install --prefer-binary -r requirements.txt

# Çalıştırma komutu
CMD ["sh", "-c", "gunicorn app:app --bind 0.0.0.0:${PORT}"]
