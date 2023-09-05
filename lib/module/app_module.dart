import 'package:flutter_modular/flutter_modular.dart';
import 'package:life_counter/funcionalities/card_search/view/card_search_page.dart';
import 'package:life_counter/funcionalities/color_picker/view/color_picker_page.dart';
import 'package:life_counter/funcionalities/player_profiles/view/player_profile_page.dart';
import 'package:life_counter/funcionalities/storm_counter/view/storm_counter_page.dart';
import '../funcionalities/about/view/about_page.dart';
import '../funcionalities/card_search/controller/card_page_controller.dart';
import '../funcionalities/color_picker/controller/color_picker_controller.dart';
import '../funcionalities/dice_roll/controller/dice_roll_controller.dart';
import '../funcionalities/dice_roll/view/dice_roll_page.dart';
import '../funcionalities/gatherer/controller/gatherer_page_controller.dart';
import '../funcionalities/gatherer/view/ghaterer_page.dart';
import '../funcionalities/home/controller/counter_layout_controller.dart';
import '../funcionalities/home/views/counter_layout.dart';
import '../funcionalities/life_counter/controller/life_counter_controller.dart';
import '../funcionalities/life_counter/views/life_counter_page.dart';
import '../funcionalities/player_edit/controller/player_edit_page_controller.dart';
import '../funcionalities/player_edit/view/player_edit_page.dart';
import '../funcionalities/player_profiles/controller/player_profile_controller.dart';
import '../funcionalities/storm_counter/controller/storm_counter_controller.dart';
import '../repositories/scryfall_repository.dart';
import '../repositories/storage_repository.dart';
import '../services/shared_preference_service.dart';
import '../services/dio_service.dart';
import '../shared/functions/get_player_index.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<LocalStorage>((i) => LocalStorage(storageService: SharedPreferenceService())),
        Bind.singleton<ScryFallRepository>((i) => ScryFallRepository(dio: DioService())),
        Bind.singleton((i) => CounterLayoutController()),
        Bind.singleton((i) => StormCounterController()),
        Bind.singleton((i) => DiceRollController()),
        Bind.singleton((i) => ColorPickerPageController()),
        Bind.singleton((i) => PlayerProfilePageController(localStorage: i.get())),
        Bind.singleton((i) => PlayerEditPageController(localStorage: i.get())),
        Bind.singleton((i) => CardPageController(scryFallRepository: i.get())),
        Bind.singleton((i) => GathererPageController(scryFallRepository: i.get())),
        Bind.factory<LifeCounterController>((i) => LifeCounterController(
            scryFallRepository: i.get(), refreshAll: CounterLayoutController().refreshAllPlayers)),
        Bind.factory<LifeCounterPage>((i) => LifeCounterPage(lifeCounterController: i.get(), id: getNextIndex())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (context, args) => const CounterLayout()),
        ChildRoute('/editPage', child: (context, args) => PlayerEditPage(player: args.data)),
        ChildRoute('/cardPage', child: (context, args) => CardPage(isGatherer: args.data)),
        ChildRoute('/gathererPage', child: (context, args) => GathererPage(card: args.data)),
        ChildRoute('/profilePage', child: (context, args) => const PlayerProfilePage()),
        ChildRoute('/colorPickerPage', child: (context, args) => const ColorPickerPage()),
        ChildRoute('/stormPage', child: (context, args) => const StormCounterPage()),
        ChildRoute('/dicePage', child: (context, args) => const DiceRollPage()),
        ChildRoute('/aboutPage', child: (context, args) => const AboutPage()),
      ];
}