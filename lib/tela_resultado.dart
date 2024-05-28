import 'package:flutter/material.dart';

class TelaResultado extends StatefulWidget {
  final int pontuacao;
  final int totalPerguntas;
  final int perguntasRespondidas;

  TelaResultado(this.pontuacao, this.totalPerguntas, this.perguntasRespondidas);

  @override
  _TelaResultadoState createState() => _TelaResultadoState();
}

class _TelaResultadoState extends State<TelaResultado> {
  @override
  Widget build(BuildContext context) {
    int _pontuacao = widget.pontuacao;
    int _totalPerguntas = widget.totalPerguntas;
    int _perguntasRespondidas = widget.perguntasRespondidas;
    String desempenho = '';

    double percentual = (_pontuacao / _totalPerguntas) * 100;

    String imagemDesempenho = '';

    if (percentual >= 90) {
      desempenho = 'Excelente!';
      imagemDesempenho = 'assets/imagens/excelente.jpg'; 
    } else if (percentual >= 50) {
      desempenho = 'Bom, mas pode melhorar';
      imagemDesempenho = 'assets/imagens/podemelhorar.jpg'; 
    } else {
      desempenho = 'Por favor, melhore!';
      imagemDesempenho = 'assets/imagens/melhore.jpg'; 
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Aqui estão suas pontuações!",
          style: TextStyle(
            fontFamily: 'fontenova',
            fontSize: 27,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 216, 31, 160),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/imagens/resultados2.jpg",
            ),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
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
            Text(
              'Você completou o quiz!',
              style: TextStyle(
                fontFamily: 'fontenova',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "sua pontuação foi: $_pontuacao de $_totalPerguntas ",
              style: TextStyle(
                fontFamily: 'fontenova',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
               "Seu desempenho foi :  $desempenho",
              style: TextStyle(
                fontFamily: 'fontenova',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Exibindo a imagem correspondente ao desempenho
            if (imagemDesempenho.isNotEmpty)
              Image.asset(
                imagemDesempenho,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
            Text(
              'total de perguntas respondidas: $_perguntasRespondidas',
              style: TextStyle(
                fontFamily: 'fontenova',
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text(
                "Recomeçar",
                style: TextStyle(
                  fontFamily: 'fontenova',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 216, 31, 160),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
