import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/product.dart';
import 'package:flutter_shop_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // ProductItem(
  //   this.id,
  //   this.title,
  //   this.imageUrl,
  // );
  // final String id;
  // final String title;
  // final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final singleProduct = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        10,
      ),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: singleProduct.id,
            );
          },
          child: Image.network(
            singleProduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              color: Colors.red,
              icon: singleProduct.isFavorite
                  ? const Icon(
                      Icons.favorite,
                    )
                  : const Icon(
                      Icons.favorite_border,
                    ),
              onPressed: () => singleProduct.changeFavoriteStatus(),
            ),
          ),
          title: Text(
            singleProduct.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
