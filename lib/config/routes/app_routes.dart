import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/categories/presentation/pages/add_categories.dart';
import 'package:business_tracker/features/categories/presentation/pages/all_categories.dart';
import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:business_tracker/features/expenses/presentation/pages/add_expense.dart';
import 'package:business_tracker/features/expenses/presentation/pages/add_expense_types.dart';
import 'package:business_tracker/features/expenses/presentation/pages/all_expenses.dart';
import 'package:business_tracker/features/investments/presentation/pages/investment_in_or_out_page.dart';
import 'package:business_tracker/features/products/presentation/pages/add_product.dart';
import 'package:business_tracker/features/products/presentation/pages/all_products.dart';
import 'package:business_tracker/features/sales/presentation/pages/add_sale.dart';
import 'package:business_tracker/features/settings/presentation/pages/settings_page.dart';
import 'package:business_tracker/features/vendor/presentation/pages/add_vendors.dart';
import 'package:business_tracker/features/vendor/presentation/pages/all_vendors.dart';
import 'package:business_tracker/features/warehouse/presentation/pages/add_warehouse.dart';
import 'package:business_tracker/features/warehouse/presentation/pages/all_warehouses.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String authenticationPage = AuthenticationPage.routeName;
  static const String dashboardPage = Dashboard.routeName;
  static const String settingsPage = SettingsPage.routeName;
  static const String allProductsPage = AllProducts.routeName;
  static const String addProductPage = AddProduct.routeName;
  static const String addSalePage = AddSale.routeName;
  static const String allCategoriesPage = AllCategories.routeName;
  static const String addCategoriesPage = AddCategories.routeName;
  static const String allExpensesPage = AllExpenses.routeName;
  static const String addExpensesPage = AddExpense.routeName;
  static const String addExpenseTypePage = AddExpenseTypesPage.routeName;
  static const String investmentInOutPage = InvestmentInOrOutPage.routeName;
  static const String allVendorsPage = AllVendorsPage.routeName;
  static const String addVendorPage = AddVendorPage.routeName;
  static const String allWarehousesPage = AllWarehousesPage.routeName;
  static const String addWarehousePage = AddWarehousePage.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authenticationPage:
        return MaterialPageRoute(
          builder: (_) => AuthenticationPage(),
        );
      case dashboardPage:
        return MaterialPageRoute(
          builder: (_) => Dashboard(),
        );
      case settingsPage:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      case allProductsPage:
        return MaterialPageRoute(
          builder: (_) => AllProducts(),
        );
      case addProductPage:
        return MaterialPageRoute(
          builder: (_) => AddProduct(),
        );
      case addSalePage:
        return MaterialPageRoute(
          builder: (_) => AddSale(),
        );
      case allCategoriesPage:
        return MaterialPageRoute(
          builder: (_) => AllCategories(),
        );
      case addCategoriesPage:
        return MaterialPageRoute(
          builder: (_) => AddCategories(),
        );
      case allExpensesPage:
        return MaterialPageRoute(
          builder: (_) => AllExpenses(),
        );
      case addExpensesPage:
        return MaterialPageRoute(
          builder: (_) => AddExpense(),
        );
      case addExpenseTypePage:
        return MaterialPageRoute(
          builder: (_) => AddExpenseTypesPage(),
        );
      case investmentInOutPage:
        return MaterialPageRoute(
          builder: (_) => InvestmentInOrOutPage(),
        );
      case allVendorsPage:
        return MaterialPageRoute(
          builder: (_) => AllVendorsPage(),
        );
      case addVendorPage:
        return MaterialPageRoute(
          builder: (_) => AddVendorPage(),
        );
      case allWarehousesPage:
        return MaterialPageRoute(
          builder: (_) => AllWarehousesPage(),
        );
      case addWarehousePage:
        return MaterialPageRoute(
          builder: (_) => AddWarehousePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
