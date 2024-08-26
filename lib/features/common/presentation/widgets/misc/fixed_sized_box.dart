import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:flutter/material.dart';

class FixedSizedBox extends StatelessWidget {
  const FixedSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    return SizedBox(
      height: dimensions.sizedBoxHeightGlobal,
    );
  }
}
