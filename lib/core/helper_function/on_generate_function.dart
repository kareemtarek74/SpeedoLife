import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Auth/presentation/view/widgets/sign_in_view.dart';
import 'package:speedo_life/Features/Main/presentation/views/main_view.dart';
import 'package:speedo_life/Features/Sections/presentation/view/product_details_view.dart';
import 'package:speedo_life/Features/Sections/presentation/view/section_products_page_view.dart';

import '../../Features/Auth/presentation/view/sign_up_view.dart';
import '../../Features/Sections/presentation/view/sections_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case SectionsView.routeName:
      return MaterialPageRoute(builder: (context) => const SectionsView());
    case SectionProductsPageView.routeName:
      return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            final args = ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>;
            final categoryId = args['categoryId']!;
            final categoryName = args['categoryName']!;
            return SectionProductsPageView(
              categoryId: categoryId,
              categoryName: categoryName,
            );
          });
    case ProductDetailsView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ProductDetailsView());
    default:
      return MaterialPageRoute(builder: (context) => const SignInView());
  }
}
