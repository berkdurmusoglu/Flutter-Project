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
   - Eğer veri başarılı bir şekilde yüklenmişse, bir ListView kullanılarak kategoriler listelenir.
   - Her bir liste öğesi bir kategori adını gösterir ve tıklandığında, o kategoriye ait yemekleri listeleyen MealsScreen ekranına yönlendirir.

## meal_page.dart:
  - MealsScreen: Bu sınıf, belirli bir yemek kategorisindeki yemekleri listeler.
       * category: Bu değişken, ekranın hangi kategorideki yemekleri göstereceğini belirtir.
       * apiService: ApiService sınıfının bir örneği olup, API'den veri almak için kullanılır.
  - Eğer veri başarılı bir şekilde yüklenmişse, bir ListView kullanılarak yemekler listelenir.
  - Her bir liste öğesi yemeklerin adını gösterir ve tıklandığında, yemeğin detaylarını gösteren MealDetailScreen ekranına yönlendirir.

## meal_detail_page.dart:
  - MealDetailScreen: Bu sınıf, belirli bir yemeğin detaylarını gösterir.
       * id: Gösterilecek yemeğin benzersiz kimliğini belirtir.
       * apiService: ApiService sınıfının bir örneği olup, API'den veri almak için kullanılır.
  - Eğer veri başarılı bir şekilde yüklenmişse, yemeğin adı, resmi, kategorisi, bölgesi ve tarifi gibi bilgiler gösterilir.
       * Detaylar SingleChildScrollView içinde Column ile düzenlenmiş şekilde sunulur.
    
# ENG

## Geliştirme Ortamı:
  Developed using Android Studio. Android Studio's hot reload feature makes application development easier. That's why I chose to use Android Studio.

## apı_service.dart:
  - Allows the application to retrieve meal data. It is a service class that manages API calls. This class makes HTTP GET requests and converts the incoming JSON responses into Dart objects.
  - ApiService class has three basic functions:
       * getCategories: Gets all food categories.
       * getMealsByCategory: Gets meals belonging to a specific category.
       * getMealDetails: Gets the details of a specific meal.
  - These functions are used to retrieve data from the API and return the data if the request is successful, and throw an error if it fails. In this way, it becomes easier to access food data in different parts of the application.

## category_page.dart
   - CategoryScreen: This class is the main page of the application and lists all food categories.
        * apiService: An instance of the ApiService class, used to retrieve data from the API.
   - If the data is loaded successfully, the categories are listed using a ListView.
   - Each list item displays a category name and, when clicked, leads to the MealsScreen screen, which lists the dishes belonging to that category.

## meal_page.dart:
  - MealsScreen: This class lists meals from a specific meal category.
        * category: This variable specifies which category of dishes the screen will show.
        * apiService: An instance of the ApiService class, used to retrieve data from the API.
  - If the data is loaded successfully, the dishes are listed using a ListView.
  - Each list item shows the name of the meal and when clicked, it takes you to the MealDetailScreen screen showing the details of the meal.

## meal_detail_page.dart:
  - MealDetailScreen: This class shows the details of a particular dish.
        * id: Specifies the unique ID of the dish to be displayed.
        * apiService: An instance of the ApiService class, used to retrieve data from the API.
  - If the data is loaded successfully, information such as the name, image, category, region and recipe of the dish will be displayed.
        * Details are presented arranged by Column in SingleChildScrollView.

 
	
