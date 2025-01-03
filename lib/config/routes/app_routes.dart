import 'package:business_tracker/features/attribute-types/presentation/pages/add_attribute_types_page.dart';
import 'package:business_tracker/features/attribute-types/presentation/pages/all_attribute_types_page.dart';
import 'package:business_tracker/features/attributes/presentation/pages/add_attributes_page.dart';
import 'package:business_tracker/features/attributes/presentation/pages/all_attributes_page.dart';
import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/auth/presentation/pages/register_page.dart';
import 'package:business_tracker/features/brands/presentation/pages/add_brands.dart';
import 'package:business_tracker/features/brands/presentation/pages/all_brands.dart';
import 'package:business_tracker/features/categories/presentation/pages/add_categories.dart';
import 'package:business_tracker/features/categories/presentation/pages/all_categories.dart';
import 'package:business_tracker/features/company/presentation/pages/create_company.dart';
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
  static const String regiserPage = RegisterPage.routeName;
  static const String createCompanyPage = CreateCompanyPage.routeName;
  static const String allBrandsPage = AllBrandsPage.routeName;
  static const String addBrandsPage = AddBrandsPage.routeName;
  static const String addAttributeTypesPage = AddAttributeTypesPage.routeName;
  static const String allAttributeTypesPage = AllAttributeTypesPage.routeName;
  static const String addAttributesPage = AddAttributesPage.routeName;
  static const String allAttributesPage = AllAttributesPage.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authenticationPage:
        return MaterialPageRoute(
          builder: (_) => const AuthenticationPage(),
        );
      case dashboardPage:
        return MaterialPageRoute(
          builder: (_) => const Dashboard(),
        );
      case settingsPage:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
      case allProductsPage:
        return MaterialPageRoute(
          builder: (_) => const AllProducts(),
        );
      case addProductPage:
        return MaterialPageRoute(
          builder: (_) => AddProduct(),
        );
      case addSalePage:
        return MaterialPageRoute(
          builder: (_) => const AddSale(),
        );
      case allCategoriesPage:
        return MaterialPageRoute(
          builder: (_) => const AllCategories(),
        );
      case addCategoriesPage:
        return MaterialPageRoute(
          builder: (_) => const AddCategories(),
        );
      case allExpensesPage:
        return MaterialPageRoute(
          builder: (_) => const AllExpenses(),
        );
      case addExpensesPage:
        return MaterialPageRoute(
          builder: (_) => const AddExpense(),
        );
      case addExpenseTypePage:
        return MaterialPageRoute(
          builder: (_) => const AddExpenseTypesPage(),
        );
      case investmentInOutPage:
        return MaterialPageRoute(
          builder: (_) => const InvestmentInOrOutPage(),
        );
      case allVendorsPage:
        return MaterialPageRoute(
          builder: (_) => const AllVendorsPage(),
        );
      case addVendorPage:
        return MaterialPageRoute(
          builder: (_) => const AddVendorPage(),
        );
      case allWarehousesPage:
        return MaterialPageRoute(
          builder: (_) => const AllWarehousesPage(),
        );
      case addWarehousePage:
        return MaterialPageRoute(
          builder: (_) => const AddWarehousePage(),
        );
      case regiserPage:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case createCompanyPage:
        return MaterialPageRoute(
          builder: (_) => const CreateCompanyPage(),
        );
      case allBrandsPage:
        return MaterialPageRoute(
          builder: (_) => const AllBrandsPage(),
        );
      case addBrandsPage:
        return MaterialPageRoute(
          builder: (_) => const AddBrandsPage(),
        );
      case allAttributeTypesPage:
        return MaterialPageRoute(
          builder: (_) => const AllAttributeTypesPage(),
        );
      case addAttributeTypesPage:
        return MaterialPageRoute(
          builder: (_) => const AddAttributeTypesPage(),
        );
      case allAttributesPage:
        return MaterialPageRoute(
          builder: (_) => const AllAttributesPage(),
        );
      case addAttributesPage:
        return MaterialPageRoute(
          builder: (_) => const AddAttributesPage(),
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
