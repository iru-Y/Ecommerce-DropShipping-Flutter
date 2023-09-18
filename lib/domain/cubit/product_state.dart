part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final Pagination<Product>? products;
  final Product? product;

  ProductLoaded({this.products, this.product});

  @override
  String toString() {
    return '$products';
  }
}

final class ProductError extends ProductState {}
