import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/product_cubit.dart';
import 'package:trizi/utils/custom_styles.dart';
import 'package:trizi/view/shared/components/on_error_widget.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  late final ProductCubit productCubit;

  @override
  void initState() {
    productCubit = BlocProvider.of<ProductCubit>(context);
    productCubit.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder(
          bloc: productCubit,
          builder: (context, state) {
            if (state is ProductLoading) {
              return const CircularProgressIndicator();
            }
            if (state is ProductLoaded) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Container>.generate(
                    state.products!.content!.length,
                    (index) {
                      final productData = state.products?.content?[index];
                      return Container(
                        width: 200,
                        height: 200,
                        margin: const EdgeInsets.all(8.0),
                        child: Card(
                          color: CustomColor.CONTAINER_PRODUCT_COLOR,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                          elevation: 4,
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 50,
                                  right: 50,
                                  child: Image.network(
                                    productData?.productImage ??
                                        "Nenhuma imagem disponível",
                                    height: 100,
                                    width: 100,
                                  )),
                              Positioned(
                                  top: 100,
                                  left: 50,
                                  right: 50,
                                  child: Text(productData?.description ??
                                      "Nenhuma descrição encontrada")),
                                       Positioned(
                                  top: 150,
                                  left: 50,
                                  right: 50,
                                  child: Text('${productData?.quantity}+ Produtos' ??
                                      '0', style: const TextStyle(
                                        fontFamily: 'Dmsans-light'
                                      ),))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            if (state is ProductError) {
              return OnErrorWidget(
                  btnText: 'btnText',
                  title: 'title',
                  content: 'content',
                  onConfirmBtnTap: () => Navigator.of(context).pop());
            }
            throw Exception('Caiu na Exception do Cubit do list_product');
          },
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, size.height * 2, size.width,
        size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
