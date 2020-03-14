import 'package:flutter/material.dart';
import 'package:whatsapp/model/Conversa.dart';

class AbaConversas extends StatefulWidget {
  @override
  _AbaConversasState createState() => _AbaConversasState();
}

class _AbaConversasState extends State<AbaConversas> {
  List<Conversa> listaConversas = [
    Conversa("Ana clara", "ola tudo bem?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-dc50a.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=edec69f1-6374-4836-a000-adc143bff373"),
    Conversa("Pedro Silva", "Me manda o nome daquela série que falamos!",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-dc50a.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=6784db55-1840-4152-bba9-3070fc4a054f"),
    Conversa("Marcela almeida", "vamo sair hoje?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-dc50a.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=7d94d7dd-c549-4b3a-bb4e-2aaa0d9fe066"),
    Conversa("José renato", "Não vai acreditar no que tenho para te contar...",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-dc50a.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=0e08a0a6-619c-48f8-9641-5eb9afdd1bfe"),
    Conversa("Jamilton", "Curso novo!! depois dá uma olhada",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-dc50a.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=36f7fdce-f772-46c3-b70c-510ace05c66e"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaConversas.length,
      itemBuilder: (context, index) {
        Conversa conversa = listaConversas[index];

        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(conversa.caminhoFoto),
          ),
          title: Text(
            conversa.nome,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            conversa.mensagem,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        );
      },
    );
  }
}
