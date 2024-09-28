import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/counter/counter_provider.dart';
import 'package:state_management_provider/setting/setting_page.dart';

class CounterUI extends StatelessWidget {
  const CounterUI({super.key});

  @override
  Widget build(BuildContext context) {
    log("BUILD METHOD CALLED");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingUI()));
            },
          )
        ],
        centerTitle: true,
        title: Text("Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CounterProvider>(
            builder: (ctx, counterProvider, child) {
              log("CONSUMER CALLED");
              return Text("COUNT => ${counterProvider.count}");
            },
          ),

          ElevatedButton(
              onPressed: () {
                // Provider.of<CounterProvider>(context, listen: false).incrementCount();
              context.read<CounterProvider>().incrementCount();
              },
              child: Text("INCREMENT")),
          ElevatedButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .decrementCount();
              },
              child: Text("DECREAMENT")),
        ],
      ),
    );
  }
}
