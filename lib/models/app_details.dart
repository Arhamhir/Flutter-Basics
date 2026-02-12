import 'package:flutter/material.dart';

class AppDetails {
  final String name;
  final String version;
  final String developer;
  final String description;
  final bool isSelected;
  final Icon icon;
  final Color backgroundColor;

  AppDetails({
    required this.name,
    required this.version,
    required this.developer,
    required this.description,
    required this.isSelected,
    required this.icon,
    required this.backgroundColor,
  });

  static List<AppDetails> getDetails() {
    List<AppDetails> details = [];
    details.add(
      AppDetails(
        name: 'Android',
        version: '1.0.0',
        developer: 'Google LLC',
        description: 'The Android operating system for mobile devices.',
        isSelected: false,
        icon: Icon(Icons.adb_rounded, color: Colors.orange),
        backgroundColor: Colors.orange,
      ),
    );
    details.add(
      AppDetails(
        name: 'Apple',
        version: '2.1.0',
        developer: 'Apple Inc.',
        description: 'The iOS operating system for iPhones and iPads.',
        isSelected: false,
        icon: Icon(Icons.apple, color: Colors.green),
        backgroundColor: Colors.green,
      ),
    );
    details.add(
      AppDetails(
        name: 'Guy',
        version: '3.2.5',
        developer: 'Guy Software',
        description: 'A productivity app for managing tasks and projects.',
        isSelected: false,
        icon: Icon(Icons.add_reaction_outlined, color: Colors.blue),
        backgroundColor: Colors.blue,
      ),
    );
    details.add(
      AppDetails(
        name: 'Kid',
        version: '4.0.3',
        developer: 'Kid Tech',
        description: 'An educational app for children to learn and play.',
        isSelected: false,
        icon: Icon(Icons.child_care_sharp, color: const Color.fromARGB(255, 1, 195, 175)),
        backgroundColor: const Color.fromARGB(255, 1, 195, 175)
      ),
    );
    details.add(
      AppDetails(
        name: 'Bunny',
        version: '5.5.1',
        developer: 'Bunny Studios',
        description: 'A fun and interactive game featuring a bunny character.',
        isSelected: false, 
        icon: Icon(Icons.cruelty_free_outlined, color: Colors.cyan),
        backgroundColor: Colors.cyan,
      ),
    );
    return details;
  }
}
