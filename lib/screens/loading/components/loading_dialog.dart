import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rive_animation/model/loading_model.dart';
import 'package:rive_animation/service/loading_service.dart';
import 'package:rive_animation/shared/pages/components/button_field.dart';
import 'package:rive_animation/shared/pages/components/date_time_field.dart';
import 'package:rive_animation/shared/pages/components/drop_down_field.dart';
import 'package:rive_animation/shared/pages/components/drop_down_list_item.dart';
import 'package:rive_animation/shared/pages/components/edit_text_field.dart';
import 'package:rive_animation/shared/utilities.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key, required this.item});
  final LoadingModel item;
  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  LoadingService loadingService = LoadingService();
  final descriptionTextController = TextEditingController();
  final noteTextController = TextEditingController();
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
  DateTime? selectedDate;
  late List<DropDownListItem> containerTypeDropDownItems;
  late List<DropDownListItem> statusDropDownItems;
  @override
  void initState() {
    descriptionTextController.text = widget.item.description;
    noteTextController.text = widget.item.note;
    containerQuantityController.text = (widget.item.quantity).toString();
    responsibleNameTextController.text = widget.item.responsibleName;
    cbmLimitTextController.text = widget.item.cbmLimit.toString();
    kgLimitTextController.text = widget.item.kgLimit.toString();
    createdDateTextController.text =
        DateFormat('y/M/d - kk:mm').format(widget.item.createdDate);
    createdUserTextController.text = widget.item.createdUserText;
    updatedDateTextController.text =
        DateFormat('y/M/d - kk:mm').format(widget.item.updatedDate);
    updatedUserTextController.text = widget.item.updatedUserText;
    selectedDate = widget.item.loadingDate;
    containerTypeDropDownItems = [
      DropDownListItem(text: '40 HC', value: 124),
      DropDownListItem(text: '20 DC', value: 125),
      DropDownListItem(text: 'Parsiyel - Deniz', value: 129),
      DropDownListItem(text: 'Açık Gemi Yükü', value: 1155),
      DropDownListItem(text: 'Parsiyel - Hava', value: 2200),
      DropDownListItem(text: 'Parsiyel - Kara', value: 2201),
    ];
    selectedConTypeValue = containerTypeDropDownItems
        .where((element) => element.value == widget.item.containerType)
        .first;
    statusDropDownItems = [
      DropDownListItem(text: 'Planlandı', value: 1),
      DropDownListItem(text: 'Yüklendi', value: 2),
      DropDownListItem(text: 'Sevk edildi', value: 3),
    ];
    selectedStatusValue = statusDropDownItems
        .where((element) => element.value == widget.item.status)
        .first;

    super.initState();
  }

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
                  Text(
                    "Güncelleme - ${widget.item.loadingId}",
                    style: const TextStyle(
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
                        value: widget.item.description,
                        onChange: (event) {
                          widget.item.description = event;
                        },
                      ),
                      EditTextField(
                        labelText: "Not",
                        value: widget.item.note,
                        onChange: (event) {
                          widget.item.note = event;
                        },
                      ),
                      DropDownField(
                        hintText: "Konteyner Tipi",
                        value: selectedConTypeValue,
                        dropdownItems: containerTypeDropDownItems,
                        callback: (value) {
                          setState(() {
                            selectedConTypeValue = value;
                            widget.item.containerType =
                                selectedConTypeValue!.value;
                          });
                        },
                      ),
                      DateTimeField(
                        labelText: "Yükleme Tarihi",
                        selectedDate: selectedDate,
                        callback: (value) {
                          selectedDate = value;
                          widget.item.loadingDate = value;
                        },
                      ),
                      EditTextField(
                        labelText: "Konteyner Adedi",
                        value: widget.item.quantity.toString(),
                        onChange: (event) {
                          widget.item.quantity = event as int;
                        },
                      ),
                      DropDownField(
                        hintText: "Durum",
                        value: selectedStatusValue,
                        dropdownItems: statusDropDownItems,
                        callback: (value) {
                          setState(() {
                            selectedStatusValue = value;
                            widget.item.status = selectedStatusValue!.value;
                          });
                        },
                      ),
                      EditTextField(
                        labelText: "Sorumlu",
                        value: widget.item.responsibleName,
                        onChange: (event) {
                          widget.item.responsibleName = event;
                        },
                      ),
                      EditTextField(
                        labelText: "CBM Limit",
                        value: widget.item.cbmLimit.round().toString(),
                        onChange: (event) {
                          widget.item.cbmLimit = double.parse(event);
                        },
                      ),
                      EditTextField(
                        labelText: "KG Limit",
                        value: widget.item.kgLimit.round().toString(),
                        onChange: (event) {
                          widget.item.kgLimit = double.parse(event);
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: EditTextField(
                              labelText: "Oluşturulma",
                              right: 5,
                              isReadOnly: true,
                              value: DateFormat('y/M/d - kk:mm')
                                  .format(widget.item.createdDate),
                              onChange: (event) {
                                widget.item.createdDate = event as DateTime;
                              },
                            ),
                          ),
                          Expanded(
                            child: EditTextField(
                              labelText: "Oluşturan",
                              left: 5,
                              isReadOnly: true,
                              value: widget.item.createdUserText,
                              onChange: (event) {
                                widget.item.createdUserText = event;
                              },
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
                              value: DateFormat('y/M/d - kk:mm')
                                  .format(widget.item.updatedDate),
                              onChange: (event) {
                                widget.item.updatedDate = event as DateTime;
                              },
                            ),
                          ),
                          Expanded(
                            child: EditTextField(
                              labelText: "Güncelleyen",
                              left: 5,
                              isReadOnly: true,
                              value: widget.item.updatedUserText,
                              onChange: (event) {
                                widget.item.updatedUserText = event;
                              },
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            ButtonField(
              text: "Sil",
              color: const Color(0xFFff3d57),
              onPressed: () async {
                var result = await loadingService.deleteLoading(widget.item);
                result.isSuccess
                    // ignore: use_build_context_synchronously
                    ? Utilities.showMessage(context: context, message: "Deleted")
                    // ignore: use_build_context_synchronously
                    : Utilities.showMessage(
                        context: context,
                        message: result.errorMessage!,
                      );
              },
            ),
            const Spacer(),
            ButtonField(
              text: "Güncelle",
              color: const Color(0xFF5052A2),
              onPressed: () async {
                var result = await loadingService.saveLoading(widget.item);
                result.isSuccess
                    // ignore: use_build_context_synchronously
                    ? Utilities.showMessage(context: context, message: "Saved")
                    // ignore: use_build_context_synchronously
                    : Utilities.showMessage(
                        context: context,
                        message: result.errorMessage!,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
