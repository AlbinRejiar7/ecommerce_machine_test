import 'package:ecommerce_machine_test/constants/routes.dart';
import 'package:ecommerce_machine_test/constants/theme.dart';
import 'package:ecommerce_machine_test/controller/auth_controller.dart';
import 'package:ecommerce_machine_test/controller/home_controller.dart';
import 'package:ecommerce_machine_test/controller/product_details.dart';
import 'package:ecommerce_machine_test/controller/search_controller.dart';
import 'package:ecommerce_machine_test/firebase_options.dart';
import 'package:ecommerce_machine_test/services/firebase_services.dart';
import 'package:ecommerce_machine_test/view/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProviderCtr()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => SearchProvider()),
          ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
        ],
        child: MaterialApp(
          initialRoute: FirebaseServices.auth.currentUser == null
              ? '/'
              : HomeScreen.route,
          routes: Routes.getRoutes(),
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce App',
          theme: CustomThemeData.lightTheme,
        ),
      ),
    );
  }
}
