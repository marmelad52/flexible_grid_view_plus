import 'package:flexible_grid_view_example/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:flexible_grid_view_plus/flexible_grid_view.dart';

import 'catalog_card.dart';

void main() => runApp(const RootWidget());

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible grid view',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.greenAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flexible grid view example'),
        ),
        body: FlexibleGridView(
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: demoData.map((e) => CatalogCard(catalogItem: e)).toList(),
        ),
      ),
    );
  }
}
