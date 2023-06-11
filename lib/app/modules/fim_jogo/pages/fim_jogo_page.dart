import 'package:flutter/material.dart';

class FimJogoPage extends StatelessWidget {
  final int? score;
  final int? acertos;
  final int? erros;
  final int? ranking;

  FimJogoPage({
    this.score,
    this.acertos,
    this.erros,
    this.ranking,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fim do Jogo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Perguntas corretas: $acertos',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Perguntas erradas: $erros',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Posição no ranking: $ranking',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Reiniciar o jogo ou executar outra ação necessária
              },
              child: Text('Jogar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
