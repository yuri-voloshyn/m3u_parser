import 'package:m3u_parser/src/m3u_load_options.dart';
import 'package:test/test.dart';

import 'package:m3u_parser/m3u_parser.dart';

void main() {
  test('file1.m3u', () async {
    final wrongItemTitle = 'Empty';

    final m3uList = await M3uList.loadFromFile('test_resources/test1.m3u',
        options: M3uLoadOptions(wrongItemTitle: wrongItemTitle));

    expect(m3uList.header.attributes.length, 6);
    expect(m3uList.items.length, 9);

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

    {
      final item = m3uList.items[3];

      expect(item.groupTitle, '');
    }

    {
      final item = m3uList.items[4];

      expect(item.groupTitle, 'Video');
    }

    {
      final item = m3uList.items[5];

      expect(item.groupTitle, '');
    }

    {
      final item = m3uList.items[6];

      expect(item.groupTitle, '');
    }

    {
      final item = m3uList.items[7];

      expect(item.groupTitle, 'Video');
    }

    {
      final item = m3uList.items[8];

      expect(item.title, wrongItemTitle);
      expect(item.groupTitle, 'Video');
    }

    {
      final groupTitles = m3uList.groupTitles;

      expect(groupTitles.length, 3);
      expect(groupTitles[0], 'Fav');
      expect(groupTitles[1], '');
      expect(groupTitles[2], 'Video');
    }
  });
}
