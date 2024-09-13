import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:viragvarazs/src/models/user/user_model.dart';
import 'package:viragvarazs/src/providers/authentication_provider.dart';
import 'package:viragvarazs/src/resources/routes/app_routes.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/widgets/custom_drawer_item.dart';
import 'package:viragvarazs/src/ui/widgets/custom_elevated_button.dart';
import 'package:viragvarazs/src/ui/widgets/custom_outlined_button.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String buildVersion = "";
  UserModel? user;

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then(
      (PackageInfo packageInfo) {
        setState(
          () {
            buildVersion = packageInfo.version;
          },
        );
      },
    );
  }

  void showLogoutSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: ApplicationStyle.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ApplicationStyle.sheetBorderRadius),
              topRight: Radius.circular(ApplicationStyle.sheetBorderRadius),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      AutoRouter.of(context).maybePop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Text(
                  "Biztosan ki szeretnél jelentkezni?",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomOutlinedButton(
                  onTap: () {},
                  title: "Kijelentkezés",
                  isLoading: Provider.of<AuthenticationProvider>(context,
                          listen: false)
                      .isLoading,
                  textColor: ApplicationStyle.primaryColor,
                  foregroundColor: ApplicationStyle.primaryColor,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  title: "Mégse",
                  onTap: () {
                    AutoRouter.of(context).maybePop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthenticationProvider>(context, listen: true).userModel;
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  top: 22,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                          bottom: 8,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Szia ${user!.name}!",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            "Adminisztrátor",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: ApplicationStyle.white.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                ),
                child: Column(
                  children: [
                    CustomDrawerItem(
                      title: "Kategóriák kezelése",
                      onTap: () {
                        AutoRouter.of(context)
                            .popAndPush(const CategoriesRoute());
                      },
                    ),
                    CustomDrawerItem(
                      title: "Termékek kezelése",
                      onTap: () {
                        AutoRouter.of(context)
                            .popAndPush(const ProductsRoute());
                      },
                    ),
                    Divider(
                      color: ApplicationStyle.white.withOpacity(0.4),
                    ),
                    CustomDrawerItem(
                      title: "Fleurop számla kiállítása",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomOutlinedButton(
                  title: "Kijelentkezés",
                  width: MediaQuery.of(context).size.width / 0.1,
                  foregroundColor: ApplicationStyle.white,
                  onTap: () {
                    showLogoutSheet(context);
                  },
                  textColor: ApplicationStyle.white,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'ver.: $buildVersion',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: ApplicationStyle.darkColor,
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
