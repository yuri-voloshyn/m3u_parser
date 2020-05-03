import 'package:m3u_parser/m3u_parser.dart';

void main() async {
  final m3uList = await M3uList.loadFromFile('resources/example.m3u');
  for (var item in m3uList.items) {
    print('Title: ${item.title}');
  }
}
