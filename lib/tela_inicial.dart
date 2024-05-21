import 'package:flutter/material.dart';
import 'tela_quiz.dart';

class TelaInicial extends StatefulWidget {
  TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 28, 47, 109), //Color.fromARGB(255, 255, 141, 240),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Column(
            children: [
              Text(
                "Bem Vindo(a) ao Quiz",
                style: const TextStyle(
                    fontFamily: 'fontenova',
                    fontSize: 27,
                    color: Color.fromARGB(255, 226, 211, 74)),
              ),
              Text(
                "das Artes!",
                style: TextStyle(
                    fontFamily: 'fontenova',
                    fontSize: 27,
                    color: Color.fromARGB(255, 226, 211, 74)),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 28, 47, 109),
          elevation: 0,
          toolbarHeight: 72,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imagens/vangogh.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            opacity: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 28, 47, 109),
              Color.fromARGB(255, 79, 119, 165),
              Color.fromARGB(255, 123, 152, 185),
              Color.fromARGB(255, 241, 241, 241),
              Color.fromARGB(255, 190, 190, 190),
              Color.fromARGB(255, 234, 240, 161),
              Color.fromARGB(255, 196, 186, 104),
              Color.fromARGB(255, 145, 161, 73),
              Color.fromARGB(255, 255, 198, 12),
              Color.fromARGB(255, 241, 241, 241),
              Color.fromARGB(255, 123, 152, 185),
              Color.fromARGB(255, 79, 119, 165),
              Color.fromARGB(255, 28, 47, 109),
            ],
          ),
        ),
        child: Center(
            child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaQuiz()),
          ),
          child: Text(
            "Iniciar",
            style: const TextStyle(
                fontFamily: 'fontenova',
                fontSize: 25,
                color: Color.fromARGB(255, 226, 211, 74)),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color.fromARGB(255, 28, 47, 109),
            ),
          ),
        )),
      ),
    );
  }
}
