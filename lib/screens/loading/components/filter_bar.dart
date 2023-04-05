import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/model/filter_model.dart';
import 'package:rive_animation/model/loading_filter_model.dart';
import 'package:rive_animation/model/loading_model.dart';
import 'package:rive_animation/model/query_info_model.dart';
import 'package:rive_animation/shared/pages/components/button_field.dart';
import 'package:rive_animation/shared/pages/components/date_time_field.dart';
import 'package:rive_animation/shared/pages/components/drop_down_field.dart';
import 'package:rive_animation/shared/pages/components/drop_down_list_item.dart';
import 'package:rive_animation/shared/pages/components/edit_text_field.dart';

import '../../../model/pager_model.dart';

class FilterBar extends StatefulWidget {
  FilterBar({
    super.key,
    required this.dataItem,
    required this.callback,
  });

  final FilterModel<LoadingFilterModel> dataItem;
  final int pageSize = 20;
  final int currentPage = 0;
  late Function callback;

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  final loadingIdTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  DropDownListItem? selectedStatusValue;
  DateTime? selectedDate;
  late List<DropDownListItem> statusDropDownItems;

  @override
  void initState() {
    loadingIdTextController.text =
        widget.dataItem.filter!.customerId.toString();
    descriptionTextController.text = widget.dataItem.filter!.description ?? "";

    statusDropDownItems = [
      DropDownListItem(text: 'Planlandı', value: 1),
      DropDownListItem(text: 'Yüklendi', value: 2),
      DropDownListItem(text: 'Sevk edildi', value: 3),
    ];
    // selectedStatusValue = statusDropDownItems
    //     .where((element) => element.value == widget.dataItem.filter!.status)
    //     .first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorLight,
      body: SafeArea(
        child: Container(
          width: 288,
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  "Filtreleme",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              EditTextField(
                labelText: translate('LOADING.LOADINGNO'),
                value: (widget.dataItem.filter!.loadingId ?? "").toString(),
                onChange: (event) {
                  widget.dataItem.filter!.loadingId = int.parse(event);
                },
              ),
              EditTextField(
                labelText: translate('LOADING.DESCRIPTION'),
                value: widget.dataItem.filter!.description ?? "",
                onChange: (event) {
                  widget.dataItem.filter!.description = event;
                },
              ),
              DropDownField(
                hintText: translate('LOADING.STATUS'),
                callback: (value) {
                  setState(() {
                    selectedStatusValue = value;
                    widget.dataItem.filter!.status = selectedStatusValue!.value;
                  });
                },
                dropdownItems: statusDropDownItems,
                value: selectedStatusValue,
              ),
              DateTimeField(
                labelText: translate('LOADING.LOADINGDATE'),
                selectedDate: selectedDate,
                callback: (value) {
                  selectedDate = value;
                  widget.dataItem.filter!.loadingDate1 = value;
                  print(value.toString());
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          children: [
            ButtonField(
              text: translate('GENERAL.CLEAR'),
              color: const Color(0xFFff3d57),
              onPressed: () async {
                widget.dataItem.filter!.loadingId.toString() == "";
                widget.dataItem.filter!.description == "";
                selectedStatusValue ?? selectedStatusValue!.text == "";
                // widget.dataItem.filter!.loadingDate1 ??
                //     "${selectedDate.toLocal()}".split('')[0].toString();
                setState(() {});
                var result = FilterModel(
                  filter: LoadingFilterModel(),
                  queryInfo: QueryInfoModel(
                    orderby: "-LoadingId",
                    pager: PagerModel(
                      currentPage: widget.currentPage,
                      pageSize: widget.pageSize,
                      totalCount: 0,
                    ),
                  ),
                  isExport: false,
                  columnInfos: [],
                );
                widget.callback(result);
              },
            ),
            const Spacer(),
            ButtonField(
              text: translate('GENERAL.FILTER'),
              color: const Color(0xFF5052A2),
              onPressed: () async {
                var result = FilterModel(
                  filter: LoadingFilterModel(
                    loadingId: widget.dataItem.filter!.loadingId,
                    description: widget.dataItem.filter!.description,
                    status: widget.dataItem.filter!.status,
                    loadingDate1: widget.dataItem.filter!.loadingDate1,
                  ),
                  queryInfo: QueryInfoModel(
                    orderby: "-LoadingId",
                    pager: PagerModel(
                      currentPage: widget.currentPage,
                      pageSize: widget.pageSize,
                      totalCount: 0,
                    ),
                  ),
                  isExport: false,
                  columnInfos: [],
                );
                widget.callback(result);
              },
            ),
          ],
        ),
      ),
    );
  }
}
