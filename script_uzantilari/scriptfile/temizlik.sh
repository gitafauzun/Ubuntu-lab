#!/bin/bash

# --- DEĞİŞKENLER ---
HEDEF_KLASOR="$HOME/myfile"
LOG_DOSYASI="$HOME/myfile/temizlik_raporu.txt"
TARIH=$(date "+%Y-%m-%d %H:%M:%S")

echo "-----------------------------------------------"
echo "Temizlik ve Analiz İşlemi Başladı: $TARIH"
echo "Tarama Yapılan Dizin: $HEDEF_KLASOR"

# --- KONTROL MEKANİZMASI ---
# Klasör var mı diye bakıyoruz
if [ -d "$HEDEF_KLASOR" ]; then
    echo "[OK] Klasör bulundu, tarama yapılıyor..."
else
    echo "[HATA] $HEDEF_KLASOR bulunamadı! Script durduruluyor."
    exit 1
fi

# --- İŞLEM: BOŞ DOSYALARI BUL ---
# 'find' komutu tipik bir DevOps kahramanıdır.
# -type f: Sadece dosyaları bul
# -empty: İçeriği boş olanları seç
echo "Boş dosyalar tespit ediliyor..."
find "$HEDEF_KLASOR" -type f -empty > "$LOG_DOSYASI"

# --- SONUÇ ---
DOSYA_SAYISI=$(wc -l < "$LOG_DOSYASI")
echo "İşlem Tamamlandı!"
echo "Tespit edilen boş dosya sayısı: $DOSYA_SAYISI"
echo "Detaylı liste şurada oluşturuldu: $LOG_DOSYASI"
echo "-----------------------------------------------"
