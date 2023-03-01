import 'package:flutter/material.dart';
import 'package:rive_animation/shared/pages/components/button_field.dart';
import 'package:rive_animation/shared/pages/components/drop_down_field.dart';
import 'package:rive_animation/shared/pages/components/edit_text_field.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF000000),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 90),
                  const Text(
                    "Güncelleme",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    const EditTextField(
                      labelText: "Acıklama",
                    ),
                    const EditTextField(
                      labelText: "Not",
                    ),
                    const DropDownField(
                      hintText: "Durum",
                    ),
                    const EditTextField(
                      labelText: "Konteyner Adedi",
                    ),
                    const EditTextField(
                      labelText: "Sorumlu",
                    ),
                    const EditTextField(
                      labelText: "CBM Limit",
                    ),
                    const EditTextField(
                      labelText: "KG Limit",
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: EditTextField(
                            labelText: "Oluşturulma",
                            right: 5,
                          ),
                        ),
                        Expanded(
                          child: EditTextField(
                            labelText: "Oluşturan",
                            left: 5,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: EditTextField(
                            labelText: "Güncelleme",
                            right: 5,
                          ),
                        ),
                        Expanded(
                          child: EditTextField(
                            labelText: "Güncelleyen",
                            left: 5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            ButtonField(
              text: "Sil",
              onPressed: () {},
            ),
            const Spacer(),
            ButtonField(
              text: "Güncelle",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
