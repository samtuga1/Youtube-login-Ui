import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                    width: 150,
                    child: Lottie.asset(
                        'asset/lock.json',
                      controller: _controller,
                      onLoaded: (composition) {
                          _controller..duration = composition.duration..forward();
                          _controller.addStatusListener((status) {
                            if(status == AnimationStatus.completed){
                              _controller.reset();
                              _controller.forward();
                            }
                          });
                      }
                    ),
                ),
                const Text('Welcome to Saifty!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),),
                const SizedBox(height: 7.0,),
                const Text('Keep your data safe', style: TextStyle(fontSize: 18, color: Colors.grey),),
                const SizedBox(height: 35.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    height: 60,
                      decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: const TextFieldContainer(label: 'Email', icon: Icons.email,)
                  ),

                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: const TextFieldContainer(label: 'Password', icon: Icons.visibility,)
                  ),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:const Center(child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),)
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Forgot Password?', style: TextStyle(color: Colors.purple, fontSize: 17),),
                const SizedBox(height: 70,),
                const Text.rich(
                    TextSpan(
                        children: [
                      TextSpan(text: 'Don\'t have and account?', style: TextStyle(color: Colors.black, fontSize: 17)),
                          TextSpan(text: 'Register', style: TextStyle(color: Colors.purple, fontSize: 17),
                          )],
                    ),)
              ],
            ),
          ),
        ),
      ),
    );

  }
}


class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({Key? key, required this.label,required this.icon}) : super(key: key);
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: Icon(icon),
          border: InputBorder.none,
          label: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(label, style: const TextStyle(color: Colors.grey),),)
      ),
    );
  }
}
