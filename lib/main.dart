import 'package:flutter/material.dart';
import 'package:proxy_provider_ex/chgnotiprov_chgnotiproxyprov.dart';
import 'package:proxy_provider_ex/chgnotiprov_proxyprov.dart';

import 'package:proxy_provider_ex/proxy_create_update.dart';
import 'package:proxy_provider_ex/proxy_proxyprov.dart';
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
          ProxyProviderButton(
              title: 'ProxyProvider\nUpdate',
              builder: (BuildContext _) => const ProxyProvUpdate()),
          const SizedBox(
            height: 20.0,
          ),
          ProxyProviderButton(
              title: 'ProxyProvider\nCreate & Update',
              builder: (BuildContext _) => const ProxyProvCreateUpdate()),
          const SizedBox(
            height: 20.0,
          ),
          ProxyProviderButton(
              title: 'ProxyProvider\n0 and 1',
              builder: (BuildContext _) => const ProxyProv0and1()),
          const SizedBox(
            height: 20.0,
          ),
          ProxyProviderButton(
              title: 'ChangeNotify\n(Proxy)Provider',
              builder: (BuildContext _) => const ChgNotiProvChgNotiProxyProv()),
          const SizedBox(
            height: 20.0,
          ),
          ProxyProviderButton(
              title: 'ChangeNotifyProvider\n with ProxyProvider',
              builder: (BuildContext _) => const ChgNotiProvProxyPrv()),
        ],
      ),
    )));
  }
}

class ProxyProviderButton extends StatelessWidget {
  final String title;
  final Widget Function(BuildContext) builder;

  const ProxyProviderButton({
    Key? key,
    required this.title,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: builder,
            )));
  }
}
