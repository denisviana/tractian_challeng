import 'package:get/get.dart';
import '../../../core/domain/entity/company_entity.dart';
import '../../../core/domain/use_case/get_companies_use_case.dart';

class HomeController extends GetxController {
  final GetCompaniesUseCase _getCompaniesUseCase;

  HomeController(this._getCompaniesUseCase);

  final companies = <CompanyEntity>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    isLoading(true);
    errorMessage('');
    final result = await _getCompaniesUseCase();
    companies.value = result.data ?? [];
    isLoading(false);
  }
}
