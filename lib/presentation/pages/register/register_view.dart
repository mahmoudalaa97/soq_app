// ignore_for_file: must_be_immutable

import 'package:buildcondition/buildcondition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soq_app/app/app_prefs.dart';
import 'package:soq_app/app/constants.dart';
import 'package:soq_app/app/injection_container.dart';
import 'package:soq_app/presentation/bloc/auth/login_bloc/login_states.dart';
import 'package:soq_app/presentation/bloc/auth/register_bloc/register_cubit.dart';
import 'package:soq_app/presentation/bloc/auth/register_bloc/register_states.dart';
import 'package:soq_app/presentation/pages/layout/layout_view.dart';
import 'package:soq_app/presentation/recources/route_manger.dart';
import 'package:soq_app/presentation/recources/strings_manger.dart';
import 'package:soq_app/presentation/recources/values_manger.dart';
import 'package:soq_app/presentation/widgets/widgets.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: AppSize.s0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: AppSize.s28),
                  getLogo(),
                  const SizedBox(height: AppSize.s28),
                  getFormFiled(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getFormFiled(context) {
    return Column(
      children: [
        // UserName Field
        deffaultFormField(
          controller: _userNameController,
          labelText: AppStrings.username.tr(),
          prefix: Icons.person,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.userNameInvalid.tr();
            }
            return null;
          },
        ),
        const SizedBox(height: AppSize.s20),
        // Phone Field
        deffaultFormField(
          controller: _phoneController,
          labelText: AppStrings.phone.tr(),
          prefix: Icons.phone,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.phoneInvalid.tr();
            }
            return null;
          },
        ),
        const SizedBox(height: AppSize.s20),

        // Email Field
        deffaultFormField(
          controller: _emailController,
          labelText: AppStrings.emailHint.tr(),
          prefix: Icons.email_outlined,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.invalidEmail.tr();
            }
            return null;
          },
        ),
        const SizedBox(height: AppSize.s20),

        // Password Field
        BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              state.authenticationData.data!.token;
              _appPreferences
                  .setUserToken(state.authenticationData.data!.token)
                  .then((value) {
                Constants.token = state.authenticationData.data!.token;
                navigateTo(context, const Layout());
              });
            }
          },
          builder: (context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);
            return deffaultFormField(
              controller: _passwordController,
              labelText: AppStrings.password.tr(),
              isPassword: cubit.isPassword,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.passwordInvalid.tr();
                }
                return null;
              },
              onFieldSubmitted: (value) {
                if (formKey.currentState!.validate()) {
                  cubit.register(
                    name: _userNameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    password: _passwordController.text,
                  );
                }
              },
              prefix: Icons.password_outlined,
              suffix: cubit.suffex,
              suffixPressed: () {
                cubit.changePaasswordVisibility();
              },
            );
          },
        ),

        const SizedBox(height: AppSize.s20),
        getRegister(),
        getLoginText(context),
      ],
    );
  }

  Widget getLoginText(context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.s20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.logInText.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          deffaultTextButton(
            context: context,
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.loginRoute);
            },
            text: AppStrings.logIn.tr(),
          ),
        ],
      ),
    );
  }

  Widget getRegister() {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          state.authenticationData.data!.token;
          _appPreferences
              .setUserToken(state.authenticationData.data!.token)
              .then((value) {
            Constants.token = state.authenticationData.data!.token;
            navigateTo(context, const Layout());
          });
        }
      },
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return BuildCondition(
          condition: state is! LoginLoadingState,
          builder: (context) => deffaultButton(
            function: () {
              if (formKey.currentState!.validate()) {
                cubit.register(
                  name: _userNameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                  password: _passwordController.text,
                );
                if (kDebugMode) {
                  print("Register");
                }
              }
            },
            text: AppStrings.register.tr(),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
