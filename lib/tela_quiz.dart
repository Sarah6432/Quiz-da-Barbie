import 'dart:async';
import 'package:flutter/material.dart';
import 'tela_resultado.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaQuiz(),
    );
  }
}

class TelaQuiz extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz> {
  int _perguntaAtual = 0;
  int _pontuacao = 0;
  bool isAnswered = false;
  bool isCorrect = false;
  late Timer _timer;
  int _remainingTime = 20;
  int _perguntasRespondidas = 0; 

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  final List<Pergunta> _perguntas = [
    Pergunta(
      pergunta: ' Qual é o nome completo da Barbie?',
      respostas: [
        ' Barbara Roberts',
        'Barbara Millicent Roberts',
        ' Barbara Anne Roberts',
        'Barbara Lynn Roberts'
      ],
      respostaCorreta: 'Barbara Millicent Roberts',
      imagePath: "assets/imagens/nome.jpg",
    ),
      Pergunta(
      pergunta: 'Quantas profissões a barbie tem?',
      respostas: [
        ' Menos de 100',
        ' Mais de 150',
        'Mais de 200',
        'A barbie não tem'
      ],
      respostaCorreta: 'Mais de 200',
      imagePath: "assets/imagens/profissoes.jpg",
    ),
    Pergunta(
      pergunta: 'Quem é o par romântico/namorado da barbie?',
      respostas: ['Kevin', 'Brad', ' Ken ', 'Ryan'],
      respostaCorreta: ' Ken ',
      imagePath: "assets/imagens/namorado.jpg",
    ),
    Pergunta(
      pergunta: 'Qual é o nome da irmã mais nova da Barbie?',
      respostas: [' Stacey', 'Cassie', 'Skipper', 'Chelsea'],
      respostaCorreta: 'Chelsea',
      imagePath: "assets/imagens/irma.jpg",
    ),
    Pergunta(
      pergunta: 'Quem é o criador da Barbie?',
      respostas: ['Ruth Handler', 'Mattel Smith', 'Ken Carson', 'Alan Handler'],
      respostaCorreta: 'Ruth Handler',
      imagePath: "assets/imagens/criadora.jpg",
    ),
    Pergunta(
      pergunta:
          'Em qual filme a Barbie interpreta uma princesa que troca de lugar com uma plebeia?',
      respostas: [
        ' Barbie em A Princesa e a Plebeia',
        ' Barbie em A Princesa e a Esquecida',
        ' Barbie em A Princesa e a Popstar',
        'Barbie e as 12 Princesas Bailarinas'
      ],
      respostaCorreta: 'Barbie em A Princesa e a Plebeia',
      imagePath: "assets/imagens/princesaeplebeia.jpg",
    ),
    Pergunta(
      pergunta:
          'Qual é o título do filme da Barbie em que ela interpreta uma sereia?',
      respostas: [
        'Barbie e o Segredo das Sereias',
        'Barbie e as Caldas Mágicas',
        'Barbie em A Sereia das Pérolas',
        'Barbie em Sereia e Magia'
      ],
      respostaCorreta: 'Barbie em A Sereia das Pérolas',
      imagePath: "assets/imagens/sereia.jpg",
    ),
    Pergunta(
      pergunta:
          'Em qual filme a Barbie interpreta uma fada que descobre um segredo mágico?',
      respostas: [
        'Barbie Moda e Magia',
        ' Barbie e o Castelo das Fadas',
        'Barbie e o Segredo das Fadas',
        'Barbie em O Encantado Mundo das Fadas'
      ],
      respostaCorreta: 'Barbie e o Segredo das Fadas',
      imagePath: "assets/imagens/segredodasfadas.jpg",
    ),
    Pergunta(
      pergunta: 'Qual é o nome do primeiro filme da Barbie?',
      respostas: [
        'Barbie e as Três Mosqueteiras',
        'Barbie em O Quebra-Nozes',
        'Barbie A Estrela do Rock',
        'Barbie em O Lago dos Cisnes'
      ],
      respostaCorreta: 'Barbie A Estrela do Rock',
      imagePath: "assets/imagens/filme.jpg",
    ),
    Pergunta(
        pergunta: 'Barbie é uma fada sem asas em qual filme?',
        respostas: [
          'Barbie e o Portal Secreto',
          'Barbie: Fairytopia',
          'Barbie e o Castelo de Diamantes',
          'Barbie e o Segredo das Fadas ',
        ],
        respostaCorreta: 'Barbie: Fairytopia',
        imagePath: "assets/imagens/bibble.jpg"),

  ];

  void startTimer() {
    _remainingTime = 20;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
          handleTimeout();
        }
      });
    });
  }

  void checkAnswer(String userAnswer) {
    String respostaCorreta = _perguntas[_perguntaAtual].respostaCorreta;
    setState(() {
      isAnswered = true;
      isCorrect = userAnswer == respostaCorreta;
      if (isCorrect) {
        _pontuacao++;
      }
      _timer.cancel();
      _perguntasRespondidas++; 
      if (_perguntaAtual < _perguntas.length - 1) {
        _perguntaAtual++;
        startTimer();
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TelaResultado(_pontuacao, _perguntas.length, _perguntasRespondidas)),
        );
      }
    });
  }

  void handleTimeout() {
    if (_perguntaAtual < _perguntas.length - 1) {
      setState(() {
        _perguntaAtual++;
      });
      startTimer();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaResultado(_pontuacao, _perguntas.length, _perguntasRespondidas)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 31, 160),
      appBar: AppBar(
        title: Text(
          'Vamos começar!',
          style: const TextStyle(
              fontFamily: 'fontenova', fontSize: 27, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 216, 31, 160),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/imagens/barbie1.jpg",
            ),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              _perguntas[_perguntaAtual].imagePath,
              width: 150,
              height: 150,
            ),
            Text(
              _perguntas[_perguntaAtual].pergunta,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'fontenova',
                color: Color.fromARGB(255, 255, 253, 254),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
              width: 30,
            ),
            Text(
              'Pergunta ${_perguntaAtual + 1} de ${_perguntas.length}',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'fontenova',
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'tempo para responder: $_remainingTime segundos',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'fontenova',
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            ...(_perguntas[_perguntaAtual].respostas).map((resposta) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 9.0),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(resposta);
                  },
                  child: Text(
                    resposta,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'fontenova',
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    backgroundColor: Color.fromARGB(255, 216, 31, 160),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class Pergunta {
  final String pergunta;
  final List<String> respostas;
  final String respostaCorreta;
  final String imagePath;

  Pergunta({
    required this.pergunta,
    required this.respostas,
    required this.respostaCorreta,
    required this.imagePath,
  });
}
