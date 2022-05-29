import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon_model.dart';
import '../ui/widget/item_grid_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemonList = [];
  List<PokemonModel> pokemonModelList = [];
  @override
  initState() {
    super.initState();
    getDataPokemon();
  }

  getDataPokemon() async {
    Uri _uri = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.Response response = await http.get(_uri);
    Map<String, dynamic> myMap = json.decode(response.body);
    pokemonList = myMap['pokemon'];
    pokemonModelList =
        pokemonList.map((e) => PokemonModel.fromJson(e)).toList();
    setState(() {});
    // myMap['pokemon'].forEach((v){
    //   print(v['name']);
    // });
    // pokemonList.forEach((v){
    //   print(v['name']);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokedexApp'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Pokedex',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.3,
                children: pokemonModelList
                    .map<Widget>(
                      (e) => ItemGridWidget(
                        // name: e.name,
                        // image: e.img,
                        // type: e.type,
                        pohemon: e,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: pokemonList.length,
      //   itemBuilder: (BuildContext context,int index){
      //     return ListTile(
      //       leading: CircleAvatar(
      //         backgroundImage: NetworkImage(pokemonList[index]['img']),
      //       ),
      //       title: Text(pokemonList[index]['name']),
      //     );
      //   },
      // ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 14),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //         ),
      //         child: Row(
      //           children: [
      //             CircleAvatar(
      //               backgroundImage: NetworkImage(
      //                   'http://www.serebii.net/pokemongo/pokemon/005.png'),
      //               radius: 25,
      //             ),
      //             const SizedBox(
      //               width: 20,
      //             ),
      //             Text(
      //               'Charmeleon',
      //               style: TextStyle(
      //                 fontSize: 18,
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
