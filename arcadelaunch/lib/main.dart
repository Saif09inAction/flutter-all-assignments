import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const ArcadeApp());

const titles = ['NEON RACER', 'PIXEL QUEST', 'ORBIT ARENA'];
const tags = ['SPEED • 1987', '8-BIT RPG', 'VS ARENA'];
const hues = [Color(0xFF00F5FF), Color(0xFFFF2BD6), Color(0xFFFFD60A)];
String pic(int i, [int w = 400, int h = 720]) => 'https://picsum.photos/seed/neoncab$i/$w/$h';
BoxDecoration glow(Color c) => BoxDecoration(color: const Color(0xFF14081F), borderRadius: BorderRadius.circular(20),
    border: Border.all(color: c, width: 2), boxShadow: [BoxShadow(color: c.withValues(alpha: 0.55), blurRadius: 22)]);
Widget heroArt(int i) => Hero(tag: 'cab$i', child: CachedNetworkImage(
      imageUrl: pic(i), fit: BoxFit.cover, width: double.infinity, height: double.infinity,
      placeholder: (c, u) => const Center(child: CircularProgressIndicator()),
      errorWidget: (c, u, e) => const Icon(Icons.sports_esports, size: 48)));

class ArcadeApp extends StatelessWidget {
  const ArcadeApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, scaffoldBackgroundColor: const Color(0xFF07040F), colorSchemeSeed: const Color(0xFF00F5FF)),
        home: const Floor());
}

class Floor extends StatefulWidget {
  const Floor({super.key});
  @override
  State<Floor> createState() => _FloorState();
}

class _FloorState extends State<Floor> {
  int credits = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(children: [
          SafeArea(child: ListTile(
            leading: Image.asset('assets/arcade_badge.png', width: 42, height: 42),
            title: const Text('ARCADE LAUNCH', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2.2)),
            subtitle: Text('INSERT COIN  •  $credits CREDIT${credits == 1 ? "" : "S"}',
                style: const TextStyle(color: Colors.amberAccent, letterSpacing: 1.1)))),
          Image.network(pic(credits % 3, 900, 280), height: 108, width: double.infinity, fit: BoxFit.cover,
              loadingBuilder: (c, w, p) => p == null ? w : const LinearProgressIndicator()),
          Expanded(child: PageView.builder(
            controller: PageController(viewportFraction: 0.82), itemCount: 3,
            itemBuilder: (c, i) => GestureDetector(
              onTap: () async {
                final left = await Navigator.push<int>(c, MaterialPageRoute(builder: (_) => Booth(i: i, coins: credits)));
                if (left != null && mounted) setState(() => credits = left);
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(8, 18, 8, 28), decoration: glow(hues[i]), clipBehavior: Clip.antiAlias,
                child: Stack(fit: StackFit.expand, children: [
                  heroArt(i),
                  const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(
                      begin: Alignment.center, end: Alignment.bottomCenter, colors: [Colors.transparent, Color(0xF2000000)]))),
                  Padding(padding: const EdgeInsets.all(18), child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(titles[i], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 1.6)),
                    Text('▶  ${tags[i]}   PRESS TO BOOT', style: TextStyle(color: hues[i], fontWeight: FontWeight.w700))])),
                ]))))),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.amber, foregroundColor: Colors.black, onPressed: () => setState(() => credits++),
          icon: const Icon(Icons.monetization_on), label: const Text('INSERT COIN')),
      );
}

class Booth extends StatefulWidget {
  const Booth({super.key, required this.i, required this.coins});
  final int i, coins;
  @override
  State<Booth> createState() => _BoothState();
}

class _BoothState extends State<Booth> {
  late int coins = widget.coins;
  bool liked = false, playing = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, title: Text(titles[widget.i]),
            leading: BackButton(onPressed: () => Navigator.pop(context, coins)),
            actions: [IconButton(onPressed: () => setState(() => liked = !liked), icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: hues[widget.i]))]),
        body: Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 16), child: Column(children: [
          Expanded(child: Container(decoration: glow(hues[widget.i]), clipBehavior: Clip.antiAlias, child: heroArt(widget.i))),
          Lottie.asset('assets/insert_coin.json', height: 92, repeat: !playing),
          Image.network(pic(widget.i, 900, 280), height: 70, width: double.infinity, fit: BoxFit.cover,
              loadingBuilder: (c, w, p) => p == null ? w : const LinearProgressIndicator()),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Text(
              playing ? '▶  PLAYER 1  •  NOW PLAYING' : 'CREDITS $coins   ${liked ? "★ FAV" : "INSERT TO START"}',
              style: TextStyle(color: hues[widget.i], letterSpacing: 1.4, fontWeight: FontWeight.w800))),
          Row(children: [
            Expanded(child: FilledButton(onPressed: () => setState(() => coins++), child: const Text('INSERT'))),
            const SizedBox(width: 10),
            Expanded(child: FilledButton.tonal(
                onPressed: coins > 0 && !playing ? () => setState(() { coins--; playing = true; }) : null,
                child: const Text('START')))]),
        ])),
      );
}
