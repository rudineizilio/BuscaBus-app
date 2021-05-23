import 'package:mobx/mobx.dart';

part 'driver_controller.g.dart';

class DriverController = _DriverController with _$DriverController;

abstract class _DriverController with Store {
  @observable
  String busSelected;

  @observable
  String lineSelected;

  @observable
  bool sharedLocation = false;

  @action
  void setBus(String value) {
    busSelected = value;
  }

  @action
  void setLine(String value) {
    lineSelected = value;
  }

  @action
  void setCharedLocation() {
    sharedLocation = !sharedLocation;
  }

  @computed
  bool get sharedButtonEnabled => (busSelected != null && lineSelected != null) ? true : false;
}