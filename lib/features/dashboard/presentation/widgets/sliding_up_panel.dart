import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/categories/presentation/pages/all_categories.dart';
import 'package:business_tracker/features/expenses/presentation/pages/all_expenses.dart';
import 'package:business_tracker/features/investments/presentation/pages/investment_in_or_out_page.dart';
import 'package:business_tracker/features/products/presentation/pages/add_product.dart';
import 'package:business_tracker/features/products/presentation/pages/all_products.dart';
import 'package:business_tracker/features/sales/presentation/pages/add_sale.dart';
import 'package:business_tracker/features/settings/presentation/pages/settings_page.dart';
import 'package:business_tracker/features/vendor/presentation/pages/all_vendors.dart';
import 'package:business_tracker/features/warehouse/presentation/pages/all_warehouses.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widgets/buttons/custom_tile_button.dart';

class SlidingUpPanelWidget extends StatelessWidget {
  SlidingUpPanelWidget({super.key});

  void _navigateToSettings(BuildContext context) {
    Navigator.pushNamed(context, SettingsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    var slidingPanelTopRadius = dimensions.screenWidth * .040;
    final List<Map<String, dynamic>> tiles = [
      {
        'icon': Icons.inventory,
        'text': 'Products',
        'onPressed': () {
          Navigator.of(context).pushNamed(AllProducts.routeName);
        }
      },
      {
        'icon': Icons.inventory,
        'text': 'Vendors',
        'onPressed': () {
          Navigator.of(context).pushNamed(AllVendorsPage.routeName);
        }
      },
      {
        'icon': Icons.house,
        'text': 'Warehouses',
        'onPressed': () {
          Navigator.of(context).pushNamed(AllWarehousesPage.routeName);
        }
      },
      {
        'icon': Icons.man_2,
        'text': 'Investors',
        'onPressed': () {
          // Navigator.of(context).pushNamed(AllCategories.routeName);
        }
      },
      {
        'icon': Icons.cabin,
        'text': 'Expenses',
        'onPressed': () {
          Navigator.of(context).pushNamed(AllExpenses.routeName);
        }
      },
      {
        'icon': Icons.precision_manufacturing,
        'text': 'Product Categories',
        'onPressed': () {
          Navigator.of(context).pushNamed(AllCategories.routeName);
        }
      },
      {
        'icon': Icons.outbond,
        'text': 'Investment In/Out',
        'onPressed': () {
          Navigator.of(context).pushNamed(InvestmentInOrOutPage.routeName);
        }
      },
      {
        'icon': Icons.add_box_rounded,
        'text': 'Add Product',
        'onPressed': () {
          Navigator.of(context).pushNamed(AddProduct.routeName);
        }
      },
      {
        'icon': Icons.precision_manufacturing,
        'text': 'Add Sale',
        'onPressed': () {
          Navigator.of(context).pushNamed(AddSale.routeName);
        }
      },
      {
        'icon': Icons.explore,
        'text': 'Add Purchase',
        'onPressed': () {
          Navigator.of(context).pushNamed(AddProduct.routeName);
        }
      },
      {
        'icon': Icons.settings,
        'text': 'Settings',
        'onPressed': () {
          Navigator.of(context).pushNamed(SettingsPage.routeName);
        }
      },
      {'icon': Icons.shopping_bag, 'text': 'Sales', 'onPressed': () {}},
      {'icon': Icons.money_rounded, 'text': 'Transactions', 'onPressed': () {}},
      {'icon': Icons.add_box, 'text': 'Purchase', 'onPressed': () {}},
      {'icon': Icons.playlist_add, 'text': 'P.Order', 'onPressed': () {}},
      {'icon': Icons.undo, 'text': 'Customer return', 'onPressed': () {}},
      {'icon': Icons.replay, 'text': 'Return purchase', 'onPressed': () {}},
      {'icon': Icons.attach_money, 'text': 'Pay/Get cash', 'onPressed': () {}},
    ];

    var _crossAxisTileCount = 4;
    if (dimensions.isMobile) {
      _crossAxisTileCount = 4;
    } else if (dimensions.isTablet) {
      _crossAxisTileCount = 6;
    } else {
      _crossAxisTileCount = 8;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(slidingPanelTopRadius),
          topRight: Radius.circular(slidingPanelTopRadius),
        ),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      child: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Padding(
          padding: EdgeInsets.only(
            top: dimensions.screenWidth * 0.08,
          ),
          child: GridView.builder(
            itemCount: tiles.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisTileCount, // Number of tiles in a row
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 1, // Adjust the height/width ratio of the tiles
            ),
            itemBuilder: (context, index) {
              return CustomTileButton(
                icon: tiles[index]['icon'],
                text: tiles[index]['text'],
                onPressed: tiles[index]['onPressed'],
              );
            },
          ),
        ),
      ),
    );
  }
}
