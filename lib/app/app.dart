import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/core/theme/light_theme.dart';
import 'package:spicypickles/presentation/home/home.dart';
import 'package:spicypickles/presentation/notifications/bloc/notification_bloc.dart';

class SpicyPickleApp extends StatelessWidget {
  const SpicyPickleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NotificationBloc()..add(const FetchNotifications()),
        ),
      ],
      child: MaterialApp(
        title: 'Spicy Pickle App',
        debugShowCheckedModeBanner: false,
        theme: LightTheme().themeData,
        home: const HomeScreen(),
      ),
    );
  }
}
