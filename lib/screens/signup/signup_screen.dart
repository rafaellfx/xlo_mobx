import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/error_box.dart';
import 'package:xlo_mobx/screens/login/components/field_title.dart';
import 'package:xlo_mobx/store/signup_store.dart';

class SignupScreen extends StatelessWidget {


  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Observer(builder: (_){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child: ErrorBox(
                          message: signupStore.error
                        ),
                      );
                    }),

                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios.',
                    ),
                    Observer(
                      builder: (_){
                        return TextField(
                          enabled: !signupStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: João S.',
                              isDense: true,
                              errorText: signupStore.nameError
                          ),
                          onChanged: signupStore.setName,
                        );
                      }
                    ),
                    const SizedBox(height: 16,),

                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um E-mail de confirmação.',
                    ),

                    Observer(
                        builder: (_){
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Exemplo: joao@gmail.com',
                                isDense: true,
                                errorText: signupStore.emailError
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            onChanged: signupStore.setEmail,
                          );
                        }
                    ),
                    const SizedBox(height: 16,),

                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta.',
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '(99)99999-9999',
                            isDense: true,
                            errorText: signupStore.phoneError
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        onChanged: signupStore.setPhone,
                      );
                    }),
                    const SizedBox(height: 16,),

                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais.',
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.pass1Error
                        ),
                        obscureText: true,
                        onChanged: signupStore.setPass1,
                      );
                    }),
                    const SizedBox(height: 16,),

                    FieldTitle(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita a senha.',
                    ),
                    Observer(
                      builder: (_){
                        return TextField(
                          enabled: !signupStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                            errorText: signupStore.pass2Error
                          ),
                          obscureText: true,
                          onChanged: signupStore.setPass2,
                        );
                      },
                    ),

                    Observer(builder: (_){
                      return Container(
                          height: 40,
                          margin: EdgeInsets.only(top: 20, bottom: 12),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                elevation: MaterialStateProperty.all(0),
                                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                            ),
                            onPressed: signupStore.signUpPressed,
                            child: signupStore.loading
                                ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)
                                : Text('CADASTRAR '),

                          )
                      );
                    }),

                    Divider(color: Colors.black,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const Text(
                            'Já tem uma conta? ',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                          GestureDetector(
                            onTap: () => { Navigator.of(context).pop()},
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16
                              ),
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
