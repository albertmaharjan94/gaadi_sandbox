import 'package:flutter/material.dart';

class SingleJobBody extends StatefulWidget {
  SingleJobBody({Key? key}) : super(key: key);

  String html = '<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!';

  String? text = """JOB SUMMARY

Working under the supervision of the Chief of Party (COP), the Director of Data Collection, Analytics and Use will be expected to ensure the collection of appropriate data from a variety of sources to understand effectiveapproachesandActivityperformanceonanon-going basis.ThispositionwillleadtheActivityintheeffectiveanalysisanduseofdatatoadjustprogrammaticapproachesatthenationaland individual municipal levels on a continuous basis. This position, along with the COP and DCOP, will lead the Activity in the continuous implementation of adaptive management, ensuring a feedback loop and direct connection between data and continuous program and strategic adjustments and improvements.

REQUIREMENTS

At least eight years of experience in monitoring, evaluation, study design/management, or statistical analysis in the development field, with increasing levels of responsibility. Experience with survey design,or the design and testing of data collection instruments preferred.
A post-graduate degree in statistics, study design/implementation, research methods, M&E or a related field.
An exceptional grasp of data analytics/statistical analysis; the demonstrated ability to independently conduct analysis of large datasets, including quantitative and qualitative data sets. Experience with and command of one or more data/statistical analysis programs/software. Ability to conduct data collection, analysis, and reporting of publish-able quality.
Ability to independently develop monitoring and reporting systems that include appropriate indicators, baseline data, targets; and a plan to evaluate performance and produce timely, accurate and complete reporting. Ability to identify and summarize key, relevant data and other information; ability to prepare detailed, accurate, relevant,reader-friendly reports.
Experience implementing adaptive management.The ability to work collaboratively with program staff and leadership to ensure a feedback loop and direct connection between data and continuous program and strategic adjustments and improvements.The ability to translate data and research findings into appropriate programmatic interventions. 

ESSENTIAL SOFT SKILLS

Committed to EngenderHealth’s core organizational values of reflection, inclusion, integrity, respect, and transformation.
Good track record of leading, supporting and coaching field teams and counterparts.

PREFERRED SKILLS, ABILITIES AND FUNCTIONS

Excellent written and spoken English language skills. Ability to speak Nepali preferred.
  """;
  bool isExpanded = false;

  @override
  _SingleJobBodyState createState() => _SingleJobBodyState();
}

class _SingleJobBodyState extends State<SingleJobBody>
    with TickerProviderStateMixin<SingleJobBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Flexible(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Job Description",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Text(widget.text!)
            ]),
      ),
    );
  }
}
