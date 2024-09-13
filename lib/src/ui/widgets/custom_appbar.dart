import 'package:flutter/material.dart';
import 'package:forest_logger/forest_logger.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onCreateTap;
  final bool isCreateLoading;
  final VoidCallback? onSaveTap;
  final bool isSaveLoading;
  final String title;

  const CustomAppbar({
    super.key,
    required this.scaffoldKey,
    required this.title,
    this.onDeleteTap,
    this.onEditTap,
    this.onCreateTap,
    this.isCreateLoading = false,
    this.onSaveTap,
    this.isSaveLoading = false,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      forceMaterialTransparency: true,
      toolbarHeight: 60,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu_outlined),
        onPressed: () {
          Forest.debug("Drawer menu icon is tapped");
          Forest.debug(scaffoldKey.currentState.toString());

          if (!scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.openDrawer();
          }
        },
        color: ApplicationStyle.primaryColor,
      ),
      title: Text(
        title,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.5),
        child: Container(
          color: ApplicationStyle
              .primaryColor, // Change this to your desired color
          height: 1.5,
        ),
      ),
      actions: [
        if (onEditTap != null)
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: onEditTap,
            color: ApplicationStyle.primaryColor,
          ),
        if (onCreateTap != null)
          IconButton(
            icon: isCreateLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ApplicationStyle.primaryColor,
                    ),
                  )
                : const Icon(Icons.add),
            onPressed: onCreateTap,
            color: ApplicationStyle.primaryColor,
          ),
        if (onSaveTap != null)
          IconButton(
            icon: isSaveLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ApplicationStyle.primaryColor,
                    ),
                  )
                : const Icon(Icons.cloud_upload_outlined),
            onPressed: onSaveTap,
            color: ApplicationStyle.primaryColor,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
