import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simper_app/bloc/addDispositionBloc.dart';
import 'package:simper_app/bloc/addMailInBloc.dart';
import 'package:simper_app/bloc/changeCommandDisposition.dart';
import 'package:simper_app/bloc/detailMailBloc.dart';
import 'package:simper_app/bloc/detailMailDisposisiBloc.dart';
import 'package:simper_app/bloc/detailMailInBloc.dart';
import 'package:simper_app/bloc/loginBloc.dart';
import 'package:simper_app/bloc/noticationCount.dart';
import 'package:simper_app/config/routes.dart';
import './ui/general/splash/splashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        ChangeNotifierProvider<DetailMailBloc>(
          create: (context) => DetailMailBloc(),
        ),
        ChangeNotifierProvider<DetailMailDisposisiBloc>(
          create: (context) => DetailMailDisposisiBloc(),
        ),
        ChangeNotifierProvider<AddDispositionBloc>(
            create: (context) => AddDispositionBloc()),
        ChangeNotifierProvider<CheckPDF>(create: (context) => CheckPDF()),
        ChangeNotifierProvider<AddMailInBloc>(
          create: (context) => AddMailInBloc(),
        ),
        ChangeNotifierProvider<ChangeCommandDisposistion>(
          create: (context) => ChangeCommandDisposistion(),
        ),
        ChangeNotifierProvider<NotificationCount>(
          create: (context) => NotificationCount(),
        )
      ],
      child: MaterialApp(
        routes: myRoutes(context),
        debugShowCheckedModeBanner: false,
        title: "Simper App",
        home: SplashScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blueAccent,
          fontFamily: 'SanFrancisco',
        ),
      ),
    );
  }
}
