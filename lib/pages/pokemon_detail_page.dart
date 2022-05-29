import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/general/colors.dart';
import 'package:flutter_codigo5_pokedex/ui/widget/item_type_widget.dart';

import '../models/pokemon_model.dart';
import '../ui/widget/item_data_pokemon_widget.dart';

class PokemonDetailPage extends StatelessWidget {
 PokemonModel pokemon;

 PokemonDetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPokemon.keys.toList().contains(pokemon.type[0]) ?colorPokemon[pokemon.type[0]]:Colors.grey,
      appBar: AppBar(
        backgroundColor:colorPokemon.keys.toList().contains(pokemon.type[0]) ?colorPokemon[pokemon.type[0]]:Colors.grey,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.13,
            right: -20,
            child: Image.asset(
              'assets/images/pokeball.png',
              width: 200,
              color: Colors.white.withOpacity(0.26),
            ),
          ),
          // Positioned(
          //   top: 150,
          //   right: -14,
          //   child: Image.network(
          //     'http://www.serebii.net/pokemongo/pokemon/001.png',
          //   ),
          // ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(

                            children: pokemon.type.map((e) =>  ItemTypeWidget(type: e),).toList(),

                        ),
                      ],
                    ),
                    Text(
                      "#${pokemon.num}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              Expanded(
                flex: 5,
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                'About Pokemon',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ItemDataPokemonWidget(
                                title: "Height",
                                data: pokemon.height,
                              ),
                              ItemDataPokemonWidget(
                                title: "Weight",
                                data: pokemon.weight,
                              ),
                              ItemDataPokemonWidget(
                                title: "Egg",
                                data: pokemon.egg,
                              ),
                              ItemDataPokemonWidget(
                                title: "Candy",
                                data: pokemon.candy,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    Text('Multiplayers'),
                                    Row(
                                      children: pokemon.multipliers!.map((e) =>    Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 4),
                                        child: Chip(
                                          label: Text(e.toString()),
                                          elevation: 2,
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          backgroundColor: Colors.white54,
                                        ),
                                      ),).toList(),
                                    )



                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    Text('Weakness'),

                                    Expanded(
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: pokemon.weaknesses!.map((e) =>    Container(
                                            margin: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Chip(
                                              label: Text(e),
                                              elevation: 2,
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              backgroundColor: Colors.white54,
                                            ),
                                          ),).toList(),
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        Positioned.fill(
                          top: -160,
                          // right: MediaQuery.of(context).size.width*0.35,

                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.network(
                              pokemon.img,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


