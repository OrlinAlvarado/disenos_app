import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeadersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Slideshow(
      puntosArriba: true,
      colorPrimario:
          appTheme.darkTheme ? appTheme.currentTheme.accentColor : Colors.pink,
      bulletPrimario: 15,
      bulletSecundario: 12,
      slides: <Widget>[
        HeaderCuadrado(),
        HeaderBordersRedondeados(),
        HeaderDiagonal(),
        HeaderTriangulo(),
        HeaderPico(),
        HeaderCurvo(),
        HeaderWave(
          color: Colors.blue,
        ),
        HeaderWaveGradient(),
        BottomWave()

      ],
    )
    );
  }
}