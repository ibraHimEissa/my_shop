import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/bloc_observer.dart';
import 'package:my_shop/models/screens/sign_in/cubit/states.dart';
import 'package:my_shop/network/local/cache_helper.dart';
import 'package:my_shop/network/remote/dio_helper.dart';
import 'package:my_shop/routes.dart';
import 'package:my_shop/size_config.dart';
import 'package:my_shop/theme.dart';
import 'models/screens/complete_profile/cubit/cubit.dart';
import 'models/screens/home/cubit/cubit.dart';
import 'models/screens/on_boarding/on_boarding_screen.dart';
import 'models/screens/sign_in/cubit/cubit.dart';
import 'models/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ShopLoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopRegisterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getUserData(),
        ),
      ],
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: theme(),
            // home: SplashScreen(),
            // We use routeName so that we don't need to remember the name
            initialRoute: SplashScreen.routeName,
            routes: routes,
          );
        },
      ),
    );
  }
}
