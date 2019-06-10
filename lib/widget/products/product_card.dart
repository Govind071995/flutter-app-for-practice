import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';
import '../../models/produc.dart';
import '../../scoped-models/main.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;
  ProductCard(this.product, this.productIndex);

  Widget _buildActionButtonBar(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              color: Theme.of(context).accentColor,
              onPressed: () => Navigator.pushNamed<bool>(
                    context,
                    '/product/' + model.allProducts[productIndex].id,
                  ),
            ),
            IconButton(
              icon: Icon(model.allProducts[productIndex].isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              color: Colors.red,
              onPressed: () {
                model.selectProduct(model.allProducts[productIndex].id);
                model.toggleProductFavoritesStatus();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        FadeInImage(
          image: NetworkImage(product.image),
          placeholder: AssetImage('assets/food.jpg'),
          height: 300.0,
          fit: BoxFit.cover,
        ),
        // SizedBox(height: 10.0,),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 10,
                child: TitleDefault(product.title),
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                flex: 10,
                child: Pricetag(product.price.toString()),
              )
            ],
          ),
        ),
        AddressTag("815, Valuebound conslatncies Services llp."),
        Text(product.userEmail),
        _buildActionButtonBar(context)
      ]),
    );
  }
}
