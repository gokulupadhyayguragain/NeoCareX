import 'package:bloc/bloc.dart';
import 'package:fhir/r4.dart';
import 'package:openEMR/openEMR.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'open_emr_event.dart';
import 'open_emr_state.dart';

class OpenemrEhrLaunchBloc
    extends Bloc<OpenemrEhrLaunchEvent, OpenemrEhrLaunchState> {
  OpenemrEhrLaunchBloc(this._repository) : super(OpenemrEhrInitial()) {
    on<LaunchAndHandle>(_launchAndHandle);
  }
  final OpenEMRRepository _repository;
  Future<void> _launchAndHandle(
    LaunchAndHandle event,
    Emitter<OpenemrEhrLaunchState> emit,
  ) async {
    // if (event.launch == null) {
    //   emit(OpenemrEhrFailure(message: 'Launch Token is required'));
    //   return;
    // }

    emit(OpenemrEhrLoading());
    print("Get Authorization Url");
    final failureOrUrl = await _repository.getAuthorizationUrlWithLaunchCode(
      event.launch!,
      '',
    );

    Uri? uri;

    failureOrUrl.fold(
      (l) => emit(
        OpenemrEhrFailure(message: 'Unable to get the authorization url'),
      ),
      (r) => uri = r,
    );

    if (uri == null) return;

    print("The response url is " + uri.toString());

    final responseUrl = await event.callBack(uri!);

    final failureOrTokenSuccess = await _repository.handleAuthorizationCode(
      responseUrl.queryParameters['code'] ?? '',
      '',
    );

    bool failed = true;
    String patientId = '';
    failureOrTokenSuccess.fold(
      (l) => emit(
        OpenemrEhrFailure(
          message: l.message ?? 'Unable to get the access token',
        ),
      ),
      (r) {
        failed = false;
        patientId = r.patient ?? '';
      },
    );
    final storage = SecureStorageService();
    await storage.saveString("patientId", patientId.toString());
    print("The patient id saved is" + patientId.toString());
    emit(OpenemrEhrLoaded(bundle: Bundle(), observationsList: []));
    // if (failed) return;

    // final failureOrBundle = await _repository.getUserInformationBundle();

    // List observations = [];
    // Bundle? bundle;

    // failureOrBundle.fold(
    //   (l) => emit(
    //     OpenemrEhrFailure(
    //       message: l.message ?? 'Unable to read the patient information',
    //     ),
    //   ),
    //   (r) {
    //     for (int k = 0; k < r.$2.length; k++) {
    //       Observation observation = Observation.fromJson(r.$2[k].toJson());
    //       observations.add(observation);
    //     }
    //     bundle = r.$1;
    //   },
    // );

    // final patientResource = bundle?.entry?.first.resource;
    // String patientId = "";
    // if (patientResource is Patient) {
    //   patientId = patientResource.fhirId.toString();
    // }
    // final storage = SecureStorageService();
    // await storage.saveString("patientId", patientId.toString());
  }
}
