import 'package:flutter/material.dart';
import 'package:rive_animation/model/filter_model.dart';
import 'package:rive_animation/model/loading_filter_model.dart';
import 'package:rive_animation/model/loading_model.dart';
import 'package:rive_animation/shared/pages/components/button_field.dart';
import 'package:rive_animation/shared/pages/components/date_time_field.dart';
import 'package:rive_animation/shared/pages/components/drop_down_field.dart';
import 'package:rive_animation/shared/pages/components/drop_down_list_item.dart';
import 'package:rive_animation/shared/pages/components/edit_text_field.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key, required this.item});
  final LoadingModel item;
  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  final descriptionTextController = TextEditingController();
  final noteTextController = TextEditingController();
  // final loadingDateController = TextEditingController();
  // final statusController = TextEditingController();
  final containerQuantityController = TextEditingController();
  final responsibleNameTextController = TextEditingController();
  final cbmLimitTextController = TextEditingController();
  final kgLimitTextController = TextEditingController();
  final createdDateTextController = TextEditingController();
  final createdUserTextController = TextEditingController();
  final updatedDateTextController = TextEditingController();
  final updatedUserTextController = TextEditingController();
  DropDownListItem? selectedConTypeValue;
  DropDownListItem? selectedStatusValue;
  @override
  void initState() {
    descriptionTextController.text = widget.item.description;
    noteTextController.text = widget.item.note;
    containerQuantityController.text = (widget.item.quantity).toString();
    responsibleNameTextController.text = widget.item.responsibleName;
    cbmLimitTextController.text = widget.item.cbmLimit.toString();
    kgLimitTextController.text = widget.item.kgLimit.toString();
    createdDateTextController.text = widget.item.createdDate.toString();
    createdUserTextController.text = widget.item.createdUserText;
    updatedDateTextController.text = widget.item.updatedDate.toString();
    updatedUserTextController.text = widget.item.updatedUserText;
    selectedConTypeValue = widget.item.quantity as DropDownListItem?;
    selectedStatusValue = widget.item.status as DropDownListItem?;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        children: [
                          EditTextField(
                            labelText: "Acıklama",
                            top: 5,
                            controller: descriptionTextController,
                          ),
                          EditTextField(
                            labelText: "Not",
                            controller: noteTextController,
                          ),
                          DropDownField(
                            hintText: "Konteyner Tipi",
                            valueText: selectedConTypeValue,
                            dropdownItems: [
                              DropDownListItem(text: '40 HC'),
                              DropDownListItem(text: '20 DC'),
                              DropDownListItem(text: 'PARSİYEL - DENİZ'),
                              DropDownListItem(text: 'ACIK GEMİ YÜKÜ'),
                              DropDownListItem(text: 'PARSİYEL - HAVA'),
                              DropDownListItem(text: 'PARSİYEL - KARA'),
                            ],
                          ),
                          const DateTimeField(
                            labelText: "Yükleme Tarihi",
                          ),
                          EditTextField(
                            labelText: "Konteyner Adedi",
                            controller: containerQuantityController,
                          ),
                          DropDownField(
                            hintText: "Durum",
                            valueText: selectedStatusValue,
                            dropdownItems: [
                              DropDownListItem(text: 'Planlandı'),
                              DropDownListItem(text: 'Yüklendi'),
                              DropDownListItem(text: 'Sevk edildi'),
                            ],
                          ),
                          EditTextField(
                            labelText: "Sorumlu",
                            controller: responsibleNameTextController,
                          ),
                          EditTextField(
                            labelText: "CBM Limit",
                            controller: cbmLimitTextController,
                          ),
                          EditTextField(
                            labelText: "KG Limit",
                            controller: kgLimitTextController,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: EditTextField(
                                  labelText: "Oluşturulma",
                                  right: 5,
                                  isReadOnly: true,
                                  controller: createdDateTextController,
                                ),
                              ),
                              Expanded(
                                child: EditTextField(
                                  labelText: "Oluşturan",
                                  left: 5,
                                  isReadOnly: true,
                                  controller: createdUserTextController,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: EditTextField(
                                  labelText: "Güncelleme",
                                  right: 5,
                                  isReadOnly: true,
                                  controller: updatedDateTextController,
                                ),
                              ),
                              Expanded(
                                child: EditTextField(
                                  labelText: "Güncelleyen",
                                  left: 5,
                                  isReadOnly: true,
                                  controller: updatedUserTextController,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
