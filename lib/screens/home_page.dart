import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'cart_page.dart'; // Ensure this file exists and contains the CartPage widget.
import '../service/data_service.dart';
import '../screens/dishes/popular_dishes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> categories = [];
  List<dynamic> populars = [];
  List<dynamic> specials = [];

  @override
  void initState() {
    super.initState();
    DataService().fetchCategories().then((categori) {
      setState(() {
        categories = categori;
      });

      DataService().fetchPopulars().then((pop) {
        setState(() {
          populars = pop;
        });
      });
    });

    DataService().fetchSpecials().then((special) {
      setState(() {
        specials = special;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yummie', style: TextStyle(color: Colors.pink)),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Food Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories
                      .map((category) => _buildCategoryCard(
                          category['title'], category['image']))
                      .toList(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Popular Dishes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: populars
                          .map((popular) => _buildPopulerCard(
                              popular['name'],
                              popular['image'],
                              popular['calories'],
                              popular['description']))
                          .toList())),
              const Text("Chef's Specials",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: specials
                          .map((special) => _buildSpecialCard(special['name'],
                              special['image'], special['description']))
                          .toList())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Chip(
        label: Text(title),
        avatar: CircleAvatar(
          backgroundImage: NetworkImage(imagePath),
          backgroundColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildPopulerCard(
      String title, String imagePath, int calories, String description) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: (){
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PopularDishes()),
              );
          },
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Image.network(
              imagePath,
              fit: BoxFit.cover,
              width: 150,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 5),
                  Text('$calories calories',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  Text(
                    description.length > 30
                        ? '${description.substring(0, 30)}...'
                        : description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  )
                ],
              ),
            )
          ],
        ),
        ),
      ),
    );
  }

  
 
   Widget _buildSpecialCard(String name, String imagePath, String description) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // Tıklama olayında yapılacak işlemler burada
            print('$name tapped!');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                imagePath,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
               
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description.length > 30
                          ? '${description.substring(0, 30)}...'
                          : description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}