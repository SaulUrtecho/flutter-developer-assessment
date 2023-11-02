import 'package:flutter/material.dart';
import 'package:thrones_app/ui/bloc/fetch_characters_bloc.dart';

class BodyBuilder extends StatelessWidget {
  final AppStatus appStatus;
  final WidgetBuilder? onLoading;
  final WidgetBuilder onCompleted;
  final WidgetBuilder? onFailure;

  const BodyBuilder({
    super.key,
    required this.appStatus,
    this.onLoading,
    required this.onCompleted,
    this.onFailure,
  });

  @override
  Widget build(BuildContext context) {
    switch (appStatus) {
      case AppStatus.loading:
        return onLoading?.call(context) ?? const Center(child: CircularProgressIndicator());
      case AppStatus.failure:
        return onFailure?.call(context) ?? const SizedBox.shrink();
      case AppStatus.completed:
        return onCompleted(context);
    }
  }
}
