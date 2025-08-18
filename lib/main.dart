import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/doc_app.dart';

import 'core/di/service_locator.dart';
import 'core/routing/app_router.dart';

void main() {
  setupGetIt();
  runApp(const DocApp(appRouter: AppRouter()));
}
