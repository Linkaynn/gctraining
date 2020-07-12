import 'package:mobx/mobx.dart';

part 'm_store.g.dart';

class MStore = _MStore with _$MStore;

abstract class _MStore with Store {
  @observable
  bool isLoading = false;

  @observable
  Map<String, bool> loadings = ObservableMap<String, bool>();

  @observable
  bool hasError = false;

  getLoading(String key) {
    return loadings.containsKey(key) ? loadings[key] : false;
  }

  @action
  setLoading(String key, bool value) {
    loadings[key] = value;
  }

  Future<T> wrapLoading<T>(Future<T> request, {String key}) {
    this.hasError = false;

    Function setLoading = (bool value) {
      if (key != null) {
        this.setLoading(key, value);
      } else {
        this.isLoading = value;
      }
    };

    setLoading(true);

    return request.then((T value) {
      setLoading(false);

      dynamic answerAsAny = value;

      if (answerAsAny.hasError) {
        this.hasError = true;
      }

      return value;
    }).catchError((onError) {
      this.hasError = true;
      setLoading(false);
    });
  }

  // This is needed to force the updating, due to some stupid logic over refresh in mobx
  void refresh() {
    this.isLoading = this.isLoading;
  }
}
