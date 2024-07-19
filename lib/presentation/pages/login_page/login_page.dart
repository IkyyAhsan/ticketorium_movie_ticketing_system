import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketorium_app_project/presentation/extentions/build_context_extention.dart';
import 'package:ticketorium_app_project/presentation/misc/methods.dart';
import 'package:ticketorium_app_project/presentation/providers/router/router_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/user_data/user_data_provider/user_data_provider.dart';
import 'package:ticketorium_app_project/presentation/widgets/ticketorium_text_field.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userDataProvider, (previous, next){
      if(next is AsyncData){
        if(next.value != null){
          ref.read(routerProvider).goNamed('main');
        }
      } else if(next is AsyncError){
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      body: ListView(
        children: [
          verticalSpace(100),
          Center(child: Image.asset('assets/logos/ticketorium_logo.png', width: 200,)),
          verticalSpace(100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TicketoriumTextField(labelText: 'Email', controller: emailController,),
                verticalSpace(24),
                TicketoriumTextField(labelText: 'Password', controller: passwordController, obsecureText: true,),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){}, 
                    child: const Text("Forget Password?", style: TextStyle(fontWeight: FontWeight.bold),)
                  ),
                ),
                verticalSpace(24),
                switch(ref.watch(userDataProvider)){
                  AsyncData(:final value) => value == null ?
                  SizedBox(width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      ref.read(userDataProvider.notifier).login(email: emailController.text, password: passwordController.text);
                    }, 
                    child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold),)
                  ),
                  ) :
                  const Center(child: CircularProgressIndicator(),),
                  _ => const Center(child: CircularProgressIndicator(),),
                },
                verticalSpace(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(onPressed: (){
                      ref.read(routerProvider).goNamed('register');
                    }, 
                    child: const Text("Register here", style: TextStyle(fontWeight: FontWeight.bold),))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}