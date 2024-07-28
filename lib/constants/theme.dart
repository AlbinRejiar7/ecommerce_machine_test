import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: kLightGrey,
      appBarTheme:
          const AppBarTheme().copyWith(surfaceTintColor: Colors.transparent),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(kBlue),
      )),
      primaryTextTheme: const TextTheme().copyWith(
        bodyLarge: CustomTextStyles.bodyLarge,
        bodyMedium: CustomTextStyles.bodyMedium,
        bodySmall: CustomTextStyles.bodySmall,
        titleSmall: CustomTextStyles.titleSmall,
      ),
      textTheme: const TextTheme().copyWith(
        bodyLarge: CustomTextStyles.boldTitle,
        bodyMedium: CustomTextStyles.mediumBold,
        titleMedium: CustomTextStyles.buttonText,
        labelMedium: CustomTextStyles.medium,
        titleSmall: CustomTextStyles.mediumDark,
        bodySmall: CustomTextStyles.regular,
        displaySmall: CustomTextStyles.priceText,
      ));
}
