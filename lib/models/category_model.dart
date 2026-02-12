import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final Icon icon;
  final Color backgroundColor;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.backgroundColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(
      CategoryModel(
        name: 'Android',
        icon: Icon(Icons.adb_rounded, color: Colors.orange),
        backgroundColor: Colors.orange,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Guy',
        icon: Icon(Icons.add_reaction_outlined, color: Colors.blue),
        backgroundColor: Colors.blue,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Apple',
        icon: Icon(Icons.apple, color: Colors.green),
        backgroundColor: Colors.green,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Kid',
        icon: Icon(Icons.child_care_sharp, color: Colors.purple),
        backgroundColor: Colors.purple,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Bunny',
        icon: Icon(Icons.cruelty_free_outlined, color: Colors.cyan),
        backgroundColor: Colors.cyan,
      ),
    );
    return categories;
  }
}
