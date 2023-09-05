import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/app_colors.dart';
import '../../../widgets/custom_buttom.dart';
import '../../../widgets/modal_screen.dart';
import '../controller/color_picker_controller.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({this.colorPicked = Colors.grey, super.key});

  final Color? colorPicked;

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  final patientPopupController = Modular.get<ColorPickerPageController>();

  @override
  void initState() {
    patientPopupController.initialState(widget.colorPicked ?? Colors.grey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPage(
      child: Observer(
        builder: (_) => SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'CHOOSE A COLOR',
                style: TextStyle(color: AppColors.grey),
              ),
              const SizedBox(height: 30),
              ColorPicker(
                labelTypes: const [],
                pickerColor: patientPopupController.pickedColor,
                onColorChanged: patientPopupController.changeColor,
              ),
              const SizedBox(height: 30),
              Wrap(
                children: [
                  CustomButton(
                      fontSize: 15,
                      backgroundColor: AppColors.grey,
                      textColor: Colors.black,
                      onPressed: () {
                        patientPopupController.getRandomColor();
                      },
                      text: 'Random Color'),
                  const SizedBox(width: 18),
                  CustomButton(
                      fontSize: 15,
                      backgroundColor: AppColors.grey,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.pop(context, patientPopupController.pickedColor);
                      },
                      text: 'Confirm'),
                  const SizedBox(width: 18),
                  CustomButton(
                      fontSize: 15,
                      backgroundColor: AppColors.grey,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Back'),
                ],
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
