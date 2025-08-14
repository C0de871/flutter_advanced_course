import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import 'widgets/already_have_account_text.dart';
import 'widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome Back', style: TextStyles.font24BlueBold),
              verticalSpace(8.h),
              Text(
                "we're excited to have you back, can't wait to see what you've been up to since you last loggin",
                style: TextStyles.font14GreyRegular,
              ),
              verticalSpace(36),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextFormField(hintText: 'Email'),
                    verticalSpace(18.h),
                    AppTextFormField(
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscureText = !_isObscureText;
                          });
                        },
                        child: Icon(
                          _isObscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      isObscureText: _isObscureText,
                    ),
                    verticalSpace(24.h),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(40.h),
                    AppTextButton(
                      buttonText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {},
                    ),
                    verticalSpace(16.h),
                    const TermsAndConditionsText(),
                    verticalSpace(60.h),
                    const AlreadyHaveAccountText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
