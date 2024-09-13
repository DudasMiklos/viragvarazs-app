import 'package:flutter/material.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';

class CustomDrawerItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function() onTap;

  const CustomDrawerItem(
      {super.key, required this.title, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon == null ? null : Icon(icon),
      title: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: ApplicationStyle.white,
            ),
      ),
      onTap: onTap,
    );
  }
}
