import 'package:flutter/material.dart';
import 'package:trading/features/copier/presentation/widgets/radio_tile_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';



class MapSymbolSheetWidget extends StatelessWidget {
  const MapSymbolSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.screenHeight * 0.9,
      padding: EdgeInsets.all(ResponsiveHelper.padding(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ResponsiveHelper.borderRadius(20)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              AppText.mapToSymbol,
              style: context.bodyLarge.copyWith(
                fontSize: ResponsiveHelper.fontSize(18),
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(4)),

            // Subtitle
            Text(
              AppText.showingListOfAllAccounts,
              style: context.bodySmall.copyWith(
                fontSize: ResponsiveHelper.fontSize(14),
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(12)),

            Column(

                children: List.generate(5,
                        (index){

                      return  Padding(
                        padding:  EdgeInsets.only(bottom:ResponsiveHelper.height(12)),
                        child:   RadioTileWidget(
                          horizontal: 12,
                          vertical: 12,
                          isSelected: true,
                        title: "ADAUSD",
                        ),
                      );

                    }
                )
            ),

            SizedBox(height: ResponsiveHelper.height(12)),
            
            ElevatedButton(onPressed: (){
              
            },
                child: Text(AppText.addMapSymbol)
            ),
            
            
            
          ],
        ),
      ),
    );
  }
}