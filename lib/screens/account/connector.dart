import 'dart:ui';

abstract class Connector {
    void showLoading();
    void showMessage(String message,Color color);
    void hideLoading();

}