import 'package:flutter/material.dart';

class PopularApps {
  final String name;
  final Icon icon;
  final String popularityReason;

  PopularApps({
    required this.name,
    required this.icon,
    required this.popularityReason,
  });

  static List<PopularApps> getPopularApps() {
    List<PopularApps> popularApps = [];
    popularApps.add(
      PopularApps(
        name: 'Android',
        icon: Icon(Icons.adb_rounded, color: Colors.orange),
        popularityReason: 'Most widely used mobile operating system.',
      ),
    );
    popularApps.add(
      PopularApps(
        name: 'Apple',
        icon: Icon(Icons.apple, color: Colors.green),
        popularityReason:
            'Known for its sleek design and user-friendly interface.',
      ),
    );
    popularApps.add(
      PopularApps(
        name: 'Guy',
        icon: Icon(Icons.add_reaction_outlined, color: Colors.blue),
        popularityReason: 'A productivity app for managing tasks and projects.',
      ),
    );
    popularApps.add(
      PopularApps(
        name: 'Kid',
        icon: Icon(Icons.child_care_sharp, color: Colors.purple),
        popularityReason: 'An educational app for children to learn and play.',
      ),
    );
    popularApps.add(
      PopularApps(
        name: 'Bunny',
        icon: Icon(Icons.cruelty_free_outlined, color: Colors.cyan),
        popularityReason: 'A fun and addictive game for all ages.',
      ),
    );
    return popularApps;
  }
}
