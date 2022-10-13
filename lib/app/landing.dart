import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overcover/app/router.dart';
import 'package:overcover/controller/cubit/players_cubit.dart';
import 'package:overcover/controller/cubit/word_list_cubit.dart';
import 'package:overcover/screens/home/home_screen.dart';


class AppLanding extends StatelessWidget {
  const AppLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WordListCubit>(
          create: (context) => WordListCubit(),
        ),
        BlocProvider<PlayersCubit>(
          create: (context) => PlayersCubit(),
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: HomeScreen(),
      ),
    );
  }
}
