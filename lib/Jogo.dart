import 'package:flutter/material.dart';
import 'dart:math';
class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemAPP =AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";
  void _opcaoSelecionada(String escolhadousuario){

      var opcoes =["pedra","papel","tesoura"];
      var numero = Random().nextInt(3);
      var escolhaApp = opcoes[numero];

      print("Escolha do App:"+escolhaApp);
      print("Escolha do usuario:"+escolhadousuario);
      //Exibição de imagem
      switch(escolhaApp){
        case "pedra":
          setState(() {
           this._imagemAPP = AssetImage("imagens/pedra.png");
          });
          break;
        case "papel":
          setState(() {
            this._imagemAPP = AssetImage("imagens/papel.png");
          });
          break;
        case "tesoura":
          setState(() {
            this._imagemAPP = AssetImage("imagens/tesoura.png");
          });
          break;
      };

      //validação do ganhador
      //usuario ganhador
      if(
          (escolhadousuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhadousuario == "tesoura" && escolhaApp == "papel") ||
          (escolhadousuario == "papel" && escolhaApp == "pedra")
      )
      {
        setState(() {
          this._mensagem="Parabéns!!! Você ganhou essa partida.";
        });

      } else if(
          (escolhaApp == "pedra" && escolhadousuario == "tesoura") ||
          (escolhaApp == "tesoura" && escolhadousuario == "papel") ||
          (escolhaApp == "papel" && escolhadousuario == "pedra"))
      {//App ganha
        setState(() {
          this._mensagem="Você Perdeu, continue tentando";
        });

      }else {
        setState(() {
          this._mensagem = "Houve um empate entre você e a maquina!";
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("JokenPo"),
      ) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text("Escolha do App:",
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          )
            ,),
          Image(
            image: this._imagemAPP,
          ),
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap:()=>_opcaoSelecionada("pedra"),child: Image.asset("imagens/pedra.png",height: 100,)),
              GestureDetector(onTap:()=>_opcaoSelecionada("papel"),child: Image.asset("imagens/papel.png",height: 100,)),
              GestureDetector(onTap:()=>_opcaoSelecionada("tesoura"),child: Image.asset("imagens/tesoura.png",height: 100,)),

              /*
              Image.asset("imagens/pedra.png",height: 100,),
              Image.asset("imagens/papel.png",height: 100),
              Image.asset("imagens/tesoura.png",height: 100),
              */
            ],
          ),


        ],
      ),
    );
  }
}
