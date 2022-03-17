import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/product_provider.dart';
import 'package:flutter_shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductGrid extends StatelessWidget {
  ProductGrid(this.showFabs);

  final bool showFabs;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final products = showFabs ? productData.favItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        // create: (c) => products[index],
        value: products[index],
        child: ProductItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageUrl,
            ),
      ),
    );
  }
}
