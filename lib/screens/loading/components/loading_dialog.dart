import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:rive_animation/model/item_for_combo_model.dart';
import 'package:rive_animation/model/list_for_combo_filter_model.dart';
import 'package:rive_animation/model/loading_model.dart';
import 'package:rive_animation/service/employee_service.dart';
import 'package:rive_animation/service/loading_service.dart';
import 'package:rive_animation/shared/pages/components/autocomplete_text_field.dart';
import 'package:rive_animation/shared/pages/components/button_field.dart';
import 'package:rive_animation/shared/pages/components/date_time_field.dart';
import 'package:rive_animation/shared/pages/components/drop_down_field.dart';
import 'package:rive_animation/shared/pages/components/drop_down_list_item.dart';
import 'package:rive_animation/shared/pages/components/edit_text_field.dart';
import 'package:rive_animation/shared/utilities.dart';

class LoadingDialog extends StatefulWidget {
  LoadingDialog({super.key, required this.item}) {
    employeeService = EmployeeService();
    listComboFilter = ListForComboFilterModel(search: "", id: 0);
    itemForComboModel = [];
  }
  final LoadingModel item;
  late ListForComboFilterModel listComboFilter;
  late List<ItemForComboModel> itemForComboModel;
  late EmployeeService employeeService;
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
      DropDownListItem(text: translate('PARAMETER.LOADINGPARAM1'), value: 124),
      DropDownListItem(text: translate('PARAMETER.LOADINGPARAM2'), value: 125),
      DropDownListItem(text: translate('PARAMETER.LOADINGPARAM3'), value: 129),
      DropDownListItem(text: translate('PARAMETER.LOADINGPARAM4'), value: 1155),
      DropDownListItem(text: translate('PARAMETER.LOADINGPARAM5'), value: 2200),
      DropDownListItem(text: translate('PARAMETER.LOADINGPARAM6'), value: 2201),
      DropDownListItem(text: translate('PARAMETER.LOADINGPARAM7'), value: 2227),
    ];
    selectedConTypeValue = containerTypeDropDownItems
        .where((element) => element.value == widget.item.containerType)
        .first;
    statusDropDownItems = [
      DropDownListItem(text: translate('PARAMETER.STATUSPARAM1'), value: 1),
      DropDownListItem(text: translate('PARAMETER.STATUSPARAM2'), value: 2),
      DropDownListItem(text: translate('PARAMETER.STATUSPARAM3'), value: 3),
    ];
    selectedStatusValue = statusDropDownItems
        .where((element) => element.value == widget.item.status)
        .first;
    super.initState();
    getData();
  }

  Future<void> getData() async {
    widget.itemForComboModel =
        (await widget.employeeService.getListForCombo(widget.listComboFilter))
            .data;
    setState(() {});
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF000000),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  // const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      "${translate('LOADING.UPDATELOADING')} - ${widget.item.loadingId}",
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF000000),
                      ),
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
                        labelText: translate('LOADING.DESCRIPTION'),
                        top: 5,
                        value: widget.item.description,
                        onChange: (event) {
                          widget.item.description = event;
                        },
                      ),
                      EditTextField(
                        labelText: translate('LOADING.NOTE'),
                        value: widget.item.note,
                        onChange: (event) {
                          widget.item.note = event;
                        },
                      ),
                      DropDownField(
                        hintText: translate('LOADING.CONTAINERTYPE'),
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
                        labelText: translate('LOADING.LOADINGDATE'),
                        selectedDate: selectedDate,
                        callback: (value) {
                          selectedDate = value;
                          widget.item.loadingDate = value;
                        },
                      ),
                      EditTextField(
                        labelText: translate('LOADING.CONTAINERQUANTITY'),
                        value: widget.item.quantity.toString(),
                        onChange: (event) {
                          widget.item.quantity = event as int;
                        },
                      ),
                      DropDownField(
                        hintText: translate('LOADING.STATUS'),
                        value: selectedStatusValue,
                        dropdownItems: statusDropDownItems,
                        callback: (value) {
                          setState(() {
                            selectedStatusValue = value;
                            widget.item.status = selectedStatusValue!.value;
                          });
                        },
                      ),
                      AutocompleteTextField(
                        labelText: translate('LOADING.RESPONSIBLENAME'),
                        dataList: widget.itemForComboModel,
                        value: widget.item.responsibleName,
                        onSelected: (option) {
                          widget.item.responsible = option.value;
                        },
                      ),
                      // EditTextField(
                      //   labelText: "Sorumlu",
                      //   value: widget.item.responsibleName,
                      //   onChange: (event) {
                      //     widget.item.responsibleName = event;
                      //   },
                      // ),
                      EditTextField(
                        labelText: translate('LOADING.CBMLIMIT'),
                        value: widget.item.cbmLimit.round().toString(),
                        onChange: (event) {
                          widget.item.cbmLimit = double.parse(event);
                        },
                      ),
                      EditTextField(
                        labelText: translate('LOADING.KGLIMIT'),
                        value: widget.item.kgLimit.round().toString(),
                        onChange: (event) {
                          widget.item.kgLimit = double.parse(event);
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: EditTextField(
                              labelText: translate('LOADING.CREATEDDATE'),
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
                              labelText: translate('LOADING.CREATEDUSERTEXT'),
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
                              labelText: translate('LOADING.UPDATEDDATE'),
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
                              labelText: translate('LOADING.UPDATEDUSERTEXT'),
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
              text: translate('GENERAL.DELETED'),
              color: const Color(0xFFff3d57),
              onPressed: () async {
                var result = await loadingService.deleteLoading(widget.item);
                result.isSuccess
                    // ignore: use_build_context_synchronously
                    ? Utilities.showMessage(
                        context: context, message: "Deleted")
                    // ignore: use_build_context_synchronously
                    : Utilities.showMessage(
                        context: context,
                        message: result.errorMessage!,
                      );
              },
            ),
            const Spacer(),
            ButtonField(
              text: translate('GENERAL.UPDATE'),
              color: const Color(0xFF5052A2),
              onPressed: () async {
                var result = await loadingService.saveLoading(widget.item);
                result.isSuccess
                    // ignore: use_build_context_synchronously
                    ? Utilities.showMessage(context: context, message: translate('GENERAL.SAVED'))
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
