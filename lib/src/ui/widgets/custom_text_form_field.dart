import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomTextFormField extends StatefulWidget {
  final Function(String?) onSave;
  final Function(String?)? onChanged;
  final List<String? Function(String?)> validators;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? title;
  final String? placeholder;
  final String? initialValue;
  final int? maxLines;
  final TextInputType keyboardType;
  final bool password;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;
  final bool enabled;
  final double? bottomPadding;
  final double? topPadding;
  final TextStyle? textStyle;
  final Color? fillColor;
  final List<String>? autofillHints;

  const CustomTextFormField({
    super.key,
    this.title,
    required this.onSave,
    this.onChanged,
    required this.validators,
    this.currentFocus,
    this.keyboardType = TextInputType.text,
    this.nextFocus,
    this.password = false,
    this.controller,
    this.formatters,
    this.enabled = true,
    this.placeholder,
    this.initialValue,
    this.maxLines = 1,
    this.bottomPadding = 20,
    this.topPadding = 0,
    this.textStyle,
    this.fillColor,
    this.autofillHints,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;

  _fieldFocusChange(BuildContext context) {
    if (widget.currentFocus != null) {
      widget.currentFocus?.unfocus();
      if (widget.nextFocus != null) {
        FocusScope.of(context).requestFocus(widget.nextFocus);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.topPadding,
        ),
        widget.title != null
            ? Text(
                widget.title!,
                style: Theme.of(context).textTheme.labelMedium,
              )
            : const SizedBox(
                height: 0,
              ),
        const SizedBox(
          height: 8.0,
        ),
        Stack(
          children: [
            TextFormField(
              onSaved: widget.onSave,
              onChanged: widget.onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose(widget.validators),
              enabled: widget.enabled,
              style: widget.textStyle,
              autofillHints: widget.autofillHints,
              decoration: InputDecoration(
                fillColor: widget.enabled
                    ? widget.fillColor
                    : ApplicationStyle.grayColor,
                errorMaxLines: 2,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                filled: true,
                hintText: widget.placeholder ?? "",
                suffixIcon: widget.password
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 7.5,
                            horizontal: 7.5,
                          ),
                          child: showPassword
                              ? const Icon(
                                  Icons.visibility,
                                  color: ApplicationStyle.primaryColor,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: ApplicationStyle.primaryColor,
                                ),
                        ),
                      )
                    : null,
              ),
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              focusNode: widget.currentFocus,
              obscureText: widget.password ? !showPassword : false,
              maxLines: widget.maxLines,
              minLines: 1,
              initialValue: widget.initialValue,
              onFieldSubmitted: (text) {
                _fieldFocusChange(context);
              },
              inputFormatters: widget.formatters,
              textInputAction: widget.keyboardType != TextInputType.multiline
                  ? widget.nextFocus == null
                      ? TextInputAction.done
                      : TextInputAction.next
                  : null,
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
