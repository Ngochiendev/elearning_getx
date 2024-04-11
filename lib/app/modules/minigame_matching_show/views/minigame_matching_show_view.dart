import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/excercise/minigame_background_image.dart';
import 'package:elearning/app/components/excercise/minigame_box_option.dart';
import 'package:elearning/app/components/excercise/minigame_menu_bar.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';

import '../controllers/minigame_matching_show_controller.dart';

class MinigameMatchingShowView extends GetView<MinigameMatchingShowController> {
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
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 16,
                    runSpacing: 16,
                    children: controller.list
                        .map(
                          (e) => MinigameBoxOption(
                            eventBus: controller.eventGame,
                            value: e,
                            // child: (e.content?.startsWith('http') ?? false)
                            //     ? Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: AppNetworkImage(source: e.content),
                            //       )
                            //     : Text(
                            //         e.content!,
                            //         style: GoogleFonts.baloo(color: Color(0xff96440c), fontSize: 18),
                            //       ),
                            child: Stack(
                              children: [
                                Html(data: e.content),
                                Positioned.fill(
                                  child: Container(
                                    color: colorWhite.withAlpha(10),
                                  ),
                                ),
                              ],
                            ),
                            onChoose: controller.chooseAnswer,
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
