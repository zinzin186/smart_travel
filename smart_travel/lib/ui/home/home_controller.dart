
import 'package:get/get.dart';
import '../../api/home/home_service.dart';
import '../../base/base_controller.dart';
import '../../model/home_block.dart';
import '../../model/voucher.dart';

class MainHomeController extends BaseController {
  final HomeService _api = HomeService();
  var homeBlocks = <HomeBlockModel>[].obs;
  var adsList = <VoucherModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void _initData() async {
    final response = await _api.getHomeBlocks();
    homeBlocks.value = response.data;
  }

}