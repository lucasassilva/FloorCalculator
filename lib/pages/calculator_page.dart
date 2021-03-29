import 'package:flutter/material.dart';

import '../controllers/calculator_controller.dart';
import '../core/constants.dart';
import '../widgets/header_text.dart';
import '../widgets/number_input_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/result_dialog.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _buildForm()),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(kPadding),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderText(label: kRoomHeader),
            SizedBox(height: kSmallSpace),
            NumberInputField(
              label: '$kWidth ($kMeters)',
              onSaved: _controller.setRoomWidth,
            ),
            SizedBox(height: kSmallSpace),
            NumberInputField(
              label: '$kLength ($kMeters)',
              onSaved: _controller.setRoomLength,
            ),
            SizedBox(height: kSpace),
            HeaderText(label: kFloorHeader),
            SizedBox(height: kSmallSpace),
            NumberInputField(
              label: '$kWidth ($kMeters)',
              onSaved: _controller.setFloorWidth,
            ),
            SizedBox(height: kSmallSpace),
            NumberInputField(
              label: '$kLength ($kMeters)',
              onSaved: _controller.setFloorLength,
            ),
            SizedBox(height: kSmallSpace),
            NumberInputField(
              label: '$kPrice ($kCoin)',
              onSaved: _controller.setFloorPrice,
            ),
            SizedBox(height: kDoubleSpace),
            PrimaryButton(
              label: kCalculate,
              onPressed: _onCalculate,
            ),
            SizedBox(height: kSmallSpace),
            PrimaryButton(
              label: kClear,
              onPressed: _onClear,
            ),
          ],
        ),
      ),
    );
  }

  void _onCalculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final result = _controller.calculate();
      ResultDialog.show(context, result);
    }
  }

  void _onClear() {
    _formKey.currentState.reset();
  }
}
