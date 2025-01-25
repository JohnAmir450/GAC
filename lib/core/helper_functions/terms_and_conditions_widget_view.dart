import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';

void showTermsAndConditionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'الشروط والأحكام',
          style: TextStyles.bold23,
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle('1. القبول بالشروط'),
              buildSectionContent(
                'باستخدامك لهذا التطبيق، فإنك توافق على الالتزام بهذه الشروط والأحكام. '
                'إذا كنت لا توافق على أي من هذه الشروط، يرجى التوقف عن استخدام التطبيق.',
              ),
              buildSectionTitle('2. معلومات عن الشركة'),
              buildSectionContent(
                'التطبيق تابع لـ الشركة العربية الخليجية، وهي شركة مصرية متخصصة في صناعة المواد الغذائية (الزيت والسمنة). '
                'الشركة قائمة في مصر ولديها شبكة توزيع في جميع أنحاء الشرق الأوسط.',
              ),
              buildSectionTitle('3. تسجيل المستخدم'),
              buildSectionContent(
                'للاستفادة من خدمات التطبيق، يتعين عليك تسجيل حساب باستخدام: الاسم الكامل، عنوان البريد الإلكتروني، رقم الهاتف، العنوان السكني. '
                'يمكنك أيضًا تسجيل الدخول باستخدام حساب Google أو Facebook الخاص بك.',
              ),
              buildSectionTitle('4. جمع البيانات واستخدامها'),
              buildSectionContent(
                'نقوم بجمع البيانات الشخصية لضمان تقديم الخدمات بشكل أفضل، مثل طلب المنتجات وتوصيلها. '
                'يتم التعامل مع جميع بياناتك الشخصية بسرية وفقًا لسياسة الخصوصية الخاصة بنا.',
              ),
              buildSectionTitle('5. استخدام التطبيق'),
              buildSectionContent(
                'يتيح التطبيق للمستخدمين الاطلاع على أحدث أسعار منتجات الشركة. '
                'يمكنك طلب المنتجات المتاحة والدفع عند استلام الطلب. '
                'يتيح التطبيق إمكانية متابعة حالة الطلبات المرسلة وتحديث بيانات الحساب الشخصي.',
              ),
              // Add other sections as needed...
               buildSectionTitle('6. الدفع عند الاستلام'),
            buildSectionContent(
              'الطريقة الوحيدة للدفع المتاحة حاليًا هي الدفع نقدًا عند استلام الطلب. '
              'يجب تقديم بيانات دقيقة وصحيحة لتسليم الطلب بنجاح.',
            ),
            buildSectionTitle('7. تحديث البيانات'),
            buildSectionContent(
              'يتحمل المستخدم مسؤولية تحديث بياناته الشخصية مثل العنوان ورقم الهاتف لضمان استلام الطلبات بشكل صحيح.',
            ),
            buildSectionTitle('8. إلغاء الطلبات'),
            buildSectionContent(
              'يحق للمستخدم إلغاء الطلب قبل تأكيده من قبل فريق العمل. '
              'في حالة الإلغاء بعد تأكيد الطلب، يحتفظ التطبيق بحق اتخاذ الإجراءات المناسبة.',
            ),
            buildSectionTitle('9. حقوق الملكية الفكرية'),
            buildSectionContent(
              'جميع المحتويات الموجودة في التطبيق، بما في ذلك النصوص والصور والشعارات، هي ملك للشركة العربية الخليجية ومحمية بموجب قوانين حقوق الملكية الفكرية. '
              'يحظر نسخ أو إعادة استخدام أي محتوى دون الحصول على إذن خطي مسبق من الشركة.',
            ),
            buildSectionTitle('10. حدود المسؤولية'),
            buildSectionContent(
              'يتم توفير التطبيق والخدمات كما هي، ولا تضمن الشركة أن التطبيق خالٍ من الأخطاء أو يعمل دون انقطاع. '
              'لا تتحمل الشركة أي مسؤولية عن أي أضرار ناتجة عن استخدام التطبيق أو الاعتماد على محتوياته.',
            ),
            buildSectionTitle('11. التعديلات على الشروط والأحكام'),
            buildSectionContent(
              'تحتفظ الشركة بالحق في تعديل هذه الشروط والأحكام في أي وقت. '
              'سيتم إخطار المستخدمين بأي تغييرات عن طريق تحديث تاريخ السريان في أعلى هذه الصفحة. '
              'يعتبر استمرار استخدامك للتطبيق بعد إجراء التعديلات موافقة منك على الشروط المعدلة.',
            ),
            buildSectionTitle('12. القوانين المعمول بها'),
            buildSectionContent(
              'تخضع هذه الشروط والأحكام وتفسر وفقًا للقوانين السارية في جمهورية مصر العربية. '
              'وأي نزاع ينشأ عنها يتم حله في المحاكم المصرية.',
            ),
            buildSectionTitle('13. بيانات التواصل'),
             buildSectionContent(
                'لأي استفسارات أو شكاوى، يرجى التواصل معنا عبر:\n'
                '- الهاتف: 01140550072\n'
                '- البريد الإلكتروني: gulfarabiancompany650@gmail.com \n'
                '- العنوان: قطعة رقم 5 - المنطقة الصناعية - مدينة بدر',
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
                'موافق',
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
  return Text(
    content,
    style: TextStyles.semiBold13,
    textAlign: TextAlign.justify,
  );
}
