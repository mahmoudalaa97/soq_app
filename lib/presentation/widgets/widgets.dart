// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soq_app/presentation/recources/assets_manger.dart';
import 'package:soq_app/presentation/recources/color_manger.dart';
import 'package:soq_app/presentation/recources/fonts_manger.dart';
import 'package:soq_app/presentation/recources/values_manger.dart';

Widget getLogo() {
  return SizedBox(
    height: 150,
    width: 150,
    child: SvgPicture.asset(ImageAssets.splashLogo),
  );
}

Widget deffaultFormField(
        {required TextEditingController? controller,
        TextInputType? type,
        bool isPassword = false,
        required String? labelText,
        required IconData? prefix,
        IconData? suffix,
        final FormFieldValidator<String>? validate,
        VoidCallback? suffixPressed,
        VoidCallback? onTap,
        bool isClickable = true,
        ValueChanged<String>? onFieldSubmitted}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(onPressed: suffixPressed, icon: Icon(suffix)),
        border: const OutlineInputBorder(),
      ),
      onFieldSubmitted: onFieldSubmitted,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
    );

Widget deffaultTextButton(
        {required VoidCallback? onPressed, required String text, context}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
Widget deffaultButton({
  double width = double.infinity,
  Color background = ColorsManger.primary,
  double height = AppSize.s40,
  required VoidCallback? function,
  required String? text,
  bool isUpperCase = true,
  Color textColor = ColorsManger.white,
  double fontSize = AppSize.s20,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        height: height,
        onPressed: function,
        child: Text(
          isUpperCase ? text!.toUpperCase() : text!,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
      ),
    );

void navigateTo(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));
void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (Route<dynamic> route) => false,
    );

productImage({
  required String imageUrl,
  double height = 120,
  double width = 120,
}) =>
    CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );

void showToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: choseToasteColor(state),
        textColor: ColorsManger.white,
        fontSize: FontSize.s18);

enum ToastState { SUCCESS, ERORR, WORNING }

Color choseToasteColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = ColorsManger.success;
      break;
    case ToastState.ERORR:
      color = ColorsManger.erorr;
      break;
    case ToastState.WORNING:
      color = ColorsManger.worning;
      break;
  }
  return color;
}

Widget myDivider() => Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey,
    );
