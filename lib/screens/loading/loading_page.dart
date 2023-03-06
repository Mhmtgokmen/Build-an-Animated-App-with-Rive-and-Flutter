import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/model/filter_model.dart';
import 'package:rive_animation/model/loading_filter_model.dart';
import 'package:rive_animation/model/menu.dart';
import 'package:rive_animation/model/pager_model.dart';
import 'package:rive_animation/model/query_info_model.dart';
import 'package:rive_animation/screens/entryPoint/components/btm_nav_item.dart';
import 'package:rive_animation/screens/loading/components/loading_dialog.dart';
import 'package:rive_animation/service/loading_service.dart';
import 'package:rive_animation/shared/return_info.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({super.key, required this.session}) {
    loadingService = LoadingService();
    filter = FilterModel(
      filter: LoadingFilterModel(),
      queryInfo: QueryInfoModel(
        orderby: "-LoadingId",
        pager: PagerModel(
          currentPage: currentPage,
          pageSize: pageSize,
          totalCount: 0,
        ),
      ),
      isExport: false,
      columnInfos: [],
    );
  }

  final String session;
  late FilterModel<LoadingFilterModel> filter;
  late ReturnInfo<dynamic> returnInfo;
  late LoadingService loadingService;
  final int pageSize = 20;
  final int currentPage = 0;
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  Menu selectedBottonNav = bottomNavItems.first;
  Menu selectedSideMenu = sidebarMenus.first;
  final PagingController<int, dynamic> pagingController =
      PagingController(firstPageKey: 0);

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }

  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> fetchPage(pageKey) async {
    try {
      widget.filter.queryInfo.pager.currentPage = pageKey;
      final newItems =
          await widget.loadingService.getLoadingList(widget.filter);
      widget.filter.queryInfo.pager.totalCount = newItems.totalCount;
      if (widget.filter.queryInfo.pager.isLastPage()) {
        pagingController.appendLastPage(newItems.data);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems.data, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const Text(
                    'Yüklemeler',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: PagedListView<int, dynamic>(
                    pagingController: pagingController,
                    builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        itemBuilder: (context, item, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(border: Border.all()),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "No: ${item.loadingId.toString()}"),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoadingDialog(
                                                  item: item,
                                                ),
                                                fullscreenDialog: true,
                                              ),
                                            );
                                          },
                                          icon: const Icon(Iconsax.edit),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Açıklama: ${item.description}",
                                    ),
                                    Text(
                                      "Müşteri Tem.: ${item.representativeName}",
                                    ),
                                    Text(
                                      "Yük. Ön. Proforma: ${item.beforeLoadingDocumentNo} ${item.beforeLoadingDescription}",
                                    ),
                                    Text(
                                      "Müşteri No: ${item.customerCode} ${item.customerName}",
                                    ),
                                    Text(
                                      "Konteyner T.: ${item.containerTypeText}",
                                    ),
                                    Text(
                                      "Konteyner Adet: ${item.quantity}",
                                    ),
                                    Text(
                                      "Cbm Limit: ${item.cbmLimit}",
                                    ),
                                    Text(
                                      "Kg Limit: ${item.kgLimit}",
                                    ),
                                    Text(
                                      "Resim Adet: ${item.loadingImageCount}",
                                    ),
                                    Text(
                                      "Durum: ${item.status}",
                                    ),
                                    Text(
                                      "Sorumlu: ${item.responsibleName ?? ""}",
                                    ),
                                    Text(
                                      "Yükleme Tarihi: ${item.loadingDate}",
                                    ),
                                    Text(
                                      "Güncelleme: ${item.updatedDate}",
                                    ),
                                    Text(
                                      "Güncelleyen: ${item.createdUserText}",
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: backgroundColor2.withOpacity(0.3),
                  offset: const Offset(0, 20),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavItems.length,
                  (index) {
                    Menu navBar = bottomNavItems[index];
                    return BtmNavItem(
                      navBar: navBar,
                      press: () {
                        RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                        updateSelectedBtmNav(navBar);
                      },
                      riveOnInit: (artboard) {
                        navBar.rive.status = RiveUtils.getRiveInput(artboard,
                            stateMachineName: navBar.rive.stateMachineName);
                      },
                      selectedNav: selectedBottonNav,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
