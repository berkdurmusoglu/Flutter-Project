import 'package:flutter/material.dart';
import '../api_service.dart';

class MealDetailScreen extends StatelessWidget {
  final String id; // Gösterilecek yemeğin anahtarı
  final ApiService apiService =
      ApiService(); //API servisinden veri çekmek için bir API service nesnesi oluşturuluyor.

  MealDetailScreen(
      {required this.id}); //Giris parametresi olarak bir yemek kimliği alır.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: FutureBuilder<dynamic>(
        future: apiService.getMealDetails(id),
        // API'den belirli yemeğin detaylarını almak için bir istek yapılır.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); //Veri yüklemesi tamamlanana kadar yükleme işareti gösteriliyor.
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final meal = snapshot.data!; // API'den gelen yemek verisi alınır.
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal['strMeal'], // Yemeğin adı başlık olarak gösterilir.
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Image.network(meal['strMealThumb']),
                    // Yemeğin görseli gösterilir.
                    SizedBox(height: 16),
                    Text(
                      'Category: ${meal['strCategory']}',
                      // Yemeğin kategorisi gösterilir.
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Area: ${meal['strArea']}', // Yemeğin ülkesi gösterilir.
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Text(
                      meal['strInstructions'], // Yemeğin tarifi gösterilir.
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
