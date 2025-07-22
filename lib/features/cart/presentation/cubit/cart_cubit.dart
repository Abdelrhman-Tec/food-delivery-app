import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/cart/presentation/cubit/cart_state.dart';
import 'package:food_app/features/home/data/model/product_model.dart';

class CartCubit extends Cubit<CartState> {
  final List<ProductModel> _productList = [];

  CartCubit() : super(CartIntial());

  void addToCart(ProductModel product) {
    final index = _productList.indexWhere((p) => p.name == product.name);
    if (index != -1) {
      final updatedProduct = _productList[index].copyWith(
        quantity: _productList[index].quantity + 1,
      );
      _productList[index] = updatedProduct;
    } else {
      _productList.add(product);
    }
    _emitUpdatedState();
  }

  void removeFromCart(ProductModel product) {
    _productList.removeWhere((p) => p.name == product.name);
    _emitUpdatedState();
  }

  void clearCart() {
    _productList.clear();
    _emitUpdatedState();
  }

  void increaseQuantity(ProductModel product) {
    final index = _productList.indexWhere((p) => p.name == product.name);
    if (index != -1) {
      final updatedProduct = _productList[index].copyWith(
        quantity: _productList[index].quantity + 1,
      );
      _productList[index] = updatedProduct;
      _emitUpdatedState();
    }
  }

  void decreaseQuantity(ProductModel product) {
    final index = _productList.indexWhere((p) => p.name == product.name);
    if (index != -1) {
      final currentQuantity = _productList[index].quantity;
      if (currentQuantity > 1) {
        final updatedProduct = _productList[index].copyWith(
          quantity: currentQuantity - 1,
        );
        _productList[index] = updatedProduct;
      } else {
        _productList.removeAt(index);
      }
      _emitUpdatedState();
    }
  }

  void _emitUpdatedState() {
    final total = _productList.fold<double>(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    emit(CartUpdate(prdouct: List.from(_productList), totalPrice: total));
  }
}
