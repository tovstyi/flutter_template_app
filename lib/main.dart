import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/session_bloc.dart';
import 'core/route.dart' as router;
import 'features/template_app/presentation/bloc/home_page/home_page_cubit.dart';
import 'features/template_app/presentation/screens/tab_bar_view.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await di.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SessionBloc>(
        create: (context) => sl<SessionBloc>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Template App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: router.Route.routes,
          home: const ContentWrap(),
        ));
  }
}

class ContentWrap extends StatefulWidget {
  const ContentWrap({Key? key}) : super(key: key);

  @override
  _ContentWrapState createState() => _ContentWrapState();
}

class _ContentWrapState extends State<ContentWrap> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => sl<HomePageCubit>(),
      child: const Scaffold(
          // appBar:
          resizeToAvoidBottomInset: false,
          body: SliverScrollPage()),
    );
  }
}
