import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/product_cubit.dart';
import 'package:trizi/domain/models/product.dart';
import 'package:trizi/utils/custom_styles.dart';
import 'package:trizi/view/shared/components/on_error_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final ProductCubit productCubit;
  Product? product;
 
  final productController = TextEditingController();

  @override
  void initState() {
    productCubit = BlocProvider.of<ProductCubit>(context);
    super.initState();
  }

  Future<void> _search(String description) async {
    var result = await productCubit.getByDescription(description);
    setState(() {
      product = result;
    });

    print('_search result = $result');
    print('product?.productImage = ${product?.productImage}');
    print('product: $product');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder(
        bloc: productCubit,
        builder: (context, state) {
          if (state is ProductLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ProductLoaded) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColor.SEARCH_BAR,
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Pesquise na Store',
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                    controller: productController,
                    onSubmitted: (_) async {
                      await _search(productController.text);
                    },
                  ),
                ),
               
              ],
            );
          }
          if (state is ProductError) {
            return OnErrorWidget(
              btnText: 'btnText',
              title: 'title',
              content: 'content',
              onConfirmBtnTap: () => Navigator.of(context).pop(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
