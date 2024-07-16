import 'package:flutter/material.dart';

class PopularDishes extends StatefulWidget {
  const PopularDishes({super.key});

  @override
  State<PopularDishes> createState() => _PopularDishes();
}

class _PopularDishes extends State<PopularDishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
