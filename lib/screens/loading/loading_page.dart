import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/model/filter_model.dart';
import 'package:rive_animation/model/loading_filter_model.dart';
import 'package:rive_animation/model/menu.dart';
import 'package:rive_animation/model/pager_model.dart';
import 'package:rive_animation/model/query_info_model.dart';
import 'package:rive_animation/screens/entryPoint/components/btm_nav_item.dart';
import 'package:rive_animation/screens/entryPoint/components/menu_btn.dart';
import 'package:rive_animation/screens/loading/components/filter_bar.dart';
import 'package:rive_animation/screens/loading/components/loading_dialog.dart';
import 'package:rive_animation/service/loading_service.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({super.key}) {
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

  late FilterModel<LoadingFilterModel> filter;
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

  bool isFilterBarOpen = false;
  bool isIgnoring = false;
  late SMIBool isFilterBarOpenInput;

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }

  late AnimationController _animationController;
  late Animation<double> scalAnimation;
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
    scalAnimation = Tween<double>(begin: 1, end: 0.9).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleFilterBarMenu() {
    isFilterBarOpenInput.value = !isFilterBarOpenInput.value;
    if (_animationController.value == 0) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    setState(
      () {
        isFilterBarOpen = !isFilterBarOpen;
      },
    );
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
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            right: isFilterBarOpen ? 0 : -288,
            top: 0,
            child: FilterBar(
              dataItem: widget.filter,
              callback: (value) {
                setState(() {
                  widget.filter = value;
                  pagingController.refresh();
                });
              },
            ),
          ),
          IgnorePointer(
            ignoring: isIgnoring,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, -0.001)
                ..rotateY(
                    1 * animation.value - 30 * (animation.value) * pi / 180),
              child: Transform.translate(
                offset: Offset(-animation.value * 265, 0),
                child: Transform.scale(
                  scale: scalAnimation.value,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                    child: SafeArea(
                      bottom: false,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            child:  Text(
                              translate('LOADING.LOADINGS'),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Expanded(
                            child: PagedListView<int, dynamic>(
                              pagingController: pagingController,
                              builderDelegate:
                                  PagedChildBuilderDelegate<dynamic>(
                                itemBuilder: (context, item, index) =>
                                    Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text( "${translate('LOADING.LOADINGNO')}:${item.loadingId.toString()}"),
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
                                          "${translate('LOADING.DESCRIPTION')}: ${item.description}",
                                        ),
                                        Text(
                                          "${translate('LOADING.REPRESENTATIVENAME')}: ${item.representativeName}",
                                        ),
                                        Text(
                                          "${translate('LOADING.BEFORELOADING')}: ${item.beforeLoadingDocumentNo} ${item.beforeLoadingDescription}",
                                        ),
                                        Text(
                                          "${translate('LOADING.CUSTOMERNO')}: ${item.customerCode} ${item.customerName}",
                                        ),
                                        Text(
                                          "${translate('LOADING.CONTAINERTYPE')}: ${item.containerTypeText}",
                                        ),
                                        Text(
                                          "${translate('LOADING.CONTAINERQUANTITY')}: ${item.quantity}",
                                        ),
                                        Text(
                                          "${translate('LOADING.CBMLIMIT')}: ${item.cbmLimit}",
                                        ),
                                        Text(
                                          "${translate('LOADING.KGLIMIT')}: ${item.kgLimit}",
                                        ),
                                        Text(
                                          "${translate('LOADING.IMAGECOUNT')}: ${item.loadingImageCount}",
                                        ),
                                        Text(
                                          "${translate('LOADING.STATUS')}: ${item.status}",
                                        ),
                                        Text(
                                          "${translate('LOADING.RESPONSIBLENAME')}: ${item.responsibleName ?? ""}",
                                        ),
                                        Text(
                                          "${translate('LOADING.LOADINGDATE')}: ${item.loadingDate}",
                                        ),
                                        Text(
                                          "${translate('LOADING.UPDATEDDATE')}: ${item.updatedDate}",
                                        ),
                                        Text(
                                          "${translate('LOADING.UPDATEDUSERTEXT')}: ${item.updatedUserText}",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            top: 16,
            right: isFilterBarOpen ? 12 : 12,
            child: MenuBtn(
              press: () {
                toggleFilterBarMenu();
                isIgnoring = !isIgnoring;
              },
              riveOnInit: (artboard) {
                final controller = StateMachineController.fromArtboard(
                    artboard, "State Machine");

                artboard.addController(controller!);

                isFilterBarOpenInput =
                    controller.findInput<bool>("isOpen") as SMIBool;
                isFilterBarOpenInput.value = true;
              },
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
