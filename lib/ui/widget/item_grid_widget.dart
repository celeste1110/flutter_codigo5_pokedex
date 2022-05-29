import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/models/pokemon_model.dart';
import 'package:flutter_codigo5_pokedex/pages/pokemon_detail_page.dart';

import '../../general/colors.dart';
import 'item_type_widget.dart';

class ItemGridWidget extends StatelessWidget {
  // String image;
  // String name;
  // List<String> type;
  PokemonModel pohemon;
  ItemGridWidget({

    required this.pohemon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PokemonDetailPage(pokemon: pohemon,)));
      },
      child: Container(
        decoration: BoxDecoration(
          //
          color: colorPokemon.keys.toList().contains(pohemon.type[0]) ?colorPokemon[pohemon.type[0]]:Colors.grey,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -24,
              right: -14,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 120,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(
                pohemon.img,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pohemon.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: pohemon.type
                        .map((e) => ItemTypeWidget(
                              type: e,
                            ))
                        .toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
