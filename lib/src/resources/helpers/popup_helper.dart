import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/widgets/custom_elevated_button.dart';

class PopUpHelper {
  static showCustomDialogWithBody(
    BuildContext context, {
    required Widget body,
    List<Widget>? action,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ApplicationStyle.darkColor.withOpacity(0.5),
                ),
                child: AlertDialog(
                  backgroundColor: ApplicationStyle.white,
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  shadowColor: Colors.transparent,
                  scrollable: true,
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  content: body,
                ),
              ),
            );
          },
        );
      },
    );
  }

  static showCustomAcceptDialog(
    BuildContext context, {
    required String title,
    required String acceptTitle,
    required String declineTitle,
  }) async {
    bool returnState = false;
    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ApplicationStyle.darkColor.withOpacity(0.5),
                ),
                child: AlertDialog(
                  backgroundColor: ApplicationStyle.primaryColor,
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollable: true,
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  content: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: ApplicationStyle.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            title: acceptTitle,
                            backgroundColor: ApplicationStyle.redColor,
                            onTap: () {
                              returnState = true;
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: CustomElevatedButton(
                            title: declineTitle,
                            onTap: () {
                              returnState = false;
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
    return returnState;
  }
}
