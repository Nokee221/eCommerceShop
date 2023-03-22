import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ecommerce/repositories/product/product_repository.dart';

import '../../models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProducttoState();
    }
    if (event is UpdateProducts) {
      yield* _mapUpdateProducttoState(event);
    }
  }

  Stream<ProductState> _mapLoadProducttoState() async* {
    _productSubscription?.cancel();
    _productSubscription = _productRepository
        .getAllProducts()
        .listen((products) => add(UpdateProducts(products)));
  }

  Stream<ProductState> _mapUpdateProducttoState(
      UpdateProducts event) async* {
    yield ProductLoaded(products: event.products);
  }
}
