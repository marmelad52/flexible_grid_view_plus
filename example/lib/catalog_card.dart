import 'package:flexible_grid_view_example/menu_item_model.dart';
import 'package:flutter/material.dart';

class CatalogCard extends StatelessWidget {
  const CatalogCard({super.key, required this.catalogItem});

  final MenuItemModel catalogItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 12,
            child: Image.asset(
              catalogItem.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            catalogItem.name,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Spacer(),
          OutlinedButton.icon(
            onPressed: () {},
            label: Text('\$${catalogItem.price}'),
            icon: const Icon(Icons.add_shopping_cart),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
