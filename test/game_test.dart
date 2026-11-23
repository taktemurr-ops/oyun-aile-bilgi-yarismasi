import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_aile_bilgi_yarismasi/oyun_aile_bilgi_yarismasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(aileBilgiConfig.title.length, 33);
    expect(aileBilgiConfig.tagline.length, 33);
    for (final s in aileBilgiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(aileBilgiConfig.gameId, aileBilgiId);
    expect(aileBilgiRules.gameId, aileBilgiId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(aileBilgiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: aileBilgiId, optionalMechanics: aileBilgiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(aileBilgiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
