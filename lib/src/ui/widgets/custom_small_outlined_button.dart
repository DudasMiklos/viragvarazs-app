import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSmallOutlinedButton extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final bool isLoading;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final bool hasPlussSign;
  final bool isDisabled;

  const CustomSmallOutlinedButton({
    super.key,
    this.title,
    this.textColor,
    required this.onTap,
    this.width = double.infinity,
    this.height,
    this.isLoading = false,
    this.foregroundColor,
    this.backgroundColor,
    this.hasPlussSign = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: isLoading ? null : (isDisabled ? null : onTap),
        style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            side: isDisabled
                ? BorderSide(
                    width: 1,
                    color: ApplicationStyle.grayColor.withOpacity(0.5),
                  )
                : null),
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 50),
          firstChild: const CustomLoader(),
          secondChild: hasPlussSign
              ? Stack(
                  children: [
                    Center(
                      child: Text(
                        title ?? "",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      child: SvgPicture.asset("assets/icons/plus.svg",
                          height: 14,
                          width: 14,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)),
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    title?.toUpperCase() ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
          crossFadeState:
              isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
