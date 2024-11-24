import 'package:forest_logger/forest_logger.dart';
import 'package:provider/provider.dart';
import 'package:viragvarazs/src/providers/authentication_provider.dart';
import 'package:viragvarazs/src/providers/blog_provider.dart';
import 'package:viragvarazs/src/providers/category_provider.dart';
import 'package:viragvarazs/src/providers/product_provider.dart';
import 'package:viragvarazs/src/resources/assets/asset_flow.dart';
import 'package:viragvarazs/src/resources/helpers/message_helper.dart';
import 'package:viragvarazs/src/resources/routes/app_routes.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/widgets/custom_elevated_button.dart';
import 'package:viragvarazs/src/ui/widgets/custom_text_form_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _emptyFocus = FocusNode();

  String? _email;
  String? _password;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Provider.of<AuthenticationProvider>(context, listen: false)
          .login(_email!, _password!)
          .then((value) {
        if (value != null) {
          MessageHelper.showToast(value.toString());
          Forest.success(value.toString());
        } else {
          Provider.of<AuthenticationProvider>(context, listen: false).getUser();
          Provider.of<ProductProvider>(context, listen: false).getAllProducts();
          Provider.of<ProductProvider>(context, listen: false).loadBaseData();
          Provider.of<CategoryProvider>(context, listen: false)
              .getAllTotalCategories();
          Provider.of<BlogProvider>(context, listen: false).getAllPosts();
          MessageHelper.showToast("Sikeres bejelentkezés");
          Forest.success("Login success");
          AutoRouter.of(context).replace(const CategoriesRoute());
        }
      });
    }
  }

  Widget _buildBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: AutofillGroup(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "A bejelentkezéshez, használd a webáruházhoz tartozó e-mail címet és jelszót.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ApplicationStyle.darkColor.withOpacity(0.6),
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: "E-mail",
                  onSave: (value) => _email = value,
                  validators: [
                    FormBuilderValidators.required(
                        errorText: "A mező kitöltése kötelező"),
                    FormBuilderValidators.email(
                        errorText: "Az e-mail cím formátuma nem megfelelő"),
                  ],
                  keyboardType: TextInputType.emailAddress,
                  currentFocus: _emailFocus,
                  nextFocus: _passwordFocus,
                  placeholder: "admin@viragvarazs.hu",
                  fillColor: ApplicationStyle.white,
                ),
                CustomTextFormField(
                  title: "Jelszó",
                  onSave: (value) => _password = value,
                  validators: [
                    FormBuilderValidators.required(errorText: "Add meg"),
                  ],
                  keyboardType: TextInputType.text,
                  currentFocus: _passwordFocus,
                  nextFocus: _emptyFocus,
                  placeholder: "Aa12345",
                  password: true,
                  bottomPadding: 36,
                  fillColor: ApplicationStyle.white,
                ),
                CustomElevatedButton(
                  title: "Bejelentkezés",
                  backgroundColor: ApplicationStyle.primaryColor,
                  width: 200,
                  onTap: _submitForm,
                  isLoading:
                      Provider.of<AuthenticationProvider>(context, listen: true)
                          .isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      drawer: null,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.06,
                  horizontal: MediaQuery.of(context).size.width * 0.12,
                ),
                child: Image.asset(
                  AssetFlow.viragvarazsPng,
                ),
              ),
            ),
            _buildBody(context),
          ],
        ),
      ),
    );
  }
}
