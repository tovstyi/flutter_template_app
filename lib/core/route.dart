import 'package:flutter/material.dart';

import 'routes/page_route.dart';

class Route {
  static Map<String, Widget Function(BuildContext)> routes = {
    ...PageRoutes.routes
  };
}
