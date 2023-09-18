import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trizi/domain/exceptions/database_exception.dart';
import 'package:trizi/domain/models/pagination.dart';
import 'package:trizi/domain/models/product.dart';
import 'package:trizi/utils/http_router.dart';

class ProductRepository {
  Future<Pagination<Product>> getAll() async {
    final url = Uri.parse('$apiPath/products?page=0&size=10');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonProducts = json.decode(response.body);
      final products = (jsonProducts['content'] as List)
          .map((e) => Product.fromJson(e))
          .toList();

      final pagination = Pagination<Product>(content: products);

      return pagination;
    }
    throw DatabaseException('Erro ao buscar produtos.');
  }
}
