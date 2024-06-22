import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/views/widgets/tabs/about_tab.dart';
import 'package:pokemon_app/views/widgets/tabs/base_stats_tab.dart';
import 'package:pokemon_app/views/widgets/tabs/evolution_tab.dart';
import 'package:pokemon_app/views/widgets/tabs/moves_tab.dart';

class PokemonDetailBottom extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailBottom({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabBar(
                isScrollable: true, // Make the TabBar scrollable
                labelColor: Colors.black, // Active tab color
                unselectedLabelColor: Colors.grey, // Inactive tab color
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ), // Active tab text style
                unselectedLabelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ), // Inactive tab text style
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                  insets: EdgeInsets.symmetric(horizontal: 16),
                ),
                tabs: [
                  Tab(text: 'About'),
                  Tab(text: 'Base Stats'),
                  Tab(text: 'Evolution'),
                  Tab(text: 'Moves'),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TabBarView(
                  children: [
                    AboutTab(pokemon: pokemon),
                    BaseStatsTab(pokemon: pokemon),
                    const EvolutionTab(),
                    const MovesTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
