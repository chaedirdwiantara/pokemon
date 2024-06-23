import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/views/widgets/tabs/about_tab.dart';
import 'package:pokemon_app/views/widgets/tabs/base_stats_tab.dart';
import 'package:pokemon_app/views/widgets/tabs/evolution_tab.dart';
import 'package:pokemon_app/views/widgets/tabs/moves_tab.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_app/controllers/pokemon_controller.dart';

class PokemonDetailBottomLandscape extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailBottomLandscape({required this.pokemon});

  @override
  _PokemonDetailBottomLandscapeState createState() =>
      _PokemonDetailBottomLandscapeState();
}

class _PokemonDetailBottomLandscapeState
    extends State<PokemonDetailBottomLandscape> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Provider.of<PokemonController>(context, listen: false);
      controller.loadEvolutionChain(widget.pokemon.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 30, bottom: 14, left: 14, right: 14),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
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
                  AboutTab(pokemon: widget.pokemon),
                  BaseStatsTab(pokemon: widget.pokemon),
                  Consumer<PokemonController>(
                    builder: (context, controller, child) {
                      if (controller.evolutionChain == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return EvolutionTab(
                            evolutionChain: controller.evolutionChain!);
                      }
                    },
                  ),
                  MovesTab(pokemon: widget.pokemon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
