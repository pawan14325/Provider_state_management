import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/theme_manager.dart';

class SettingUI extends StatelessWidget {
  const SettingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Theme mode"),
            subtitle: Consumer<ThemeManager>( // Specify the type as <ThemeManager>
              builder: (context, theme, __) {
                return Switch.adaptive(
                  value: theme.getTheme(),
                  onChanged: (v) {
                    context.read<ThemeManager>().changeTheme(context,value: v); // Corrected: context.read<ThemeManager>()
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
