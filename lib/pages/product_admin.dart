import 'package:flutter/material.dart';

import '../scoped-models/main.dart';
import './product_edit.dart';
import './product_list.dart';
import '../widget/ui_elements/logout_list_tile.dart';

class ProductAdminPage extends StatelessWidget {
  final MainModel model;
  ProductAdminPage(this.model);

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
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          Divider(),
          LogoutListTile(),
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
          children: <Widget>[ProductEditPage(), ProductListPage(model)],
        ),
      ),
    );
  }
}
