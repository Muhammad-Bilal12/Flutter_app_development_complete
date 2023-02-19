import 'package:emart_app/view/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'consts/consts.dart';
import 'package:get/get.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          // to set appbar icon Color
          iconTheme: IconThemeData(color: darkFontGrey),
        ),
        fontFamily: "sans_regular",
      ),
      home: const SplashScreen(),
    );
  }
}
