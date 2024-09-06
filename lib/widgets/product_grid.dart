import 'package:ecommerce_app/screens/products_overview_screen.dart';
import 'package:ecommerce_app/stateManagement/providers/product_provider.dart';
import 'package:ecommerce_app/widgets/product_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductGrid extends ConsumerWidget {
  final Filter selectedFilter;
  const ProductGrid({super.key, required this.selectedFilter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = selectedFilter == Filter.fav
        ? ref.watch(productProvider.notifier).getFavProduct()
        : ref.watch(productProvider);
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, i) {
          return ProductItem(id: products[i].id);
        });
  }
}
