import 'package:ecommerce_app/models/cart_item.dart';
import 'package:ecommerce_app/stateManagement/notifiers/cart_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier());
