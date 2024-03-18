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

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;

    return Scaffold(
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
                onPressed: (){
                  Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context){
                      return const LoginPage();
                    }));
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ) : currentIndex == 2 ? const SettingsPage() : Container(
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
    );
  }
}
