
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    if(Platform.isAndroid)
      return BottomSheet(
        onClosing: (){},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
                onPressed: getFromCamera,
                child: const Text('Câmera')
            ),
            FlatButton(
                onPressed: getFromGallery,
                child: const Text('Galeria')
            )
          ],
        ),
      );
     else
       return CupertinoActionSheet(
         title: const Text('Selecionar foto para o anúncio'),
          message: const Text('Escolha a origem da foto'),
          cancelButton: CupertinoActionSheetAction(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar', style: TextStyle(color: Colors.red),)
          ),
          actions: [
            CupertinoActionSheetAction(
                onPressed: getFromCamera,
                child: const Text('Câmera')
            ),
            CupertinoActionSheetAction(
                onPressed: getFromGallery,
                child: const Text('Galeria')
            ),
          ],
       );
  }

  Future<void> getFromCamera() async{
    final pikerFile = await ImagePicker().getImage(source: ImageSource.camera);
    imageSelected(File(pikerFile.path));
  }

  Future<void> getFromGallery() async {
    final pikerFile = await ImagePicker().getImage(source: ImageSource.gallery);
    imageSelected(File(pikerFile.path));
  }

  void imageSelected(File image){

  }

}
