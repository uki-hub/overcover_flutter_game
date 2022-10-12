
import 'package:flutter/material.dart';

class AppPageRoute extends PageRouteBuilder {
  final Widget? page;
  final WidgetBuilder? builder;

  AppPageRoute({
    this.page,
    this.builder,
  }) : super(pageBuilder: (context, _, __) => page ?? builder!(context));
}
