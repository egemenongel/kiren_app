import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../helper/size_helper.dart';
import '../home/home_view.dart';
import '../../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormController formController = Get.put(FormController());
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: displayHeight,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: largeHorizontalPadding,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/Asset 2.png"),
                          fit: BoxFit.fill,
                        )),
                        child: buildForm(context),
                      ),
                    ),
                    Expanded(
                      child: buildSocialMediaBar(context),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 560,
                bottom: 40,
                width: displayWidth,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: largeHorizontalPadding,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formController.formKey.currentState!
                                .validate()) {
                              Get.to(() => (const HomeView()));
                            }
                          },
                          child: const FittedBox(
                            child: Text(
                              "Log In",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(vertical: 20.0),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Get.theme.colorScheme.primary,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff8AE2A3),
                              ),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                    width: 2.0,
                                    color: Get.theme.colorScheme.secondary),
                              ))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      clipBehavior: Clip.hardEdge,
    ));
  }

  Widget buildForm(BuildContext context) {
    final FormController formController = Get.put(FormController());
    return Form(
      key: formController.formKey,
      child: Column(
        children: [
          const Spacer(
            flex: 15,
          ),
          Expanded(
            flex: 21,
            child: Image.asset(
              "assets/Asset 3.png",
              scale: 0.5,
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          const Expanded(
            flex: 32,
            child: FittedBox(
              child: Text("Great Ideas,\n Powerful \n Opportunities",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
            ),
          ),
          const Spacer(
            flex: 33,
          ),
          Expanded(
            flex: 18,
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Get.theme.colorScheme.primary,
              ),
              decoration: const InputDecoration(
                  hintText: "Username / Email",
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(
                        50.0,
                      ))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(
                        50.0,
                      )))),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) =>
                  value!.isEmpty ? "Please type your username or email." : null,
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          Expanded(
            flex: 18,
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Get.theme.colorScheme.primary,
              ),
              decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Color(0xffDEC5FF),
                  ),
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(
                        50.0,
                      ))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(
                        50.0,
                      )))),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) =>
                  value!.isEmpty ? "Please type your password." : null,
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: FittedBox(
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an ccount? ",
                        style: TextStyle(
                          color: Get.theme.colorScheme.primaryVariant,
                        ),
                      ),
                      TextSpan(
                        text: "Sign Up",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => print("Sign Up"),
                        style: TextStyle(
                          color: Get.theme.colorScheme.onSecondary,
                        ),
                      ),
                    ],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
          ),
          const Spacer(
            flex: 28,
          ),
        ],
      ),
    );
  }

  Widget buildSocialMediaBar(BuildContext context) {
    return Container(
      color: Get.theme.colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Flexible(
            child: IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 10.5,
                backgroundColor: Get.theme.colorScheme.secondary,
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Get.theme.colorScheme.primary,
                  size: 13.5,
                ),
              ),
            ),
          ),
          Flexible(
            child: IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 10.5,
                backgroundColor: Get.theme.colorScheme.secondary,
                child: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Get.theme.colorScheme.primary,
                  size: 13.5,
                ),
              ),
            ),
          ),
          Flexible(
            child: IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 10.5,
                backgroundColor: Get.theme.colorScheme.secondary,
                child: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Get.theme.colorScheme.primary,
                  size: 13.5,
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
