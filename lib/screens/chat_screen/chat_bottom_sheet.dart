import 'package:Pax/components/chat/chat_bottom_sheet_button.dart';
import 'package:Pax/components/chat/send_pax_button.dart';
import 'package:Pax/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatBottomSheet extends StatelessWidget {
  final Function cameraHandler;
  final Function galleryHandler;
  final Function addressHandler;
  final Function paxHandler;
  final bool isProvider;

  const ChatBottomSheet({
    this.cameraHandler,
    this.galleryHandler,
    this.addressHandler,
    this.paxHandler,
    this.isProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .12,
        left: 15,
        right: 15,
      ),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          isProvider == true
              ? SendPaxButton(onPressHandler: paxHandler)
              : ChatBottomSheetButton(
                  text: 'Endereço',
                  icon: Icons.location_on,
                  onPressedHandler: addressHandler,
                ),
          ChatBottomSheetButton(
            text: 'Câmera',
            icon: Icons.camera,
            onPressedHandler: cameraHandler,
          ),
          ChatBottomSheetButton(
            text: 'Galeria',
            icon: Icons.photo_library,
            onPressedHandler: galleryHandler,
          ),
        ],
      ),
    );
  }
}
