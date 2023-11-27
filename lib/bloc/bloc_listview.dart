import 'package:flutter_bloc/flutter_bloc.dart';

class myData {
  final String nhiemvu;
  final int diemso;

  myData({required this.nhiemvu, required this.diemso});
}

class MyListBloc extends Cubit<List<myData>> {
  MyListBloc() : super([]);

  void loadData() {
    // Thực hiện lấy dữ liệu (api, fix cứng)
    List<myData> data = [
      myData(nhiemvu: 'Định danh tài khoản', diemso: 200),
      myData(nhiemvu: 'Liên kết ngân hàng', diemso: 200),
      myData(nhiemvu: 'Đăng ký ngân hàng', diemso: 200),
    ];
    emit(data);
  }

  void addData(myData newData) {
    List<myData> currentData = List.from(state);
    currentData.add(newData);
    emit(currentData);
  }
}
