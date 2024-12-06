import 'package:flutter/material.dart';
import 'package:flutterprojeto_3/main.dart';

class TeamsIndicator extends StatelessWidget {
  final String firstTeam;
  final String secondTeam;

  const TeamsIndicator(
      {super.key, required this.firstTeam, required this.secondTeam});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  'A',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.colorDarkBlue,
                      height: 1.0),
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.colorWhite,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.15,
              ),
              child: Text(
                firstTeam,
                overflow: TextOverflow.ellipsis,
                style:
                const TextStyle(fontSize: 18, color: AppColors.colorDarkBlue),
              ),
            )
          ],
        ),
        Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const Text(
                  'B',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.colorDarkBlue,
                      height: 1.0),
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.colorWhite,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.15,
              ),
              child: Text(
                secondTeam,
                overflow: TextOverflow.ellipsis,
                style:
                const TextStyle(fontSize: 18, color: AppColors.colorDarkBlue),
              ),
            )
          ],
        )
      ],
    );
  }
}
