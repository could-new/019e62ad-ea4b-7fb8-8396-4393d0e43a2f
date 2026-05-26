import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transportation Representative Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9900), // Amazon Orange
          primary: const Color(0xFF232F3E), // Amazon Blue
          secondary: const Color(0xFFFF9900),
          background: const Color(0xFFF2F2F2),
        ),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ResumeHomeScreen(),
      },
    );
  }
}

class ResumeHomeScreen extends StatelessWidget {
  const ResumeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Transportation Representative Candidate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isDesktop) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: SidebarProfile()),
                    Expanded(flex: 2, child: MainContent()),
                  ],
                ),
              ),
            );
          } else {
            return const SingleChildScrollView(
              child: Column(
                children: [
                  SidebarProfile(isMobile: true),
                  MainContent(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class SidebarProfile extends StatelessWidget {
  final bool isMobile;
  const SidebarProfile({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: isMobile ? 60 : 80,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(Icons.person, size: 80, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            'Alex Candidate',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            'L2 Associate Applicant',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[700],
                ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          const ContactInfoItem(icon: Icons.email, text: 'alex.candidate@example.com'),
          const SizedBox(height: 12),
          const ContactInfoItem(icon: Icons.phone, text: '+91 98765 43210'),
          const SizedBox(height: 12),
          const ContactInfoItem(icon: Icons.location_on, text: 'Telangana, India'),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          Text(
            'Skills Summary',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 16),
          const SkillChip(label: 'Logistics & Dispatch'),
          const SkillChip(label: 'Partner Communication'),
          const SkillChip(label: 'Issue Troubleshooting'),
          const SkillChip(label: 'Performance Metrics'),
          const SkillChip(label: 'Microsoft Excel'),
        ],
      ),
    );
  }
}

class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfoItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, size: 16, color: Theme.of(context).colorScheme.secondary),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Objective'),
          const Text(
            'Dedicated and detail-oriented logistics professional seeking the Transportation Representative (L2 Associate) position at Amazon (ASSPL - Telangana). Bringing strong communication skills, proficiency in issue resolution, and a commitment to acting as the optimal interface between Amazon and Delivery Partners to enhance operational efficiency.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 32),
          
          const SectionHeader(title: 'Professional Experience'),
          const ExperienceItem(
            title: 'Logistics Coordinator',
            company: 'Global Express Logistics',
            period: '2021 - Present',
            responsibilities: [
              'Managed daily dispatch operations and served as the primary point of contact for over 50 delivery partners.',
              'Expedited prompt and efficient service, resolving real-time delivery issues and partner concerns.',
              'Reported complex escalations through the proper matrix, reducing unresolved cases by 20%.',
              'Analyzed performance metrics using MS Excel to identify trends and suggested process improvements.',
            ],
          ),
          const SizedBox(height: 24),
          const ExperienceItem(
            title: 'Customer Service Associate',
            company: 'TechSupport Inc.',
            period: '2019 - 2021',
            responsibilities: [
              'Effectively communicated with customers in a clear and professional manner via email and phone.',
              'Demonstrated good comprehension skills by accurately identifying customer issues and guiding them to resolution.',
              'Consistently maintained targeted performance metrics for response time and customer satisfaction.',
              'Utilized Microsoft Outlook, Word, and specialized CRM software efficiently.',
            ],
          ),
          const SizedBox(height: 32),
          
          const SectionHeader(title: 'Education'),
          const ExperienceItem(
            title: 'Bachelor of Business Administration',
            company: 'Osmania University, Telangana',
            period: '2016 - 2019',
            responsibilities: [
              'Specialization in Operations Management',
              'Graduated with First Class Distinction',
            ],
          ),
          const SizedBox(height: 32),

          const SectionHeader(title: 'Core Competencies'),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              'Clear & Professional Communication',
              'Issue Troubleshooting & Resolution',
              'Time-Management',
              'Logical Reasoning',
              'Process Improvement',
              'Escalation Management',
              'MS Office Suite (Excel, Outlook, Word)',
              'Independent & Team Collaboration',
            ].map((e) => Chip(label: Text(e))).toList(),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 4,
            width: 60,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String period;
  final List<String> responsibilities;

  const ExperienceItem({
    super.key,
    required this.title,
    required this.company,
    required this.period,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              period,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          company,
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 12),
        ...responsibilities.map((r) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6.0, right: 8.0),
                    child: Icon(Icons.circle, size: 6, color: Colors.black54),
                  ),
                  Expanded(
                    child: Text(
                      r,
                      style: const TextStyle(fontSize: 15, height: 1.4),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
