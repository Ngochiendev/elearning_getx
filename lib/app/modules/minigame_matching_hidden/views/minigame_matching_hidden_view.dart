import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/excercise/minigame_background_image.dart';
import 'package:elearning/app/components/excercise/minigame_flip_card.dart';
import 'package:elearning/app/components/excercise/minigame_menu_bar.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/minigame_matching_hidden_controller.dart';

class MinigameMatchingHiddenView extends GetView<MinigameMatchingHiddenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MinigameBackgroundImage(
            image: R.ASSETS_MINIGAME_BG_CARD_PNG,
          ),
          Column(
            children: [
              MinigameMenuBar(
                reloadGame: controller.reloadGame,
                closeGame: controller.closeGame,
                confirmGame: controller.confirmGame,
                mute: controller.mute,
                titleImageAsset: R.ASSETS_MINIGAME_MATCHING_TITLE_PNG,
              ),
              Obx(
                () => Container(
                  height: MediaQuery.of(context).size.height - 100,
                  alignment: Alignment.center,
                  child: Wrap(
                    direction: Axis.vertical,
                    children: controller.list
                        .map(
                          (e) => MinigameFlipCard(
                            eventBus: controller.eventGame,
                            value: e,
                            child: html2Widget(e.content ?? ''),
                            onToggleCard: (bool isOpen) {
                              controller.onToggleCard(e, isOpen);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
