import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('LOGIN PAGE'),
        titleTextStyle: const TextStyle(
          color: Colors.white, 
          fontSize: 24,        
          fontWeight: FontWeight.bold, 
        ), 
      ),
        body: const LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'nida' && password == '123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Gagal'),
          content: const Text('Salah Password atau Username'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/latar.jpg"),
          fit: BoxFit.cover,
        ),),
    child: Center(    
      child: SizedBox(
        width: 300,
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                'Login',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  hintText: 'password',
                ),
              ),
            ),
            TextButton(
              onPressed: () => _login(context),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 184, 16, 75)),
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Color.fromARGB(255, 247, 245, 245)),
              ),
            ),
          ],
        ),
      ),
    ),
  );  
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/latar.jpg'), 
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: const Color.fromARGB(0, 239, 13, 93), 
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 197, 6, 73),
            title: const Text('Dashboard'),
            titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), 
              fontSize: 24,        
              fontWeight: FontWeight.bold, 
            ),
            iconTheme: const IconThemeData(
              color: Colors.white, 
            ),
          ),
          body: const Center(
            child: Text(
              'Welcome',
              style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold,),
            ),
          ),
        ),
      ],
    );
  }
}