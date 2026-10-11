
# Mini Katalog Uygulaması - Mert Store

Flutter kullanılarak geliştirilen bir mobil ürün katalog uygulamasıdır. Kullanıcılar ürünleri inceleyebilir, arama yapabilir, ürün detaylarını görüntüleyebilir ve alışveriş sepetlerini yönetebilir.

Bu projeyi Flutter öğrenme sürecimde geliştirdim. Ürün listeleme, API'den veri çekme, sayfalar arası geçiş, arama ve sepet işlemleri gibi temel konuları uygulamalı olarak deneyimlemek istedim.

## Kullanılan Teknolojiler
- Flutter
- Dart
- Shared Preferences
- HTTP API ve JSON

Ürün API'yı:  https://wantapi.com/products.php

## Flutter Sürümü
- Flutter: 3.47.7
- Dart: 3.13.5

## Gereksinimler
- Flutter SDK
- Dart SDK
- Visual Studio Code veya uyumlu bir kod editörü
- Android Emulator veya fiziksel bir Android cihaz
- Android Emulator kullanılıyorsa Android Studio


## Kurulum ve Çalıştırma

**Shared prefences olduğu için 'flutter pub' get komutunu çalıştırmayı unutmayın!**

1. Projeyi GitHub üzerinden bilgisayarınıza klonlayın:
    - git clone https://github.com/mert-unl/mini_catalog_app

2. Proje klasörüne girin:
    - cd mini_catalog_app

3. Gerekli paketleri yükleyin:
    - flutter pub get

4. Android Emulatorünüzü başlatın. 
    - Android Studio - Virtual Device Manager

5. Terminalden uygulamayı çalıştırın:
    -  flutter run


## Özellikler
- **Ürün Kataloğu:** Ürünleri görsel, isim, kısa açıklama ve fiyat bilgileriyle ızgara düzeninde görüntüleme.
- **Ürün Detayları:** Ürünlerin detaylı bilgilerini görüntüleme.
- **Arama ve Filtreleme:** Ürünleri isimlerine göre arama ve listeyi anlık olarak filtreleme.
- **Alışveriş Sepeti:** Sepete ürün ekleme ve sepetten ürün silme.
- **Toplam Fiyat Hesaplama:** Sepetteki ürünlerin toplam fiyatını otomatik hesaplama ve görüntüleme.
- **Kalıcı Sepet Kaydı:** `shared_preferences` kullanarak sepet bilgilerini cihazda saklama ve uygulama yeniden açıldığında kayıtlı olarak yükleme.
- **JSON Veri Modeli:** `fromJson()` ve `toJson()` metotlarıyla JSON verilerini Dart nesnelerine dönüştürme ve tekrar JSON formatına çevirme.
- **API Entegrasyonu:** Ürün bilgilerini örnek bir API üzerinden alma.
- **Sayfa Geçişleri:** Ana katalog, ürün detayları ve sepet ekranları arasında gezinme.


## Proje Dosya Yapısı
- `main.dart` — Uygulamanın başlangıç noktası, ana sayfa ve gezinme işlemleri.
- `product.dart` — Ürün veri modeli ve JSON dönüştürme metotları.
- `products_service.dart` — API üzerinden ürün verilerini alma işlemleri.
- `product_card.dart` — Ürün kartı ve ilgili ürün etkileşimleri.
- `cart.dart` — Sepet yönetimi ve yerel depolama işlemleri.
- `cart_page.dart` — Sepet ekranı, ürün silme ve toplam fiyat hesaplama.