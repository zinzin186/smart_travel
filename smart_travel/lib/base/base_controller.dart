

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utils/log.dart';
import '../utils/utils.dart';

abstract class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    Utils.updateNativeSwipeBackGesture();
    super.onInit();
  }

  @override
  void onClose() {
    Utils.updateNativeSwipeBackGesture();
    super.onClose();
  }

  void handleError(Object error) {
    logDebug("got error ${error.toString()}");
    isLoading.value = false;
    // var message = 'Có lỗi xảy ra, vui lòng thử lại!';
    // if (error is AppException) {
    //   message = error.toString();
    // }
    // Popup.instance.showSnackBar(message: message, type: SnackbarType.error);
  }

  void dismissKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  void closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) {
      Get.back();
    }
  }
}

abstract class BaseListController<T> extends BaseController {
  bool canLoadMore = true;
  String nextLink = "";
  RxBool showEmptyState = false.obs;
  RxList<T> listItem = RxList<T>();

  RxString errorStr = "".obs;

  bool get isSuccessState => listItem.isNotEmpty;

  bool get isLoadingState => isLoading.value && errorStr.isEmpty;

  bool get isErrorState => errorStr.isNotEmpty;

  Future getListItems() async {
    if (isLoading.value) return;
    isLoading.value = true;
    errorStr.value = "";
    // Call API here
  }

  Future loadMoreItems() async {
    if (!canLoadMore || isLoading.value) return;
    await getListItems();
  }

  Future reload() async {
    nextLink = "";
    await getListItems();
  }

  void handleResponse(List<T> items, String? nextLink) {
    isLoading.value = false;

    bool isReload = this.nextLink.isEmpty;
    canLoadMore = nextLink?.isEmpty == false && items.isNotEmpty;
    this.nextLink = nextLink ?? "";
    _checkEmptyState(items, isReload);
  }

  void buildListItem(List<T> items, bool isReload) {
    if (isReload) {
      listItem.value = items;
    } else {
      listItem.addAll(items);
    }
  }

  void _checkEmptyState(List<T> items, bool isReload) {
    if (isReload && items.isEmpty) {
      showEmptyState.value = true;
    } else {
      showEmptyState.value = false;
      buildListItem(items, isReload);
    }
  }
}