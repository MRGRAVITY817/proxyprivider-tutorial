import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  // If you use `late`, then you don't need to make a constructor to obtain that value.
  // But you have to get it somehow later.
  late int _value;

  void update(int newValue) {
    _value = newValue;
  }

  String get title => "You clicked $_value times";
}

class ProxyProvCreateUpdate extends StatefulWidget {
  const ProxyProvCreateUpdate({Key? key}) : super(key: key);

  @override
  _ProxyProvCreateUpdateState createState() => _ProxyProvCreateUpdateState();
}

class _ProxyProvCreateUpdateState extends State<ProxyProvCreateUpdate> {
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
        appBar: AppBar(title: const Text("ProxyProvider Create & Update")),
        body: Center(
          child: ProxyProvider0<Translations>(
              create: (_) => Translations(),
              update: (_, Translations? translations) {
                // Mutated the `Translations` instance using it's method `update`
                translations!.update(counter);
                // Return mutated `Translations` instance
                return translations;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ShowTranslations(),
                  const SizedBox(height: 20.0),
                  IncreaseButton(increment: increment)
                ],
              )),
        ));
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // using `context.watch` to get the value of Provider
    final title = context.watch<Translations>().title;
    return Text(title, style: const TextStyle(fontSize: 28.0));
  }
}

class IncreaseButton extends StatelessWidget {
  // Callbacks `() => void` can be typed as `VoidCallback` type
  final VoidCallback increment;
  const IncreaseButton({Key? key, required this.increment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: increment,
        child: const Text('INCREASE', style: TextStyle(fontSize: 20.0)));
  }
}
