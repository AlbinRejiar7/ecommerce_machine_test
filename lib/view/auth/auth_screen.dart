import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/constants/icons.dart';
import 'package:ecommerce_machine_test/constants/padding.dart';
import 'package:ecommerce_machine_test/controller/auth_controller.dart';
import 'package:ecommerce_machine_test/services/firebase_services.dart';
import 'package:ecommerce_machine_test/utils/sized_box.dart';
import 'package:ecommerce_machine_test/utils/validations.dart';
import 'package:ecommerce_machine_test/view/auth/widget/common_text_field.dart';
import 'package:ecommerce_machine_test/widgets/buttons/button.dart';
import 'package:ecommerce_machine_test/widgets/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const String route = "/";

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var authProvider = Provider.of<AuthProviderCtr>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kLightGrey,
        title: Text(
          "e-Shop",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: CommonPadding.p1,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              kHeight(150.h),
              Consumer<AuthProviderCtr>(builder: (context, auth, _) {
                return authProvider.isSignInPage
                    ? CommonTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: "Name",
                        validator: (value) {
                          return Validations.nameValidator(value);
                        },
                        controller: authProvider.nameCtr,
                        focusNode: authProvider.nameFocusNode,
                        onSubmitted: () {
                          FocusScope.of(context)
                              .requestFocus(authProvider.emailFocusNode);
                        },
                      )
                    : const SizedBox.shrink();
              }),
              kHeight(20.h),
              CommonTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: "Email",
                validator: (value) {
                  return Validations.emailValidator(value);
                },
                controller: authProvider.emailCtr,
                focusNode: authProvider.emailFocusNode,
                onSubmitted: () {
                  FocusScope.of(context)
                      .requestFocus(authProvider.passwordFocusNode);
                },
              ),
              kHeight(20.h),
              CommonTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return Validations.passwordValidator(value);
                },
                hintText: "Password",
                obscureText: !authProvider.isVisible,
                suffixIcon:
                    Consumer<AuthProviderCtr>(builder: (context, auth, _) {
                  return InkWell(
                      onTap: () {
                        authProvider.toggleVisibility();
                      },
                      child: Icon(authProvider.isVisible
                          ? AppIcons.eye
                          : AppIcons.eyeOff));
                }),
                controller: authProvider.passwordCtr,
                focusNode: authProvider.passwordFocusNode,
                onSubmitted: () {},
              ),
              kHeight(290.h),
              Consumer<AuthProviderCtr>(builder: (context, auth, _) {
                return CustomButton(
                  text: auth.isSignInPage ? "Signup" : "Login",
                  onPressed: () async {
                    if ((formKey.currentState?.validate() ?? false)) {
                      if (auth.isSignInPage) {
                        await FirebaseServices.register(
                            context: context,
                            email: auth.emailCtr.text,
                            password: auth.passwordCtr.text,
                            name: auth.nameCtr.text);
                        auth.clear();
                      } else {
                        await FirebaseServices.login(
                          context: context,
                          email: auth.emailCtr.text,
                          password: auth.passwordCtr.text,
                        );
                      }
                    }
                  },
                );
              }),
              kHeight(6.h),
              Consumer<AuthProviderCtr>(builder: (context, auth, _) {
                return CustomTextWidget(
                  buttonText: authProvider.isSignInPage ? "Login" : "Signup",
                  firstText: authProvider.isSignInPage
                      ? "Already have an account?"
                      : "New here?",
                  onButtonTextTap: () {
                    authProvider.toggleSignInLoginPage();
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
