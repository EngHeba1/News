import 'package:flutter/material.dart';

import '../../models/sourcesResponce.dart';
import '../../styles/app_colors.dart';

class SourceItem extends StatelessWidget {
  //const SourceItem({super.key});
  Sources sourse;
  bool isSellected;

  SourceItem(this.sourse, this.isSellected);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSellected ? AppCloros.greenColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppCloros.greenColor,width: 2)),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      margin: EdgeInsets.only(top: 6,bottom: 4),
      child: Text(sourse.name ?? "",style: TextStyle(color:isSellected?Colors.white : AppCloros.greenColor),),
    );
  }
}
