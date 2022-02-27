import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  final int _value;

  const Translations(this._value);

  String get title => "You clicked $_value times";
}

class ProxyProv0and1 extends StatefulWidget {
  const ProxyProv0and1({Key? key}) : super(key: key);

  @override
  _ProxyProv0and1State createState() => _ProxyProv0and1State();
}

class _ProxyProv0and1State extends State<ProxyProv0and1> {
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
        appBar: AppBar(title: const Text("ProxyProvider 0 and 1")),
        body: Center(
          child: MultiProvider(
            providers: [
              ProxyProvider0<int>(
                update: (_, __) => counter,
              ),
              ProxyProvider<int, Translations>(
                update: (_, value, __) => Translations(value),
              )
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ShowTranslations(),
                const SizedBox(height: 20.0),
                IncreaseButton(increment: increment)
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
  final VoidCallback increment;
  const IncreaseButton({Key? key, required this.increment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: increment,
        child: const Text('INCREASE', style: TextStyle(fontSize: 20.0)));
  }
}
