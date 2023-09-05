import 'package:flutter/material.dart';
import '../shared/constants.dart';
import 'custom_circular_progress.dart';

class WidgetSelector extends StatelessWidget {
  const WidgetSelector({required this.state, required this.widget, this.errorMessage = '', super.key});

  final LoadState state;
  final Widget widget;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    if (state == LoadState.success) {
      return widget;
    }
    if (state == LoadState.error) {
      return Text(textAlign: TextAlign.center,errorMessage, style: const TextStyle(color: Colors.red, fontSize: 15));
    }
    return const Center(child: CCircularProgressIndicator());
  }
}
