import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:life_counter/shared/app_colors.dart';
import 'package:life_counter/widgets/modal_screen.dart';
import '../../../models/card_model.dart';
import '../../../widgets/card_tile.dart';
import '../../../widgets/custom_buttom.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/widget_selector.dart';
import '../controller/card_page_controller.dart';

class CardPage extends StatefulWidget {
  const CardPage({this.cardSelected, this.isGatherer = false, Key? key}) : super(key: key);
  final CardModel? cardSelected;
  final bool isGatherer;

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final cardPageController = Modular.get<CardPageController>();

  @override
  void initState() {
    super.initState();
    cardPageController.initialState(widget.cardSelected);
  }

  @override
  Widget build(BuildContext context) {
    return ModalPage(
      child: Observer(
        builder: (_) => Container(
          constraints: const BoxConstraints(minHeight: 500, minWidth: double.infinity),
          child: Stack(children: [
            Stack(children: [
              SingleChildScrollView(
                controller: cardPageController.scrollController,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CTextFormField(
                          isEnabled: cardPageController.isSearch ,
                          name: 'Card',
                          controller: cardPageController.cardName,
                          onPressed: cardPageController.searchCards,
                          onEditingComplete: cardPageController.searchCards,
                          haveSuffixIcon: true),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        CustomButton(
                          text: cardPageController.isSearch ? 'Random Card': 'Cooldown ${cardPageController.timerCount}',
                          onPressed:cardPageController.isSearch ?  () {
                            cardPageController.getRandomCard();
                          } : null,
                          fontSize: 15,
                          backgroundColor: AppColors.grey,
                          textColor: Colors.black,
                        ),
                        const Spacer(),
                        CustomButton(
                          text: 'Clear',
                          onPressed: () {
                            cardPageController.clearList();
                          },
                          fontSize: 15,
                          backgroundColor: AppColors.grey,
                          textColor: Colors.black,
                        ),
                        const Spacer(),
                        CustomButton(
                          text: 'Back',
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          fontSize: 15,
                          backgroundColor: AppColors.grey,
                          textColor: Colors.black,
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Visibility(
                        visible: cardPageController.cardList.isEmpty && cardPageController.cardSelected == null,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.grey,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: AppColors.grey),
                                  'Search cards and ${widget.isGatherer ? 'ruling' : 'set as your backgourd'}\n Press outside the box or back button to leave.'),
                            ),
                          ),
                        )),
                    Visibility(
                        visible: cardPageController.cardSelected != null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: cardPageController.cardSelected != null
                              ? Column(
                                  children: [
                                    CardTile(card: cardPageController.cardSelected!, isSelected: true),
                                    const SizedBox(
                                        height: 8,
                                        child: Divider(
                                          color: AppColors.grey,
                                        ))
                                  ],
                                )
                              : const SizedBox(),
                        )),
                    WidgetSelector(
                        state: cardPageController.loadState,
                        widget: Visibility(
                          visible: cardPageController.cardList.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cardPageController.cardList.length,
                              itemBuilder: (context, i) {
                                return CardTile(card: cardPageController.cardList[i], isGatherer: widget.isGatherer);
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(
                                    height: 8,
                                    child: Divider(
                                      color: Colors.black,
                                    ));
                              },
                            ),
                          ),
                        ),
                        errorMessage: cardPageController.errorMsg),
                    const SizedBox(height: 16),
                    const Text('Card images and ruling by Scryfall API', style: TextStyle(color: AppColors.grey)),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              Visibility(
                visible: cardPageController.cardList.length > 4,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          cardPageController.backToTop();
                        },
                        icon: const Icon(Icons.arrow_upward, color: AppColors.grey))),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
