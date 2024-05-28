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
      backgroundColor: Color.fromARGB(255, 216, 31, 160), //Color.fromARGB(255, 255, 141, 240),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Column(
            children: [
              Text(
                "Bem Vindo(a) ao Quiz",
                style: const TextStyle(
                    fontFamily: 'fontenova',
                    fontSize: 27,
                    color: Colors.white),
              ),
              Text("da Barbie!",
                style: TextStyle(
                    fontFamily: 'fontenova',
                    fontSize: 27,
                    color: Colors.white),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 216, 31, 160),
          elevation: 0,
          toolbarHeight: 72,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imagens/barbie.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            opacity: 0.3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 216, 31, 160),
              Color.fromARGB(255, 235, 52, 174),
              Color.fromARGB(255, 247, 93, 201),
              Color.fromARGB(255, 238, 122, 190),
              Color.fromARGB(255, 227, 90, 231),
              Color.fromARGB(255, 222, 161, 240),
              Color.fromARGB(255, 222, 161, 240),
              Color.fromARGB(255, 227, 90, 231),
              Color.fromARGB(255, 238, 122, 190),
              Color.fromARGB(255, 247, 93, 201),
              Color.fromARGB(255, 235, 52, 174),
              Color.fromARGB(255, 216, 31, 160),
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
                color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color.fromARGB(255, 216, 31, 160),
            ),
          ),
        )
        ),
      ),
    );
  }
}
