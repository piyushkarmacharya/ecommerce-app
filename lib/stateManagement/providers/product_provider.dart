import "package:ecommerce_app/models/product.dart";
import "package:ecommerce_app/stateManagement/notifiers/product_notifier.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>>(
    (ref) => ProductNotifier());
