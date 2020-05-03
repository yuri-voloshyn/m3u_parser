import 'package:test/test.dart';

import 'package:m3u_parser/src/text_utils.dart';

void main() {
  test('test1', () {
    final input =
        "name=\"Dave O'Connel\", \"e-mail\"=\"dave@mailinator.com\", epoch=1498158305, \"other value\"=\"some arbitrary\\\" text, with comma = and equals symbol\"";
    final keyValueList = getKeyValueList(input, [',']);

    expect(keyValueList.length, 4);
    expect(keyValueList['name'], "Dave O'Connel");
    expect(keyValueList['e-mail'], 'dave@mailinator.com');
    expect(keyValueList['epoch'], '1498158305');
    expect(keyValueList['other value'],
        'some arbitrary\" text, with comma = and equals symbol');
  });

  test('test2', () {
    final input =
        'url-tvg=\"http://server.name/jtv.zip\" cache=500 deinterlace=1 aspect-ratio=4:3 crop=700x550+10+10 tvg-shift=0';
    final keyValueList = getKeyValueList(input, [' ']);

    expect(keyValueList.length, 6);
    expect(keyValueList['url-tvg'], 'http://server.name/jtv.zip');
    expect(keyValueList['cache'], '500');
    expect(keyValueList['deinterlace'], '1');
    expect(keyValueList['aspect-ratio'], '4:3');
    expect(keyValueList['crop'], '700x550+10+10');
    expect(keyValueList['tvg-shift'], '0');
  });
}
