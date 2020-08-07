import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:disenos_app/src/pages/pinterest_page.dart';
import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/pages/sliver_list_page.dart';
import 'package:disenos_app/src/retos/cuadrado_animado.dart';

final pageRoutes = <_Route>[
  _Route( FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage() ),
  _Route( FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage() ),
  _Route( FontAwesomeIcons.heading, 'Encabezados', HeadersPage() ),
  _Route( FontAwesomeIcons.peopleCarry, 'Cuadro Animado', CuadradoAnimadoPage() ),
  _Route( FontAwesomeIcons.circleNotch, 'Barra progreso', GraficasCircularesPage() ),
  _Route( FontAwesomeIcons.pinterest, 'Piterest', PinterestPage() ),
  _Route( FontAwesomeIcons.mobile, 'Slivers', SliverListPage() ),

];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
