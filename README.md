# Mobile Application Project
ERCİYES ÜNİVERSİTESİ

BİLGİSAYAR MÜHENDİSLİĞİ

Dr. Öğr. Üyesi FEHİM KÖYLÜ

Mobile Application Development Dersi Final Proje Ödevi

1030510184  -  Berk Avni Durmuşoğlu

## Geliştirme Ortamı:
  Android Studio kullanılarak geliştirilmiştir. Android Studio'nun hot reload özelliği uygulama geliştirmeyi kolaylaştırmaktadır. Bu yüzden Android Studio kullanmayı tercih ettim.

## apı_service.dart:
  - Uygulamanın, yemek verilerini almasını sağlar. API çağrılarını yöneten bir servis sınıfıdır. Bu sınıf, HTTP GET istekleri yapar ve gelen JSON yanıtlarını Dart nesnelerine dönüştürür.
  - ApiService sınıfında üç temel fonksiyon bulunur:
       * getCategories: Tüm yemek kategorilerini alır.
       * getMealsByCategory: Belirli bir kategoriye ait yemekleri alır.
       * getMealDetails: Belirli bir yemeğin detaylarını alır.
  - Bu fonksiyonlar, API'den veri almak için kullanılır ve istek başarılı olursa verileri döner, başarısız olursa hata fırlatır. Bu sayede, uygulamanın farklı bölümlerinde yemek verilerine erişim kolaylaşır.

 ## category_page.dart
   - CategoryScreen: Bu sınıf, uygulamanın ana sayfasıdır ve tüm yemek kategorilerini listeler.
        * apiService: ApiService sınıfının bir örneği olup, API'den veri almak için kullanılır.
   - Eğer veri yükleniyorsa, bir CircularProgressIndicator gösterilir.
   - Eğer veri başarılı bir şekilde yüklenmişse, bir ListView kullanılarak kategoriler listelenir.
   - Her bir liste öğesi (ListTile), kategorinin adını gösterir ve tıklandığında, o kategoriye ait yemekleri listeleyen MealsScreen ekranına yönlendirir.

## meal_page.dart:
  - MealsScreen: Bu sınıf, belirli bir yemek kategorisindeki yemekleri listeler.
       * category: Bu değişken, ekranın hangi kategorideki yemekleri göstereceğini belirtir.
       * apiService: ApiService sınıfının bir örneği olup, API'den veri almak için kullanılır.
  - Eğer veri yükleniyorsa, bir CircularProgressIndicator gösterilir.
  - Eğer veri başarılı bir şekilde yüklenmişse, bir ListView kullanılarak yemekler listelenir.
  - Her bir liste öğesi (ListTile), yemeğin adını gösterir ve tıklandığında, yemeğin detaylarını gösteren MealDetailScreen ekranına yönlendirir.

## meal_detail_page.dart:
  - MealDetailScreen: Bu sınıf, belirli bir yemeğin detaylarını gösterir.
       * id: Gösterilecek yemeğin benzersiz kimliğini belirtir.
       * apiService: ApiService sınıfının bir örneği olup, API'den veri almak için kullanılır.
  - Eğer veri yükleniyorsa, bir CircularProgressIndicator gösterilir.
  - Eğer veri başarılı bir şekilde yüklenmişse, yemeğin adı, resmi, kategorisi, bölgesi ve tarifi gibi bilgiler gösterilir.
       * Detaylar SingleChildScrollView içinde Column ile düzenlenmiş şekilde sunulur.
    


 
	
