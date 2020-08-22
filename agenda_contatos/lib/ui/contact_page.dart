import 'dart:io';

import 'package:agenda_contatos/helpers/Contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;
  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameFocus = FocusNode();
  Contact _editContact;
  bool _userEdited = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.contact == null){
      _editContact = Contact();
    }else{
      _editContact = Contact.fromMap(widget.contact.toMap());
      _nameController.text = _editContact.name;
      _emailController.text = _editContact.email;
      _phoneController.text = _editContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editContact.name ?? "Novo Contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(_editContact.name != null && _editContact.name.isNotEmpty){
              Navigator.pop(context, _editContact);
            }else{
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  ImagePicker.platform.pickImage(source: ImageSource.camera).then((file){
                    if(file == null){
                      return;
                    }else{
                      setState(() {
                        _editContact.img = file.path;
                      });
                    }
                  });
                },
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _editContact.img != null ?
                        FileImage(File(_editContact.img)) :
                        AssetImage("images/person.png"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Nome"),
                controller: _nameController,
                focusNode: _nameFocus,
                onChanged: (text){
                  _userEdited = true;
                  setState(() {
                    _editContact.name = text;
                  });
                },
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (text){
                  _userEdited = true;
                  _editContact.email = text;
                },
              ),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: "Phone"),
                onChanged: (text){
                  _userEdited = true;
                  setState(() {
                    _editContact.phone = text;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool>_requestPop(){
    if(_userEdited){
      showDialog(context: context,
      builder:(context){
        return AlertDialog(
          title: Text("Descartar Alterações?"),
          content: Text("Se sair as alterações serão perdidas"),
          actions: [
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              }
            ),
            FlatButton(
              child: Text("Sim"),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        );
      }
      );
      return Future.value(false);
    }else{
      return Future.value(true);
    }
  }
}
