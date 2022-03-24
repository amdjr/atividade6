import 'package:atividade6/user_dados.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'received.dart';
import 'user_dados.dart';

class FormClass extends StatefulWidget {
  const FormClass({Key? key}) : super(key: key);

  @override
  _FormClassState createState() => _FormClassState();
}

class _FormClassState extends State<FormClass> {
  TextEditingController _controllerNome = TextEditingController();

  int idade1 = 0,
      idade2 = 1,
      idade3 = 2; //variaveis de controle dos RadioButtons
  int radioState = 0;
  bool music = false,
      games = false,
      sports = false,
      movies = false,
      news = false;

  //bool checkState = true;

  bool switchNews = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);

    UserDados userDados = UserDados.userDadosInstance;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Formulário Adilson Monteiro"),
      ),
      body: Center(
        child: Container(
          color: Colors.white12,
          width: deviceInfo.size.width * 0.8,
          margin: EdgeInsets.only(top: 20, bottom: 30),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Preencha o formulário",
                  style: GoogleFonts.abel(
                      textStyle: TextStyle(
                    fontSize: 25,
                  )),
                ),
                TextField(
                    cursorColor: Colors.tealAccent,
                    maxLength: 30,
                    controller: _controllerNome,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Nome",
                      helperText: "Digite seu nome",
                    )),
                Text(
                  "Faixa etária",
                  style: GoogleFonts.abel(
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio(
                        value: idade1,
                        groupValue: radioState,
                        onChanged: (radio) {
                          setState(() {
                            radioState = idade1;
                          });
                        }),
                    Text("Menor que 18 anos"),
                    Radio(
                        value: idade2,
                        groupValue: radioState,
                        onChanged: (radio) {
                          setState(() {
                            radioState = idade2;
                          });
                        }),
                    Text("Entre 10 e 35 anos"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: idade3,
                        groupValue: radioState,
                        onChanged: (radio) {
                          setState(() {
                            radioState = idade3;
                          });
                        }),
                    Text("Mais que 35 anos"),
                  ],
                ),
                Text(
                  "Interesses",
                  style: GoogleFonts.abel(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: music,
                        onChanged: (radio) {
                          setState(() {
                            music = !music;
                          });
                        }),
                    Text("Musica"),
                    Checkbox(
                        value: games,
                        onChanged: (check) {
                          setState(() {
                            games = !games;
                          });
                        }),
                    Text("Games"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: sports,
                        onChanged: (radio) {
                          setState(() {
                            sports = !sports;
                          });
                        }),
                    Text("Esportes"),
                    Checkbox(
                        value: movies,
                        onChanged: (radio) {
                          setState(() {
                            movies = !movies;
                          });
                        }),
                    Text("Filmes"),
                  ],
                ),
                SwitchListTile(
                    activeColor: Colors.tealAccent,
                    title: Text("Deseja receber notícias?"),
                    value: news,
                    onChanged: (switchNews) {
                      setState(() {
                        news = !news;
                      });
                    }),
                ElevatedButton(
                  onPressed: () {
                    userDados.setNome = _controllerNome.text;
                    userDados.faixaEtaria = examinaIdade();
                    userDados.interesses = exameInteresses();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyReceivedData()));
                  },
                  child: Text("Enviar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String examinaIdade() {
    switch (radioState) {
      case 0:
        return "Menor que 18";
        break;
      case 1:
        return "Entre 10 e 35 anos";
        break;
      case 2:
        return "Mais que 35 anos";
        break;
    }
    return examinaIdade();
  }

  String exameInteresses() {
    List interesses = [];
    if (music) {
      interesses.add("Música");
    }
    if (games) {
      interesses.add("Games");

      if (sports) {
        interesses.add("Esportes");
      }
      if (music) {
        interesses.add("Filmes");
      }
    }
    return interesses.toString();
  }
}
