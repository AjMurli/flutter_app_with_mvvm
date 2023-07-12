import 'package:flutter/material.dart';
import 'package:flutter_app_with_mvvm/utils/routes/routes.dart';
import 'package:flutter_app_with_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_app_with_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()
        )],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const LoginScreen(),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generatedRoute,
      ),
    );
  }
}
