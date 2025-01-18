import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

void showAboutUsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'عن الشركة',
          style: TextStyles.bold23,
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionContent(
                'الشركة العربية الخليجية هي شركة رائدة في صناعة السمن والزيوت، تأسست عام 2009 بهدف تقديم منتجات عالية الجودة تلبي احتياجات الأسر في المنطقة العربية. منذ بداية تأسيسنا، ونحن نسعى جاهدين لتوفير منتجات غذائية تلبي أعلى معايير الجودة والسلامة، مما يجعلنا الخيار الأول لعملائنا في صناعة السمن والزيوت.',
              ),
              buildSectionTitle('رؤيتنا'),
              buildSectionContent(
                'أن نصبح الشركة الرائدة في صناعة السمن والزيوت في المنطقة العربية، وأن نقدم لعملائنا منتجات مبتكرة وصحية وآمنة، مع الحفاظ على أعلى معايير الجودة.',
              ),
              buildSectionTitle('مهمتنا'),
              buildSectionContent(
                'مهمتنا هي تقديم منتجات سمن وزيوت عالية الجودة تجمع بين الطعم الرائع والفوائد الصحية. نحن نركز على تحقيق الاستدامة في عملياتنا، ونسعى لتقديم منتجات تساعد عملائنا في تحقيق حياة صحية ومتوازنة.',
              ),
              buildSectionTitle('قيمنا'),
              buildSectionContent(
                '- **الجودة**: نلتزم بتقديم سمن وزيوت ذات جودة عالية وبمعايير عالمية.\n'
                '- **الابتكار**: نعمل دائمًا على تطوير وتحسين منتجاتنا لتلبية احتياجات عملائنا.\n'
                '- **النزاهة**: نؤمن بأهمية النزاهة في جميع تعاملاتنا الداخلية والخارجية.\n'
                '- **الاستدامة**: نعمل على تقليل الأثر البيئي وتعزيز الاستدامة في عملياتنا.',
              ),
              buildSectionTitle('ما نقدمه'),
              buildSectionContent(
                'نقدم مجموعة واسعة من المنتجات التي تشمل:\n'
                '- **السمن النباتي**: سمن ذو طعم رائع وجودة عالية.\n'
                '- **زيوت الطهي**: مجموعة متنوعة من الزيوت مثل زيت عباد الشمس وزيت الزيتون وزيت الذرة.',
              ),
              buildSectionTitle('فريقنا'),
              buildSectionContent(
                'يضم فريقنا مجموعة من الخبراء والمتخصصين في صناعة السمن والزيوت، الذين يعملون بجد لضمان تقديم منتجات تلبي توقعات عملائنا في جميع أنحاء المنطقة.',
              ),
              buildSectionTitle('إنجازاتنا'),
              buildSectionContent(
                'منذ تأسيسنا في 2009، حققنا العديد من النجاحات، ومنها:\n'
                '- **جوائز الجودة**: حصلنا على العديد من الجوائز تقديرًا لالتزامنا بالجودة.\n'
                '- **الشهادات الدولية**: نحن حاصلون على شهادات معترف بها في مجال صناعة السمن والزيوت.',
              ),
              buildSectionTitle('اتصل بنا'),
              buildSectionContent(
                'لأي استفسارات أو شكاوى، يرجى التواصل معنا عبر:\n'
                '- الهاتف: [رقم الهاتف]\n'
                '- البريد الإلكتروني: [البريد الإلكتروني]\n'
                '- العنوان: [عنوان الشركة]',
              ),
              buildSectionTitle('تابعونا على وسائل التواصل الاجتماعي'),
              buildSectionContent(
                'ابقَ على اطلاع دائم بأحدث منتجاتنا وعروضنا من خلال متابعتنا على:\n'
                '- [رابط فيسبوك]\n'
                '- [رابط إنستجرام]\n'
                '- [رابط تويتر]',
              ),
            ],
          ),
        ),
        actions: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'إغلاق',
                textAlign: TextAlign.start,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
    child: Text(
      title,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
    ),
  );
}

Widget buildSectionContent(String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      content,
      style: TextStyles.semiBold13,
      textAlign: TextAlign.justify,
    ),
  );
}
