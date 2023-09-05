import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:life_counter/shared/app_colors.dart';
import '../../../models/card_model.dart';
import '../../../widgets/rule_tile.dart';
import '../controller/gatherer_page_controller.dart';

class GathererPage extends StatefulWidget {
  const GathererPage({required this.card, Key? key}) : super(key: key);
  final CardModel card;

  @override
  State<GathererPage> createState() => _GathererPageState();
}

class _GathererPageState extends State<GathererPage> {
  GathererPageController gathererPageController = Modular.get<GathererPageController>();

  @override
  void initState() {
    gathererPageController.card = widget.card;
    gathererPageController.getRullings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage("images/greyBackground.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Observer(
        builder: (_) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: widget.card.imageUris?.small ??
                            'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Container(
                        decoration: const BoxDecoration(color: AppColors.black2),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 6, 6, 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  const TextSpan(text: 'Card Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: widget.card.name, style: const TextStyle(color: AppColors.grey))
                                ]),
                              ),
                              const SizedBox(height: 1.5),
                              RichText(
                                text: TextSpan(children: [
                                  const TextSpan(text: 'Mana Cost: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: widget.card.manaCost, style: const TextStyle(color: AppColors.grey))
                                ]),
                              ),
                              const SizedBox(height: 1.5),
                              RichText(
                                text: TextSpan(children: [
                                  const TextSpan(
                                      text: 'Converted Mana Cost: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: widget.card.cmc?.toStringAsFixed(0),
                                      style: const TextStyle(color: AppColors.grey))
                                ]),
                              ),
                              const SizedBox(height: 1.5),
                              RichText(
                                text: TextSpan(children: [
                                  const TextSpan(text: 'Types: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: widget.card.typeLine, style: const TextStyle(color: AppColors.grey))
                                ]),
                              ),
                              const SizedBox(height: 1.5),
                              RichText(
                                text: TextSpan(children: [
                                  const TextSpan(text: 'Card Text: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: widget.card.oracleText, style: const TextStyle(color: AppColors.grey))
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: AppColors.black2),
                    child: const Center(child: Text('Rulling', style: TextStyle(color: AppColors.grey)))),
              ),
              Visibility(
                  visible: gathererPageController.rullingList.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: gathererPageController.rullingList.length,
                      itemBuilder: (context, i) {
                        return RuleTile(
                            date: DateFormat('dd/MM/yyyy').format(gathererPageController.rullingList[i].publishedAt!),
                            rule: gathererPageController.rullingList[i].comment!,
                            index: i);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                            height: 0,
                            child: Divider(
                              color: Colors.black,
                            ));
                      },
                    ),
                  )),
              const SizedBox(height: 16),
              const Center(
                  child: Text(
                      '© 1995 - 2023 Wizards of the Coast LLC, a subsidiary of Hasbro, Inc. All Rights Reserved.',
                      style: TextStyle(color: AppColors.grey, fontSize: 10))),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    )));
  }
}
