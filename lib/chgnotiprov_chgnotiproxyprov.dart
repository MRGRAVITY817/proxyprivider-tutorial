import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int counter = 0;
  void increment() {
    counter++;
    notifyListeners();
  }
}

class Translations with ChangeNotifier {
  late int _value;

  void update(Counter counter) {
    _value = counter.counter;
    notifyListeners();
  }

  String get title => "You clicked $_value times";
}

class ChgNotiProvChgNotiProxyProv extends StatefulWidget {
  const ChgNotiProvChgNotiProxyProv({Key? key}) : super(key: key);

  @override
  _ChgNotiProvChgNotiProxyProvState createState() =>
      _ChgNotiProvChgNotiProxyProvState();
}

class _ChgNotiProvChgNotiProxyProvState
    extends State<ChgNotiProvChgNotiProxyProv> {
  int counter = 0;
  void increment() {
    setState(() {
      counter++;
      print('counter: $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ChangeNotifier(Proxy)Provider")),
        body: Center(
          child: MultiProvider(
            providers: [
              // This will notify when counter has changed
              ChangeNotifierProvider<Counter>(create: (_) => Counter()),
              // This will depend on Counter and create Translations from the changed value
              ChangeNotifierProxyProvider<Counter, Translations>(
                  create: (_) => Translations(),
                  update: (BuildContext _, Counter counter,
                      Translations? translations) {
                    // When counter updated, it will update translations accordingly
                    translations!.update(counter);
                    return translations;
                  }),
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ShowTranslations(),
                const SizedBox(height: 20.0),
                const IncreaseButton()
              ],
            ),
          ),
        ));
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.watch<Translations>().title;
    return Text(title, style: const TextStyle(fontSize: 28.0));
  }
}

class IncreaseButton extends StatelessWidget {
  const IncreaseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.read<Counter>().increment(),
        child: const Text('INCREASE', style: TextStyle(fontSize: 20.0)));
  }
}
