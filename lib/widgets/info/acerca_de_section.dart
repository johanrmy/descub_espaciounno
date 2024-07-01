import 'package:descub_espaciounno/util/colors.dart';
import 'package:descub_espaciounno/widgets/info/info_profile_card.dart';
import 'package:flutter/material.dart';

class AcercaDeSection extends StatelessWidget {
  const AcercaDeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        color: AppColors.appLightS,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      child: const Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "¿Quienes somos?",
                      style: TextStyle(
                          fontSize: 28,
                          color: AppColors.secondaryDescub,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto'),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Espacio UNNO, una tienda de arte, fundado por 3 apasionados artistas, ofrece una  selección de objetos de arte y experiencias creativas que cautivan a todos.",
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.appDark,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Noto Sans'),
                      textAlign: TextAlign.justify,
                    )
                  ]
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "¿Dónde nos ubicamos?",
                    style: TextStyle(
                        fontSize: 28,
                        color: AppColors.secondaryDescub,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto'),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8),
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Lima: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.appDark,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Noto Sans',
                          ),
                          children: [
                            TextSpan(
                              text: 'Bajada de baños 342, Barranco - M a D: 12pm a 8pm',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.appDark,
                                fontWeight: FontWeight.w300,fontFamily: 'Noto Sans',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          text: 'Cusco: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.appDark,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Noto Sans',
                          ),
                          children: [
                            TextSpan(
                              text: 'Carmen Alto 269, Cusco - M a D: 11am a 7pm',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.appDark,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Noto Sans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileCard(name: "Monks", imageUrl: "https://descub-espaciounno.s3.amazonaws.com/artist/store/founder_monks.jpg"),
                      ProfileCard(name: "Cake", imageUrl: "https://descub-espaciounno.s3.amazonaws.com/artist/store/founder_cake.jpg"),
                      ProfileCard(name: "Oso de Agua", imageUrl: "https://descub-espaciounno.s3.amazonaws.com/artist/store/founder_osodeagua.jpg"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
