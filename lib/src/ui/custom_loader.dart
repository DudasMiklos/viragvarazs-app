import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final Color color;
  final double height;
  const CustomLoader({
    super.key,
    this.color = ApplicationStyle.primaryColor,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: height,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
