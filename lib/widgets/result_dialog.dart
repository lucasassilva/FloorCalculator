import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../models/result_model.dart';

class ResultDialog extends StatelessWidget {
  final ResultModel result;

  const ResultDialog({
    Key key,
    this.result,
  }) : super(key: key);

  static void show(BuildContext context, ResultModel result) {
    showDialog(
      context: context,
      builder: (context) => ResultDialog(result: result),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(kResult),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('${result.amountPieces} $kFloor'),
            subtitle: Text(kAmountFloors),
          ),
          ListTile(
            title: Text('${result.amountFooter} $kFloor'),
            subtitle: Text(kAmountFloorsToFooter),
          ),
          ListTile(
            title: Text('${result.amountPiecesAndFooter} $kFloor'),
            subtitle: Text(kTotalFloor),
          ),
          Divider(),
          ListTile(
            title: Text('${result.areaWithoutFooter} $kSqrMeters'),
            subtitle: Text(kAreaWithoutFooter),
          ),
          ListTile(
            title: Text('${result.areaWithFooter} $kSqrMeters'),
            subtitle: Text(kAreaWithFooter),
          ),
          Divider(),
          ListTile(
            title: Text('$kPrice ${result.priceResult}'),
            subtitle: Text('$kTotPrice'),
          ),
        ],
      ),
    );
  }
}
