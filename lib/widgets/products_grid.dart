import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  int showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    var products;
    // final products = showFavs ? productData.favoriteItems : productData.items;

    if (showFavs == 0) {
      products = productData.items;
    } else if (showFavs == 1) {
      products = productData.favoriteItems;
    } else {
      products = productData.notFavorite;
    }
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider<Product>.value(
        value: products[index],
        //create: (c) => products[index],
        child: ProductItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
    );
  }
}
