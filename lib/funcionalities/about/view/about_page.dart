import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_counter/widgets/custom_svg.dart';
import 'package:life_counter/widgets/modal_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/app_colors.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final String strinUrl1 = 'https://www.github.com/victorcapanema/OMC';
  final String strinUrl2 =
      'https://www.paypal.com/donate/?business=DUN9RR5G7DZ4J&no_recurring=0&item_name=Keep+the+project+updated%21%21&currency_code=USD';
  late Uri url1 = Uri.parse(strinUrl1);
  late Uri url2 = Uri.parse(strinUrl2);

  void copyToClipboard(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(duration: Duration(milliseconds: 500), content: Text('Copied to clipboard!')));
  }

  @override
  Widget build(BuildContext context) {
    return ModalPage(
      isCenter: true,
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 5, color: AppColors.black2)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      const TextSpan(
                          text: 'Thanks for using Open Magic Counter!\n', style: TextStyle(color: AppColors.grey)),
                      const TextSpan(
                          text: 'This is an open source project, more info visit the github\n ',
                          style: TextStyle(color: AppColors.grey)),
                      WidgetSpan(
                        child: IconButton(
                          onPressed: () async {
                            if (await canLaunchUrl(url1)) {
                              await launchUrl(url1, mode: LaunchMode.externalApplication);
                            } else {
                              await Clipboard.setData(ClipboardData(text: strinUrl1));
                              if (context.mounted) {
                                copyToClipboard(context);
                              }
                            }
                          },
                          icon: Image.asset(
                            'images/github.png',
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      const TextSpan(text: '\n\n'),
                      const TextSpan(
                          text: 'Also, if you are enjoying it, you can support this project!!',
                          style: TextStyle(color: AppColors.grey)),
                      WidgetSpan(
                        child: IconButton(
                            onPressed: () async {
                              if (await canLaunchUrl(url2)) {
                                await launchUrl(url2, mode: LaunchMode.externalApplication);
                              } else {
                                await Clipboard.setData(ClipboardData(text: strinUrl2));
                                if (context.mounted) {
                                  copyToClipboard(context);
                                }
                              }
                            },
                            icon: CSvg('images/paypal.svg', color: AppColors.grey)),
                      ),
                      const TextSpan(text: '\n\n\n\n'),
                      const TextSpan(
                          text: 'All cards images, card icons and ruling are © Wizards of the Coast. \n ',
                          style: TextStyle(color: AppColors.grey)),
                      const TextSpan(text: '\n\n\n\n'),
                      const TextSpan(
                          text: 'Open Magic Counter v 1.0 by Victor C. Capanema. \n ',
                          style: TextStyle(color: AppColors.grey)),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
