import 'package:flutter/cupertino.dart';
import '../../util/colors.dart';

class InfoText extends StatelessWidget {

  const InfoText({    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              "Cake, Monks y Oso de Agua abrieron una tienda de arte en Barranco en marzo de 2023. En este acogedor lugar, comparten su amor por el arte a través de productos únicos y creativos. Desde pinturas hasta artesanías, cada pieza refleja su dedicación. Es un rincón especial en Barranco donde el arte cobra vida y todos son bienvenidos a explorar.",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w300,
                color: AppColors.appDark,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5.0),
          ],
      ),
    );
  }
}
