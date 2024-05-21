import 'package:flutter/material.dart';
import 'tela_resultado.dart';

class TelaQuiz extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz> {
  int _perguntaAtual = 0;
  int _pontuacao = 0;

  final List<Pergunta> _perguntas = [
    Pergunta(
      pergunta: 'Quem pintou a obra "Noite Estrelada"?',
      respostas: [
        ' Pablo Picasso',
        ' Vincent van Gogh',
        'Leonardo da Vinci',
        ' Claude Monet'
      ],
      respostaCorreta: 'Vincent van Gogh',
    ),
    Pergunta(
      pergunta:
          ' Qual é a famosa obra de Leonardo da Vinci que retrata a Última Ceia de Jesus com seus apóstolos?',
      respostas: [
        ' A Ronda da Noite',
        'Guernica',
        ' O Nascimento de Vênus',
        'A Última Ceia'
      ],
      respostaCorreta: 'A Última Ceia',
    ),
    Pergunta(
      pergunta: 'Quem pintou a Mona Lisa?',
      respostas: ['Van Gogh', 'Michelangelo', 'Leonardo da Vinci', 'Picasso'],
      respostaCorreta: 'Leonardo da Vinci',
    ),
    Pergunta(
      pergunta: 'Quem pintou o Quadrado dos Sete Estrelas?',
      respostas: [
        'Vincent van Gogh',
        'Leonardo da Vinci',
        'Pablo Picasso',
        'Claude Monet'
      ],
      respostaCorreta: 'Vincent van Gogh',
    ),
    Pergunta(
      pergunta: 'Quem pintou o Guernica?',
      respostas: [
        'Pablo Picasso',
        'Vincent van Gogh',
        'Leonardo da Vinci',
        'Claude Monet'
      ],
      respostaCorreta: 'Pablo Picasso',
    ),
    Pergunta(
      pergunta: 'Quem é conhecido por criar a escultura "O Pensador"?',
      respostas: [
        'Vincent van Gogh',
        'Michelangelo',
        'Auguste Rodin',
        'Pablo Picasso'
      ],
      respostaCorreta: 'Auguste Rodin',
    ),
    Pergunta(
      pergunta:
          ' Qual é o nome da pintura de Edvard Munch que retrata uma figura gritando em desespero?',
      respostas: [
        'A Noite Estrelada',
        'Monalisa',
        'O Grito',
        'A Persistência da Memória'
      ],
      respostaCorreta: 'O Grito',
    ),
    Pergunta(
      pergunta: 'Quem é considerado o mestre do impressionismo?',
      respostas: [
        'Pablo Picasso',
        'Vincent van Gogh',
        'Salvador Dalí',
        'Claude Monet'
      ],
      respostaCorreta: 'Claude Monet',
    ),
  ];

  void _responderPergunta(String resposta) {
    if (_perguntas[_perguntaAtual].respostaCorreta == resposta) {
      setState(() {
        _pontuacao++;
      });
    }

    if (_perguntaAtual < _perguntas.length - 1) {
      setState(() {
        _perguntaAtual++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaResultado(_pontuacao, _perguntas.length)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 47, 109),
      appBar: AppBar(
        title: Text(
          'Vamos as perguntas!',
          style: const TextStyle(
              fontFamily: 'fontenova',
              fontSize: 27,
              color: Color.fromARGB(255, 226, 211, 74)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 28, 47, 109),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imagens/vangogh.jpg"),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
            opacity: 0.3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              const Color.fromARGB(255, 28, 47, 109),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _perguntas[_perguntaAtual].pergunta,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'fontenova',
                color: Color.fromARGB(255, 28, 47, 109),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
              width: 20,
            ),
            ...(_perguntas[_perguntaAtual].respostas).map((resposta) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 9.0),
                child: ElevatedButton(
                  onPressed: () {
                    _responderPergunta(resposta);
                  },
                  child: Text(
                    resposta,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'fontenova',
                      color: Color.fromARGB(255, 226, 211, 74),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color.fromARGB(255, 107, 117, 151),
                      ),
                    ),
                    backgroundColor: Color.fromARGB(255, 28, 47, 109),
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

  Pergunta({
    required this.pergunta,
    required this.respostas,
    required this.respostaCorreta,
  });
}
