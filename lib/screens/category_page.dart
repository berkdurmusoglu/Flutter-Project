import 'package:flutter/material.dart';
import '../api_service.dart';
import 'meal_page.dart';

class CategoryScreen extends StatelessWidget {
  final ApiService apiService =
      ApiService(); //API servisinden veri çekmek için bir API service nesnesi oluşturuluyor.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Categories'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.getCategories(),
        //API'dan kategoriler alınmaya başlıyor.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //Veri yüklemesi tamamlanana kadar yükleme işareti gösteriliyor.
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final categories =
                snapshot.data!; // API'dan gelen kategoriler alınıyor.
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category =
                    categories[index]; // Belirli bir kategoriye erişiliyor.
                return ListTile(
                  title: Text(category['strCategory']),
                  // Kategorinin adı listeye ekleniyor.
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MealsScreen(category: category['strCategory']),
                        // Tıklanan kategoriye göre yemeklerin listelendiği sayfaya yönlendirme yapılıyor.
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
