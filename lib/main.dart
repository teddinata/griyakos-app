import 'package:flutter/material.dart';
import 'package:griyakos/pages/splash_page.dart';
import 'package:griyakos/provider/space_provider.dart';
import 'package:provider/provider.dart';
import 'package:griyakos/pages/home_page.dart';
// import 'package:griyakos/pages/detail_page.dart';
// import 'package:griyakos/pages/error_page.dart';
import 'package:griyakos/pages/all_space_page.dart';
import 'package:griyakos/pages/news_page.dart';
import 'package:griyakos/pages/wishlist_page.dart';
// import 'package:griyakos/theme.dart';
// import 'package:flutter/services.dart' show AssetManifest as FlutterAssetManifest;
// import 'package:google_fonts/src/asset_manifest.dart' show AssetManifest as FontsAssetManifest;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        routes: {
          // ... rute lainnya
          '/home': (context) => HomePage(),
          '/all-spaces': (context) => AllSpacesPage(),
          '/news': (context) => NewsPage(),
          '/wishlist': (context) => WishlistPage(),
        },
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
    // splashscreen
    // return MaterialApp(
    //   home: SplashPage(),
    // );
  }
}
