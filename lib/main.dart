
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/counter/counter_provider.dart';
import 'package:state_management_provider/services/local_services/local_storage.dart';
import 'package:state_management_provider/setting/setting_provider.dart';
import 'package:state_management_provider/utils/theme_manager.dart';

import 'counter/counter_ui.dart';
import 'map/map_provider.dart';

main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider (create: (_) => CounterProvider()),
      ChangeNotifierProvider (create: (_) => ThemeManager()),
      ChangeNotifierProvider (create: (_) => MapProvider()),
      ChangeNotifierProvider (create: (_) => SettingProvider()),
      ChangeNotifierProvider (create: (_) => LocalDBManager()),

    ],

  child: const Home()),);
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<ThemeManager>().checkTheme(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeManager>().getTheme()?ThemeData.dark():ThemeData.light(),darkTheme: ThemeData.dark(),
      home:const CounterUI(),
    );

  }
}
