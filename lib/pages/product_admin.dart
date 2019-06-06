import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;

  final List<Map<String, dynamic>> products;

  ProductAdminPage(this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  Widget _buildNavigaionDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('choose'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All Product'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildNavigaionDrawer(context),
        appBar: AppBar(
          title: Text('Manage Product'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Add Products',
              ),
              Tab(
                text: 'All Products',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(addProduct: addProduct),
            ProductListPage(products, updateProduct, deleteProduct)
          ],
        ),
      ),
    );
  }
}
