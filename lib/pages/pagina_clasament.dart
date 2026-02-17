import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/jucator.dart';
import '../widgets/player_tile.dart';

class PaginaClasament extends StatefulWidget {
  @override
  _PaginaClasamentState createState() => _PaginaClasamentState();
}

class _PaginaClasamentState extends State<PaginaClasament> {
  late Box box;
  List<Jucator> frati = [];

  @override
  void initState() {
    super.initState();
    box = Hive.box('fratiBox');
    _loadFrati();
  }

  void _loadFrati() {
    final stored = box.get('frati');
    if (stored != null && stored is List) {
      frati = stored.map((m) => Jucator.fromMap(Map<String, dynamic>.from(m))).toList();
    } else {
      frati = [
        Jucator(nume: 'Tom'),
        Jucator(nume: 'Teo'),
        Jucator(nume: 'Timmy'),
      ];
      _saveFrati();
    }
    setState(() {});
  }

  void _saveFrati() {
    box.put('frati', frati.map((j) => j.toMap()).toList());
  }

  void adaugaPuncte(int index, int cantitate) {
    setState(() {
      frati[index].puncte += cantitate;
      frati.sort((a, b) => b.puncte.compareTo(a.puncte));
      _saveFrati();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🏆 Clasament TTT')),
      body: ListView.builder(
        itemCount: frati.length,
        itemBuilder: (context, index) {
          final jucator = frati[index];
          return PlayerTile(
            jucator: jucator,
            position: index + 1,
            onChange: (delta) => adaugaPuncte(index, delta),
          );
        },
      ),
    );
  }
}
