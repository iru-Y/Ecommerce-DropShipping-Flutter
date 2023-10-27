import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trizi/domain/models/pagination.dart';
import 'package:trizi/domain/models/product.dart';
import 'package:trizi/domain/repositories/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final ProductRepository productRepository = ProductRepository();

  Future<void> getAll() async {
    emit(ProductLoading());
    try {
      emit(ProductLoaded(products: await productRepository.getAll()));
    } catch (e) {
      emit(ProductError());
      rethrow;
    }
  }

  Future<Product?> getByDescription(String description) async {
    emit(ProductLoading());
    try {
      emit(ProductLoaded(
          product: await productRepository.getByDescription(description)));
    } catch (e) {
      emit(ProductError());
      rethrow;
    }
    return null;
  }
}
