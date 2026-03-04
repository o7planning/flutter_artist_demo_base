import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../activity/login_activity.dart';

class LoginSection extends StatelessWidget {
  final AppLoginActivity loginActivity;

  const LoginSection({super.key, required this.loginActivity});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double imageHeight = screenWidth < 500 ? 60 : 80;
    double sizedBoxHeight = screenWidth < 500 ? 20 : 70;

    return Center(
      child: SizedBox(
        width: screenWidth < 500 ? screenWidth * 0.9 : 400,
        child: Column(children: [_buildLoginWithUserPass(imageHeight)]),
      ),
    );
  }

  Widget _buildLoginWithUserPass(double imageHeight) {
    return ActivitySectionViewBuilder(
      ownerClassInstance: this,
      description: null,
      activity: loginActivity,
      build: () {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: FormBuilder(
            key: loginActivity.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 80,
                  child: Image.asset(
                    'static-rs/flutter_artist.png',
                    height: imageHeight,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                FaFormBuilderTextField(
                  key: const Key("userName"),
                  name: "userName",
                  hintText: "Username",
                  maxLines: 1,
                  prefixIcon: const Icon(Icons.person),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Username",
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(height: 15),
                FaFormBuilderTextField(
                  key: const Key("password"),
                  name: "password",
                  hintText: "Password",
                  maxLines: 1,
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                  onSubmitted: (String? text) {
                    _doLoginWithUserPass();
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: const Key("loginButton"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10324A),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _doLoginWithUserPass();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _doLoginWithUserPass() {
    if (loginActivity.formKey.currentState!.validate()) {
      loginActivity.executeActivity();
    }
  }
}
