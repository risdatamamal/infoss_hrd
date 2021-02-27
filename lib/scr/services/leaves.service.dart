import 'package:infoss_hrd/scr/models/leave_for_listing.dart';

class LeavesService {
  List<LeaveListing> getLeavesList() {
    return [
      new LeaveListing(
        dateLeave: DateTime.now(),
        reason: "Sakit",
        note: "Demam",
        status: "Setuju",
        createDateTime: DateTime.now(),
      ),
      new LeaveListing(
        dateLeave: DateTime.now(),
        reason: "Cuti",
        note: "Acara Keluarga",
        status: "Menunggu",
        createDateTime: DateTime.now(),
      ),
      new LeaveListing(
        dateLeave: DateTime.now(),
        reason: "Cuti",
        note: "Acara Festival",
        status: "Tidak Disetujui",
        createDateTime: DateTime.now(),
      ),
    ];
  }
}
