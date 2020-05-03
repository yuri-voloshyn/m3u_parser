import 'package:test/test.dart';

import 'package:m3u_parser/m3u_parser.dart';

void main() {
  test('file1.m3u', () async {
    final m3uList = await M3uList.loadFromFile('test_resources/test1.m3u');

    expect(m3uList.header.attributes.length, 6);
    expect(m3uList.items.length, 3);

    {
      final item = m3uList.items[0];

      expect(item.duration, 0);
      expect(item.title, 'BBC World');
      expect(item.attributes.length, 3);
      expect(item.groupTitle, null);
      expect(item.link, 'http://server.name/stream/to/video1');
    }

    {
      final item = m3uList.items[1];

      expect(item.duration, 0);
      expect(item.title, 'CNN International');
      expect(item.attributes.length, 3);
      expect(item.groupTitle, 'Fav');
      expect(item.link, 'http://server.name/stream/to/video2');
    }

    {
      final item = m3uList.items[2];

      expect(item.duration, 0);
      expect(item.title, 'Arirang');
      expect(item.attributes.length, 0);
      expect(item.groupTitle, 'Fav');
      expect(item.link, 'http://server.name/stream/to/video3');
    }
  });
}
