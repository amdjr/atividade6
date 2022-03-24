import 'package:atividade6/user_dados.dart';
import 'package:flutter/material.dart';

class MyReceivedData extends StatefulWidget {
  const MyReceivedData({Key? key}) : super(key: key);

  @override
  _MyReceivedDataState createState() => _MyReceivedDataState();
}

class _MyReceivedDataState extends State<MyReceivedData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados recebidos do formulário."),
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          child: Column(
            children: [
              Text(
                UserDados.userDadosInstance.getNome,
              ),
              Text(
                UserDados.userDadosInstance.faixaEtaria,
              ),
              Text(
                UserDados.userDadosInstance.interesses,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
