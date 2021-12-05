import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bloc.dart';

class SaveFileProgressDialog extends GetView<SaveFileProgressDialogBloc> {
  final Future<void> Function() save;
  const SaveFileProgressDialog(
    this.save, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SaveFileProgressDialogBloc());

    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        child: FutureBuilder(
          future: save.call(),
          builder: (context, snapshot) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _title(snapshot),
                AnimatedBuilder(
                  animation: controller.animation,
                  builder: (context, child) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      controller.playAnimation();

                      if (snapshot.hasError) {
                        return Column(
                          children: [
                            _fadeInFile(
                              Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            ),
                            _growableFooter(),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          _fadeInFile(
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                          ),
                          _growableFooter(),
                        ],
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 24.0,
                      ),
                      child: LinearProgressIndicator(),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _title(AsyncSnapshot snapshot) {
    return ListTile(
      title: AnimatedCrossFade(
        duration: Duration(milliseconds: 300),
        firstChild: Text('Salvando arquivo...'),
        secondChild: snapshot.hasError
            ? Text('Erro ao salvar arquivo!')
            : Text('Arquivo salvo com sucesso!'),
        crossFadeState: snapshot.connectionState != ConnectionState.done
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }

  Widget _fadeInFile(Widget icon) {
    return Container(
      width: 76.0,
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      alignment: Alignment.center,
      child: SizeTransition(
        sizeFactor: controller.stackSize,
        child: Stack(
          children: [
            _scaledFadeTransition(
              scale: controller.fileScale,
              opacity: controller.fileOpacity,
              child: Icon(
                Icons.description,
                color: Colors.grey[300],
                size: 76.0,
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 4.0,
              child: _scaledFadeTransition(
                scale: controller.iconScale,
                opacity: controller.iconOpacity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Get.theme.dialogBackgroundColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: icon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _growableFooter() {
    return SizeTransition(
      sizeFactor: controller.stackSize,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
          bottom: 4.0,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: Get.back,
            child: Text('Ok'),
          ),
        ),
      ),
    );
  }

  Widget _scaledFadeTransition({
    required Widget child,
    required Animation<double> scale,
    required Animation<double> opacity,
  }) {
    return ScaleTransition(
      scale: scale,
      child: FadeTransition(
        opacity: opacity,
        child: child,
      ),
    );
  }
}
