import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/views/pokemon_detail_landscape.dart';
import 'widgets/pokemon_detail_top.dart';
import 'widgets/pokemon_detail_bottom.dart';
import 'widgets/pokemon_detail_image_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonDetailView extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailView({required this.pokemon});

  @override
  _PokemonDetailViewState createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> {
  late bool isLiked;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    isLiked = false;
    _loadLikeStatus();
  }

  Future<void> _loadLikeStatus() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? likedPokemonIds = prefs.getStringList('likedPokemonIds');
    if (likedPokemonIds != null) {
      setState(() {
        isLiked = likedPokemonIds.contains(widget.pokemon.id.toString());
      });
    }
  }

  Future<void> _toggleLike() async {
    List<String>? likedPokemonIds =
        prefs.getStringList('likedPokemonIds') ?? [];
    if (isLiked) {
      likedPokemonIds.remove(widget.pokemon.id.toString());
    } else {
      likedPokemonIds.add(widget.pokemon.id.toString());
    }
    await prefs.setStringList('likedPokemonIds', likedPokemonIds);
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: isLandscape
          ? PokemonDetailLandscape(
              pokemon: widget.pokemon,
              isLiked: isLiked,
              onToggleLike: _toggleLike)
          : _buildPortraitLayout(),
    );
  }

  Widget _buildPortraitLayout() {
    return Stack(
      children: [
        PokemonDetailTop(pokemon: widget.pokemon),
        Align(
          alignment: Alignment.bottomCenter,
          child: PokemonDetailBottom(pokemon: widget.pokemon),
        ),
        PokemonDetailImageText(pokemon: widget.pokemon),
        Positioned(
          top: 40,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 40,
          right: 6,
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              color: isLiked ? Colors.pink : Colors.white,
              size: 26.0,
            ),
            onPressed: _toggleLike,
          ),
        ),
      ],
    );
  }
}
