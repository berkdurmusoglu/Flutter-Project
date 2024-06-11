import 'package:flutter/material.dart';
import '../api_service.dart';

import 'meal_detail_page.dart';

class MealsScreen extends StatelessWidget {
  final String category;
  final ApiService apiService =
      ApiService(); //API servisinden veri çekmek için bir API service nesnesi oluşturuluyor.

  MealsScreen(
      {required this.category}); //Giris parametresi olarak bir kategori adı alır.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals in $category'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.getMealsByCategory(category),
        // API'den belirli kategorideki yemekleri almak için bir istek yapılır.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); //Veri yüklemesi tamamlanana kadar yükleme işareti gösteriliyor.
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Eğer veri yüklenirken hata oluşursa hatayı gösteren bir metin gösterilir.
          } else {
            final meals = snapshot.data!; // API'den gelen yemek verisi alınır.
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index]; // Belirli bir yemeğe erişilir.
                return ListTile(
                  title: Text(meal['strMeal']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealDetailScreen(
                            id: meal[
                                'idMeal']), // Tıklanan yemeğin detaylarını gösteren sayfaya yönlendirme yapılır.
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
