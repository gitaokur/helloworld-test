# 1. Temel imaj olarak hafif bir Python sürümü seçiyoruz
FROM python:3.10-slim

# 2. Konteyner içindeki çalışma dizinini belirliyoruz
WORKDIR /app

# 3. Önce sadece requirements dosyasını kopyalıyoruz (Docker cache optimizasyonu için)
COPY requirements.txt .

# 4. Kütüphaneleri kuruyoruz
RUN pip install --no-cache-dir -r requirements.txt

# 5. Kodun geri kalanını kopyalıyoruz
COPY . .

# 6. Uygulamayı ayağa kaldırıyoruz (Gunicorn kullanarak, daha stabil bir sunucu)
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]
