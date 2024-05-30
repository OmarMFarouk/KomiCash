import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/leads_model.dart';
import '../../models/networks_model.dart';
import '../../models/youmi_model.dart';
import '../../services/earn_api/leads_api.dart';
import '../../services/earn_api/networks_api.dart';
import '../../services/earn_api/offers_api.dart';
import 'earn_states.dart';

class EarnCubit extends Cubit<EarnStates> {
  EarnCubit() : super(EarnInitial());
  static EarnCubit get(context) => BlocProvider.of(context);
  LeadsModel? leadsModel;
  YoumiModel? youmiModel;
  // OgadsModel? ogadsModel;
  NetworksModel? networksModel;

  fetchLeads() async {
    leadsModel = await LeadsApi()
        .fetchLeads()
        .then((value) => LeadsModel?.fromJson(value))
        .whenComplete(() => emit(LeadsFetched('Success')));
  }

  fetchNetworks() async {
    networksModel = await NetworksApi()
        .fetchNetworks()
        .then((value) => NetworksModel?.fromJson(value))
        .whenComplete(() => emit(NetworksFetched('Success')));
  }

  fetchOffers() async {
    youmiModel = await OfferApi()
        .fetchYoumi()
        .then((value) => YoumiModel.fromJson(value));

    emit(OffersFetched('Success'));
  }
}
