import 'package:flutter/material.dart';

main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/5.jpg',
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, bottom: 0, right: 14, left: 14),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Controle de Entrada',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  isFull ? 'Capacidade máxima atingida' : 'Pode Entrar...',
                  style: TextStyle(
                      fontSize: isFull ? 40 : 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                      fontSize: 150,
                      color: isFull ? Colors.pink : Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: isFull ? null : increment,
                      style: TextButton.styleFrom(
                        backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) :
                        Colors.white,
                        padding: const EdgeInsets.only(
                            left: 28, right: 28, top: 18, bottom: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: Text(
                        'Entrou',
                        style: TextStyle(color: Colors.black, fontSize: 34),
                      )),
                  TextButton(
                      onPressed: isEmpty ? null : decrement,
                      style: TextButton.styleFrom(
                        backgroundColor: isEmpty
                            ? Colors.white.withOpacity(0.3)
                            : Colors.white,
                        padding: const EdgeInsets.only(
                            left: 28, right: 28, top: 18, bottom: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: Text(
                        ' Saiu ',
                        style: TextStyle(color: Colors.black, fontSize: 34),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
