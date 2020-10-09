import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemAPP = AssetImage('imagens/padrao.png');
  var _mensagem = 'Escolha uma opção abaixo';
  var _escolhaUsuario = '';
  var _statusJogo = '';

  Color _corStatusJogo(String escolhaUsuario) {
    bool opcaoCerta = _escolhaUsuario == escolhaUsuario;
    return _statusJogo == 'ganhou' && opcaoCerta
        ? Colors.lightGreenAccent
        : _statusJogo == 'perdeu' && opcaoCerta
            ? Colors.redAccent
            : _statusJogo == 'empate' && opcaoCerta
                ? Colors.yellowAccent
                : Colors.transparent;
  }

  void _opcaoSelecionada(String escolhadousuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    _escolhaUsuario = escolhadousuario;

    print('Escolha do App' + escolhaApp);
    print('Escolha do usuário' + escolhadousuario);
    //Exibição de imagem
    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          this._imagemAPP = AssetImage('imagens/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          this._imagemAPP = AssetImage('imagens/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          this._imagemAPP = AssetImage('imagens/tesoura.png');
        });
        break;
    }

    //validação do ganhador
    //usuário ganhador
    if ((escolhadousuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhadousuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhadousuario == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        this._mensagem = 'Parabéns!\nVocê ganhou essa partida.';
        _statusJogo = 'ganhou';
      });
    } else if ((escolhaApp == 'pedra' && escolhadousuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhadousuario == 'papel') ||
        (escolhaApp == 'papel' && escolhadousuario == 'pedra')) {
      //App ganha
      setState(() {
        this._mensagem = 'Você perdeu,\ncontinue tentando!';
        _statusJogo = 'perdeu';
      });
    } else {
      setState(() {
        this._mensagem = 'Foi empate\ndessa vez!';
        _statusJogo = 'empate';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokempô'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                'Escolha do Aplicativo',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image(
              image: this._imagemAPP,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () => _opcaoSelecionada('pedra'),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                      height: _escolhaUsuario == 'pedra' ? 120 : 100,
                      decoration: BoxDecoration(
                        color: _corStatusJogo('pedra'),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Image.asset(
                        'imagens/pedra.png',
                      ),
                    )),
                GestureDetector(
                    onTap: () => _opcaoSelecionada('papel'),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                      height: _escolhaUsuario == 'papel' ? 120 : 100,
                      decoration: BoxDecoration(
                        color: _corStatusJogo('papel'),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Image.asset(
                        'imagens/papel.png',
                      ),
                    )),
                GestureDetector(
                    onTap: () => _opcaoSelecionada('tesoura'),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                      height: _escolhaUsuario == 'tesoura' ? 120 : 100,
                      decoration: BoxDecoration(
                        color: _corStatusJogo('tesoura'),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Image.asset(
                        'imagens/tesoura.png',
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
