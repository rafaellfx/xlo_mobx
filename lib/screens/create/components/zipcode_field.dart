import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/store/create_store.dart';
import 'package:xlo_mobx/store/zipcode_store.dart';

class ZipcodeField extends StatelessWidget {


  ZipcodeField(this.createStore): zipcodeStore = createStore.zipcodeStore;

  final CreateStore createStore;
  final ZipcodeStore zipcodeStore;
  
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Observer(builder: (_){
            return TextFormField(
              onChanged: zipcodeStore.setZipcode,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
              decoration: InputDecoration(
                errorText: createStore.addressError,
                labelText: 'CEP *',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                    fontSize: 18
                ),
                contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
            );
          }),
          Observer(builder: (_){
            final z = zipcodeStore;
            if(z.address == null && z.error == null && !z.loading){
              return Container();
            }else if(z.address == null && z.error == null){
              return LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple),
                backgroundColor: Colors.transparent,
              );
            }else if(z.error != null){
              return Container(
                alignment: Alignment.center,
                color: Colors.red.withAlpha(100),
                height: 50,
                padding: EdgeInsets.all(8),
                child: Text(
                  z.error,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red
                  ),
                ),
              );
            }else{
              final a = zipcodeStore.address;
              return Container(
                alignment: Alignment.center,
                color: Colors.purple.withAlpha(150),
                height: 50,
                padding: EdgeInsets.all(8),
                child: Text(
                  'Localização: ${a.district}, ${a.city.name} - ${a.uf.initials}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
          }),
        ]
      );

  }
}
