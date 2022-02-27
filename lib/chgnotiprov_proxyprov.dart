import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int counter = 0;
  void increment() {
    counter++;
    notifyListeners();
  }
}

class Translations {
  const Translations(this._value);
  final int _value;

  String get title => "You clicked $_value times";
}

class ChgNotiProvProxyPrv extends StatefulWidget {
  const ChgNotiProvProxyPrv({Key? key}) : super(key: key);

  @override
  _ChgNotiProvProxyPrvState createState() => _ChgNotiProvProxyPrvState();
}

class _ChgNotiProvProxyPrvState extends State<ChgNotiProvProxyPrv> {
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
              ProxyProvider<Counter, Translations>(
                  update: (_, counter, __) => Translations(counter.counter)),
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowTranslations(),
                SizedBox(height: 20.0),
                IncreaseButton()
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
