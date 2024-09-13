import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:viragvarazs/src/resources/theme/application_style.dart';

class CustomDropDownFormField extends StatefulWidget {
  final Function(Object?)? onSave;
  final Function(Object?)? onChanged;
  final FocusNode currentFocus;
  final String? title;
  final String placeholder;
  final Object? initialValue;
  final double? width;
  final double? height;
  final double? bottomPadding;
  final double? topPadding;
  final List<DropdownMenuItem<Object>>? items;
  final Icon icon;
  final double iconPadding;

  const CustomDropDownFormField({
    super.key,
    this.title,
    this.onSave,
    required this.onChanged,
    required this.currentFocus,
    required this.placeholder,
    this.initialValue,
    this.width,
    this.height = 44,
    this.bottomPadding = 20,
    this.topPadding = 0,
    this.items,
    required this.icon,
    this.iconPadding = 10,
  });

  @override
  State<CustomDropDownFormField> createState() =>
      _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.topPadding,
        ),
        Text(
          widget.title!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Stack(
          children: [
            SizedBox(
              height: widget.height,
              width: widget.width,
              child: DropdownButtonFormField2(
                value: widget.initialValue,
                decoration: InputDecoration(
                  fillColor: ApplicationStyle.blueColor.withOpacity(0.2),
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      ApplicationStyle.borderRadius,
                    ),
                  ),
                ),
                buttonStyleData: ButtonStyleData(
                  height: widget.height,
                  padding: EdgeInsets.only(right: widget.iconPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ApplicationStyle.borderRadius,
                    ),
                    color: ApplicationStyle.white.withOpacity(0.2),
                  ),
                ),
                hint: Text(
                  widget.placeholder,
                  style: const TextStyle(fontSize: 14),
                ),
                iconStyleData: IconStyleData(icon: widget.icon),
                items: widget.items,
                onChanged: (newValue) {
                  widget.onChanged!(newValue);
                },
                onSaved: (newValue) {
                  widget.onSave!(newValue);
                },
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ApplicationStyle.borderRadius,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: widget.bottomPadding,
        ),
      ],
    );
  }
}
