import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import '../../models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {}
  }

  void _onAddProduct(AddProduct event, Emitter<CartState> emit) async {
    if (this.state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from((this.state as CartLoaded).cart.products)
                ..add(event.product),
            ),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onRemoveProduct(RemoveProduct event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
          cart: Cart(
            products: List.from((this.state as CartLoaded).cart.products)
              ..remove(event.product),
          ),
        ));
      } catch (_) {}
    }
  }

}
