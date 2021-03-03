import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/error_box.dart';
import 'package:xlo_mobx/screens/signup/signup_screen.dart';
import 'package:xlo_mobx/store/login_store.dart';

class LoginScreen extends StatelessWidget {

  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Acessar com E-mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[900]
                      ),
                    ),
                    Observer(builder: (_){
                      return Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: ErrorBox(
                          message: loginStore.error,
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !loginStore.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: loginStore.emailError
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                      );
                    }),
                    SizedBox(height: 16,),
                    Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 4,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Senha',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Esquceu sua senha?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.purple
                              ),
                            ),
                            onTap: () {

                            },
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              enabled: !loginStore.loading,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: loginStore.passwordError
                              ),
                              obscureText: true,
                              onChanged: loginStore.setPassword,
                            );
                          }),

                          Observer(builder: (_) {
                            return Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20, bottom: 12),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                                      elevation: MaterialStateProperty.all(0),
                                      textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                          )
                                      )
                                  ),
                                  onPressed: () {},
                                  child: loginStore.loading
                                    ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white))
                                    : Text('ENTRAR '),
                                )
                            );
                          }),

                          Divider(color: Colors.black,),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                const Text(
                                  'Não tem uma conta?',
                                  style: TextStyle(fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => SignupScreen()));
                                  },
                                  child: Text(
                                    'Cadastre-se',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.purple,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
