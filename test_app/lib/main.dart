import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('BiteMap'),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: currentIndex == 1 ? SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Card(child: EstablishmentCard(establishmentName: 'Elevated Card')),
                const Card.filled(child: EstablishmentCard(establishmentName: 'Filled Card')),
                const Card.outlined(child: EstablishmentCard(establishmentName: 'Outlined Card')),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                  onPressed: (){},
                  child: const Text('Button'),
                ),
              ],
            ),
          ) : currentIndex == 2 ? const SizedBox() : Container(
            color: Colors.black38,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.arrow_back,
                size: 34, 
                //color: Color.fromRGBO(245, 246, 250, 1)
              ),
              label: 'Back',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 34,
                //color: Color.fromRGBO(245, 246, 250, 1),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 34,
                //color: Color.fromRGBO(245, 246, 250, 1),
              ),
              label: 'Settings',
            ),
          ], 
          backgroundColor: Colors.redAccent,
          currentIndex: currentIndex,
          onTap: (int index){
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class EstablishmentCard extends StatelessWidget {
  const EstablishmentCard({required this.establishmentName});
  final String establishmentName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Center(child: Text(establishmentName)),
    );
  }
}
