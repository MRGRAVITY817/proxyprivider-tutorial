import 'package:flutter/material.dart';
import 'package:proxy_provider_ex/proxy_update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProxyProvider Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          ElevatedButton(
              child: const Text(
                'ProxyProvider\nUpdate',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProxyProvUpdate(),
                  ))),
        ],
      ),
    )));
  }
}
