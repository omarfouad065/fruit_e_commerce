import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/constants.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruit_e_commerce/core/widgets/custom_button.dart';
import 'package:fruit_e_commerce/core/widgets/custom_text_field.dart';
import 'package:fruit_e_commerce/core/widgets/password_field.dart';
import 'package:fruit_e_commerce/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formKeys = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKeys,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('نسيت كلمة المرور ؟',
                      style: TextStyles.semiBold13
                          .copyWith(color: AppColors.lightPrimaryColor)),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () {
                  if (formKeys.currentState!.validate()) {
                    formKeys.currentState!.save();
                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'تسجيل دخول',
              ),
              const SizedBox(
                height: 33,
              ),
              const DontHaveAnAccountWidget(),
              const SizedBox(
                height: 33,
              ),
              const OrDivider(),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signinWithGoogle();
                },
                title: 'تسجيل بواسطة جوجل',
                image: Assets.assetsImagesGoogleIcon,
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                  title: 'تسجيل بواسطة ابل',
                  image: Assets.assetsImagesApplIcon,
                  onPressed: () {}),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                title: 'تسجيل بواسطة فيسبوك',
                image: Assets.assetsImagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
