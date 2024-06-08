import 'package:flutter/material.dart';
import 'package:ambion_flutter_app/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 190, 171, 1),
      body: Column(
        children: [
          const Text('5800 Coffee',
              style: TextStyle(
                  color: Color(0xFFAD5502),
                  fontSize: 60,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 16,
          ),
          const Text('Log-in to order',
              style: TextStyle(
                color: Color.fromRGBO(250, 250, 250, 1),
                fontSize: 16,
              )),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Username',
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              filled: true,
              fillColor: Color(0xFFF0D385).withOpacity(0.5),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              filled: true,
              fillColor: Color(0xFFF0D385).withOpacity(0.5),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    print('Forgot is clicked');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: const Text('Forgot Password?'))),
          SizedBox(
            width: 250,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 202, 169, 2)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Color.fromARGB(255, 104, 74, 31)),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Or Sign-in with:',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/google.png',
                    height: 20,
                    width: 20,
                  ),
                  const Text('Log-in with Google'),
                ],
              )),
          const SizedBox(
            height: 4,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/facebook.png',
                    height: 20,
                    width: 20,
                  ),
                  const Text('Log-in with Facebook'),
                ],
              )),
          Row(
            children: [
              const Text(
                "Dont have an account?",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign-up',
                    style: TextStyle(
                        color: Color.fromARGB(255, 31, 30, 30),
                        decoration: TextDecoration.underline),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
