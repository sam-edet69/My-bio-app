import 'package:flutter/material.dart';

void main() {
  runApp(const MyBioApp());
}

// ignore: constant_identifier_names
const SAMPLE_NAME = 'Edet Samuel Mbeh-Inah';
// ignore: constant_identifier_names
const SAMPLE_TITLE = 'Data Entry Clerk · Translator · Typist';
// ignore: constant_identifier_names
const SAMPLE_LOCATION = 'Lagos, Nigeria';
// ignore: constant_identifier_names
const SAMPLE_SUMMARY =
    'I help teams transform messy data into clean, usable insights. With a sharp eye for detail and a love for languages, I deliver fast, accurate data entry, transcription, and English↔︎[Your Language] translation.';

// ignore: constant_identifier_names
const SAMPLE_CONTACT_EMAIL = 'samueledet50@gmail.com';
// ignore: constant_identifier_names
const SAMPLE_CONTACT_PHONE = '+234 814 072 339 8';
// ignore: constant_identifier_names
const SAMPLE_WEBSITE = 'https://www.edetsamuel.yahoo.org';
// ignore: constant_identifier_names
const SAMPLE_LINKEDIN = 'https://linkedin.com/in/samuel-edet';
// ignore: constant_identifier_names
const SAMPLE_GITHUB = 'https://github.com/sam-edet69';

// ignore: constant_identifier_names
const SAMPLE_SKILLS = <String>[
  'Data Entry (70+ WPM)',
  'MS Excel & Google Sheets',
  'Data Cleaning & Validation',
  'Translation (EN ⇄ Your Language)',
  'Transcription & Subtitling',
  'Proofreading & QA',
];

// ignore: constant_identifier_names
const SAMPLE_TOOLS = <String>[
  'Excel / Sheets',
  'Docs / Word',
  'PowerPoint / Slides',
  'Notion / Trello',
  'Canva',
  'VS Code',
];

// ignore: constant_identifier_names
const SAMPLE_EXPERIENCES = <Experience>[
  Experience(
    role: 'Freelance Data Entry & Translator',
    company: 'Self-Employed',
    start: 'Jan 2022',
    end: 'Present',
    bullets: [
      'Completed 200+ projects with 5★ client ratings.',
      'Built Excel templates that cut manual work by 40%.',
      'Translated 100k+ words EN ⇄ [Your Language].',
    ],
  ),
  Experience(
    role: 'Operations Assistant',
    company: 'Acme Co.',
    start: 'Aug 2020',
    end: 'Dec 2021',
    bullets: [
      'Digitized paper records into searchable spreadsheets.',
      'Implemented data validation rules to reduce errors.',
    ],
  ),
];

// ignore: constant_identifier_names
const SAMPLE_PROJECTS = <Project>[
  Project(
    name: 'Client CRM Cleanup',
    description:
        'Merged duplicate entries, standardized phone formats, and validated emails for a 10k-row CRM sheet.',
    link: null,
  ),
  Project(
    name: 'YouTube Subtitle Pack',
    description:
        'Transcribed and time-coded 20+ videos; delivered SRT files and translated subtitles.',
    link: null,
  ),
  Project(
    name: 'Product Catalog Translation',
    description:
        'Translated 8,000+ words EN → [Your Language] for an e-commerce listing set.',
    link: null,
  ),
];

// =============================== APP ROOT ================================ //
class MyBioApp extends StatelessWidget {
  const MyBioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Me',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: const BioHomePage(),
    );
  }
}

class BioHomePage extends StatefulWidget {
  const BioHomePage({super.key});

  @override
  State<BioHomePage> createState() => _BioHomePageState();
}

class _BioHomePageState extends State<BioHomePage> {
  int _index = 0;
  final _pages = const [
    AboutSection(),
    SkillsSection(),
    ExperienceSection(),
    ProjectsSection(),
    ContactSection(),
  ];

  final _titles = const [
    'About',
    'Skills',
    'Experience',
    'Projects',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_index]),
        centerTitle: true,
      ),
      drawer: _AppDrawer(
        onTap: (i) => setState(() => _index = i),
        currentIndex: _index,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: _pages[_index],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.person), label: 'About'),
          NavigationDestination(icon: Icon(Icons.star_border), label: 'Skills'),
          NavigationDestination(icon: Icon(Icons.timeline), label: 'Experience'),
          NavigationDestination(icon: Icon(Icons.work_outline), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.email_outlined), label: 'Contact'),
        ],
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  const _AppDrawer({required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const _HeaderCard(),
            const Divider(),
            _drawerItem(Icons.person, 'About', 0),
            _drawerItem(Icons.star_border, 'Skills', 1),
            _drawerItem(Icons.timeline, 'Experience', 2),
            _drawerItem(Icons.work_outline, 'Projects', 3),
            _drawerItem(Icons.email_outlined, 'Contact', 4),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Built with Flutter ❤', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String label, int i) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: currentIndex == i,
      onTap: () => onTap(i),
    );
  }
}

// =============================== SECTIONS =============================== //
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final wide = c.maxWidth > 800;
        final content = [
          const _HeaderCard(),
          const SizedBox(height: 16),
          _InfoCard(
            title: 'Summary',
            child: Text(
              SAMPLE_SUMMARY,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 16),
          _ChipsPanel(title: 'Tools I Use', items: SAMPLE_TOOLS),
        ];

        if (wide) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(flex: 2, child: content[0]),
                const SizedBox(width: 16),
                Flexible(
                  flex: 5,
                  child: Column(
                    children: content.sublist(1),
                  ),
                ),
              ],
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: content,
        );
      },
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(
          title: 'Core Skills',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: SAMPLE_SKILLS
                .map((s) => Chip(label: Text(s)))
                .toList(growable: false),
          ),
        ),
        const SizedBox(height: 16),
        _InfoCard(
          title: 'What I Offer',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _Bullet('Fast and accurate typing with strict QA checks.'),
              _Bullet('Clean, organized spreadsheets with clear formatting.'),
              _Bullet('Friendly communication and on-time delivery.'),
            ],
          ),
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: SAMPLE_EXPERIENCES.length,
      itemBuilder: (context, i) {
        final e = SAMPLE_EXPERIENCES[i];
        return _InfoCard(
          title: '${e.role} · ${e.company}',
          subtitle: '${e.start} — ${e.end}',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: e.bullets.map((b) => _Bullet(b)).toList(),
          ),
        );
      },
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: SAMPLE_PROJECTS.length,
      itemBuilder: (context, i) {
        final p = SAMPLE_PROJECTS[i];
        return _InfoCard(
          title: p.name,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p.description),
              if (p.link != null) ...[
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () => _launchUrl(context, p.link!),
                  child: const Text('View Project'),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(
          title: 'Contact Me',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ContactRow(icon: Icons.email_outlined, label: SAMPLE_CONTACT_EMAIL),
              _ContactRow(icon: Icons.phone_outlined, label: SAMPLE_CONTACT_PHONE),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  if (SAMPLE_WEBSITE.isNotEmpty)
                    FilledButton(
                      onPressed: () => _launchUrl(context, SAMPLE_WEBSITE),
                      child: const Text('Website'),
                    ),
                  if (SAMPLE_LINKEDIN.isNotEmpty)
                    FilledButton.tonal(
                      onPressed: () => _launchUrl(context, SAMPLE_LINKEDIN),
                      child: const Text('LinkedIn'),
                    ),
                  if (SAMPLE_GITHUB.isNotEmpty)
                    OutlinedButton(
                      onPressed: () => _launchUrl(context, SAMPLE_GITHUB),
                      child: const Text('GitHub'),
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _InfoCard(
          title: 'Availability',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _Bullet('Open to remote-only or hybrid roles.'),
              _Bullet('Available for short-term gigs and long-term contracts.'),
              _Bullet('Timezone: WAT (UTC+1) — flexible with hours.'),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================== WIDGETS ================================= //
class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return _InfoCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _Avatar(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SAMPLE_NAME,
                  style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  SAMPLE_TITLE,
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.place_outlined, size: 16),
                    const SizedBox(width: 6),
                    Text(SAMPLE_LOCATION),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          // ignore: deprecated_member_use
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: CircleAvatar(
        radius: 44,
        backgroundImage: const AssetImage('assets/profile.jpg'),
        onBackgroundImageError: (_, __) {}, // fallback to child
        child: Text(
          _initials(SAMPLE_NAME),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget child;
  final EdgeInsetsGeometry padding;
  const _InfoCard({
    this.title,
    this.subtitle,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(title!, style: t.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(subtitle!, style: t.textTheme.bodySmall),
              ],
              const SizedBox(height: 12),
            ],
            child,
          ],
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _ChipsPanel extends StatelessWidget {
  final String title;
  final List<String> items;
  const _ChipsPanel({required this.title, required this.items});
  @override
  Widget build(BuildContext context) {
    return _InfoCard(
      title: title,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: items.map((t) => Chip(label: Text(t))).toList(),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ContactRow({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Flexible(child: Text(label)),
        ],
      ),
    );
  }
}

// ============================== MODELS ================================== //
class Experience {
  final String role;
  final String company;
  final String start;
  final String end;
  final List<String> bullets;
  const Experience({
    required this.role,
    required this.company,
    required this.start,
    required this.end,
    required this.bullets,
  });
}

class Project {
  final String name;
  final String description;
  final String? link;
  const Project({required this.name, required this.description, this.link});
}

// ============================== HELPERS ================================= //
String _initials(String name) {
  final parts = name.trim().split(RegExp(r"\s+"));
  final first = parts.isNotEmpty ? parts.first.characters.first : '';
  final last = parts.length > 1 ? parts.last.characters.first : '';
  return (first + last).toUpperCase();
}

void _launchUrl(BuildContext context, String url) async {
  // This stub shows a friendly message. For real URL launch, add url_launcher.
  // In pubspec.yaml:
  //   dependencies:
  //     url_launcher: ^6.3.0
  // And replace this function with proper launch logic.
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Open: $url')),
  );
}
