import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fullstack Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF64FFDA), // A nice teal color
          secondary: Color(0xFF112240),
          surface: Color(0xFF0A192F),
          background: Color(0xFF0A192F),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A192F),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Color(0xFFCCD6F6), fontWeight: FontWeight.bold),
          displayMedium: TextStyle(color: Color(0xFFCCD6F6), fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(color: Color(0xFFCCD6F6), fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Color(0xFFCCD6F6), fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Color(0xFF8892B0)),
          bodyMedium: TextStyle(color: Color(0xFF8892B0)),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PortfolioHomePage(),
      },
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.9),
        elevation: 0,
        title: Text(
          '<Dev/>',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: MediaQuery.of(context).size.width > 600
            ? [
                _NavBarItem(title: 'About', onTap: () => _scrollToSection(_aboutKey)),
                _NavBarItem(title: 'Projects', onTap: () => _scrollToSection(_projectsKey)),
                _NavBarItem(title: 'Contact', onTap: () => _scrollToSection(_contactKey)),
                const SizedBox(width: 20),
              ]
            : null,
      ),
      drawer: MediaQuery.of(context).size.width <= 600
          ? Drawer(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
                    child: Text(
                      '<Dev/>',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('About', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(_aboutKey);
                    },
                  ),
                  ListTile(
                    title: const Text('Projects', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(_projectsKey);
                    },
                  ),
                  ListTile(
                    title: const Text('Contact', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(_contactKey);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroSection(key: _heroKey),
              const SizedBox(height: 100),
              _AboutSection(key: _aboutKey),
              const SizedBox(height: 100),
              _ProjectsSection(key: _projectsKey),
              const SizedBox(height: 100),
              _ContactSection(key: _contactKey),
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  'Built with Flutter',
                  style: TextStyle(color: Color(0xFF8892B0), fontSize: 12),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 500),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hi, my name is',
            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Text(
            'Alex Developer.',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: MediaQuery.of(context).size.width > 600 ? 60 : 40,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            'I build things for the web and mobile.',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: const Color(0xFF8892B0),
                  fontSize: MediaQuery.of(context).size.width > 600 ? 60 : 30,
                ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 500,
            child: Text(
              'I am a software engineer specializing in building (and occasionally designing) exceptional digital experiences. Currently, I am focused on building accessible, human-centered products.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18, height: 1.5),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.primary,
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: const Text('Check out my work!', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(title: 'About Me'),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _AboutText(),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    flex: 2,
                    child: _ProfileImage(),
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _AboutText(),
                const SizedBox(height: 40),
                _ProfileImage(),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello! My name is Alex and I enjoy creating things that live on the internet. My interest in web and mobile development started back in 2015 when I decided to try editing custom Tumblr themes — turns out hacking together HTML & CSS taught me a lot about HTML & CSS!',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.5),
        ),
        const SizedBox(height: 20),
        Text(
          'Fast-forward to today, and I have had the privilege of working at an advertising agency, a start-up, a huge corporation, and a student-led design studio. My main focus these days is building accessible, inclusive products and digital experiences for a variety of clients.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.5),
        ),
        const SizedBox(height: 20),
        Text(
          'Here are a few technologies I have been working with recently:',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.5),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _SkillItem(skill: 'Flutter'),
                  _SkillItem(skill: 'Dart'),
                  _SkillItem(skill: 'Node.js'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _SkillItem(skill: 'React'),
                  _SkillItem(skill: 'PostgreSQL'),
                  _SkillItem(skill: 'Firebase'),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _SkillItem extends StatelessWidget {
  final String skill;

  const _SkillItem({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(Icons.arrow_right, color: Theme.of(context).colorScheme.primary, size: 20),
          const SizedBox(width: 8),
          Text(skill, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 250,
          height: 250,
          margin: const EdgeInsets.only(top: 20, left: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Center(
            child: Icon(Icons.person, size: 100, color: Color(0xFF8892B0)),
          ),
        ),
      ],
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(title: 'Some Things I Have Built'),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, constraints) {
            int columns = 1;
            if (constraints.maxWidth > 900) {
              columns = 3;
            } else if (constraints.maxWidth > 600) {
              columns = 2;
            }

            return GridView.count(
              crossAxisCount: columns,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
              children: const [
                _ProjectCard(
                  title: 'E-Commerce Platform',
                  description: 'A full-stack e-commerce application featuring a React frontend, Node.js backend, and PostgreSQL database. Includes payment processing and order management.',
                  tech: ['React', 'Node.js', 'PostgreSQL'],
                ),
                _ProjectCard(
                  title: 'Task Management App',
                  description: 'A cross-platform mobile application built with Flutter and Firebase. Features real-time sync, offline support, and push notifications.',
                  tech: ['Flutter', 'Firebase', 'Dart'],
                ),
                _ProjectCard(
                  title: 'Analytics Dashboard',
                  description: 'A comprehensive web dashboard for tracking user metrics. Built with Vue.js and connected to a custom Python REST API.',
                  tech: ['Vue.js', 'Python', 'D3.js'],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> tech;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tech,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.folder_open, size: 40, color: Theme.of(context).colorScheme.primary),
              Row(
                children: [
                  Icon(Icons.link, size: 24, color: const Color(0xFFCCD6F6)),
                  const SizedBox(width: 10),
                  Icon(Icons.code, size: 24, color: const Color(0xFFCCD6F6)),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFCCD6F6),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 15, color: Color(0xFF8892B0), height: 1.5),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: tech.map((t) => Text(t, style: const TextStyle(fontSize: 13, color: Color(0xFF8892B0)))).toList(),
          ),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What\'s Next?',
            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFFCCD6F6),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            width: 500,
            child: Text(
              'Although I\'m not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I\'ll try my best to get back to you!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Color(0xFF8892B0), height: 1.5),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.primary,
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: const Text('Say Hello', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 26),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFF233554),
          ),
        ),
      ],
    );
  }
}
