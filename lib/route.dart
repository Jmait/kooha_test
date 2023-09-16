import 'package:flutter/material.dart';
import 'package:kooha_test/core/constants/routes_names.dart';
import 'package:kooha_test/views/celeb_browse_page.dart';
import 'package:kooha_test/views/celeb_details_page.dart';

Route<RouteSettings> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case browsePage:
      return MaterialPageRoute(builder: (context) => BrowseCelebPage());
    case celebDetailsRoute:
      return MaterialPageRoute(
        builder: (context) => CelebDetailsPage(
          id: settings.arguments as String?,
        ),
      );
    default:
      return MaterialPageRoute(builder: (context) => BrowseCelebPage());
  }
}
