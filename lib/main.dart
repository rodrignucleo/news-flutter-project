import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Notícias',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  // Lista fictícia de notícias para demonstração
  List<Noticia> listaNoticias = [
    Noticia(
      titulo: 'Steam ajusta limites mínimos de preços, entenda as mudanças',
      resumo: 'As distribuidoras precisarão adequar os valores de jogos baratinhos para custarem no mínimo US\$0,99 em cada região',
      imagem: 'https://www.adrenaline.com.br/wp-content/plugins/seox-image-magick/imagick_convert.php?width=910&height=568&format=webp&quality=91&imagick=uploads.adrenaline.com.br/2023/05/Valve-faz-grandes-mudancas-no-Codigo-de-Conduta-e-nas-regras-do-Steam-912x569.jpg',
      conteudo: 'A Valve realizou mudanças nos valores mínimos praticados na Steam como medida para alinhar cada vez mais a precificação dos jogos de forma global, visando que os preços praticados não fiquem muito longe do que é praticado em dólar. Desta vez, a empresa revelou que uma de suas mudanças é no valor mínimo a ser praticado na venda de qualquer produto na Steam, para vender na plataforma, o produto precisa ter um valor que sua conversão é igual ou superior a US\$ 0,99. \nAlém do valor mínimo para venda, outra alteração realizada pela Valve foi nos novos limites para promoções de jogos que custem até US\$ 4,99, a medida serve para que um jogo nunca alcance um valor abaixo de US\$ 0,49 em uma promoção. Portanto, jogos que custem até US\$ 0,99 poderão ter um desconto máximo de 50%, os que custam até US\$ 1,99 terão um desconto máximo de 75%, enquanto os games que custam até US\$ 4,99 poderão oferecer desconto de até 90% na plataforma. ', 
    ),
    Noticia(
      titulo: 'Torneio oficial de Pokémon bane jogadores que usaram hack para montar time ',
      resumo: 'Pokémon World Championship, realizado no Japão, desclassificou vários participantes durante checagem de última hora contra uso de editor. ',
      imagem: 'https://www.adrenaline.com.br/wp-content/plugins/seox-image-magick/imagick_convert.php?width=910&height=568&format=webp&quality=91&imagick=uploads.adrenaline.com.br/2023/08/23_08_14_114516-912x569.jpg',
      conteudo: 'A edição mais recente do Pokémon World Championship, torneio da franquia organizado pela The Pokémon Company, gerou polêmica entre a comunidade de fãs e jogadores por uma aplicação mais rígida das regras exigida de última hora.O motivo da controvérsia foi o banimento de uma alta quantidade de participantes que entrou na competição com um ou vários Pokémon obtidos a partir de métodos alternativos, em especial o uso de um software de edição que “cria” o monstrinho perfeito para as suas necessidades.O problema? Apesar de serem tecnicamente ilegais, essas práticas não eram necessariamente combatidas pela organização. Desta vez, entretanto, o campeonato passou por uma análise técnica bem mais rígida, fazendo com que boa parte dos jogadores que usou programas para editar dados fosse pego e desclassificado.Como funciona o esquema?O método considerado ilegal pela organização é o uso de um software de edição de dados que é capaz de gerar um Pokémon com status, Nature e golpes solicitados pelo jogador. O PKHeX é um dos mais famosos nesse setor, mas não é o único. A partir desse tipo de programa, jogadores profissionais conseguem montar um time que até poderia existir no jogo base, porém demandaria uma enorme quantidade de tempo de jogo (e até mesmo uma pitada de sorte) com captura ou para chocar ovos até conseguir a espécie desejada.', 
    ),
    // ... Adicione quantas notícias quiser
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notícias'),
      ),
      body: ListView.builder(
        itemCount: listaNoticias.length,
        itemBuilder: (context, index) {
          return CardNoticia(noticia: listaNoticias[index]);
        },
      ),
    );
  }
}

class CardNoticia extends StatelessWidget {
  final Noticia noticia;

  CardNoticia({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
              leading: Image.network(noticia.imagem),
              title: Text(noticia.titulo),
              subtitle: Text(noticia.resumo),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetalhesNoticia(noticia: noticia),
      ),
    );
  },
)
,
    );
  }
}

class DetalhesNoticia extends StatelessWidget {
  final Noticia noticia;

  DetalhesNoticia({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.titulo),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(noticia.imagem),
              SizedBox(height: 16.0),
              Text(
                noticia.titulo,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                noticia.resumo,
                style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16.0),
              Text(
                noticia.conteudo,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Noticia {
  final String titulo;
  final String resumo;
  final String imagem;
  final String conteudo;

  Noticia({
    required this.titulo,
    required this.resumo,
    required this.imagem,
    required this.conteudo,
  });
}
