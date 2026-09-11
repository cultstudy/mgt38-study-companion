import 'package:flutter/material.dart';
import 'screens/materials_screen.dart';

void main() {
  runApp(const Mgt38App());
}

class Mgt38App extends StatelessWidget {
  const Mgt38App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MGT38 Study Companion',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF173B70),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
      ),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;

  final pages = const [
    HomePage(),
    MaterialsScreen(),
    RoutinePage(),
    ProgressPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          setState(() => index = value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Materials',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month),
            label: 'Routine',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.more_horiz),
            selectedIcon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xFF101820),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'MGT38',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MGT38',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Study Companion',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none),
              ),
            ],
          ),

          const SizedBox(height: 26),

          const Text(
            'Good evening 👋',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Ready to continue your study?',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF173B70),
                  Color(0xFF285A9E),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Same Batch · Same Goals',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'A Brighter Tomorrow.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Keep learning. Keep progressing.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: QuickCard(
                  icon: Icons.menu_book,
                  title: 'Study',
                  subtitle: 'Materials',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickCard(
                  icon: Icons.calendar_today,
                  title: 'Class',
                  subtitle: 'Routine',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: QuickCard(
                  icon: Icons.quiz_outlined,
                  title: 'Practice',
                  subtitle: 'Quizzes',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickCard(
                  icon: Icons.trending_up,
                  title: 'My',
                  subtitle: 'Progress',
                ),
              ),
            ],
          ),

          const SizedBox(height: 26),

          const Text(
            'Latest Updates',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          UpdateCard(
            icon: Icons.picture_as_pdf,
            title: 'New study material',
            subtitle: 'A new PDF has been added',
          ),
          UpdateCard(
            icon: Icons.campaign_outlined,
            title: 'Batch announcement',
            subtitle: 'Check the latest notice',
          ),
        ],
      ),
    );
  }
}

class QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const QuickCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF173B70), size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class UpdateCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const UpdateCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFEAF0FA),
          child: Icon(icon, color: const Color(0xFF173B70)),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class MaterialsPage extends StatelessWidget {
  const MaterialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final semesters = [
      'Semester 1',
      'Semester 2',
      'Semester 3',
      'Semester 4',
      'Semester 5',
      'Semester 6',
      'Semester 7',
      'Semester 8',
    ];

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Study Materials',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Choose a semester to explore your resources.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 22),
          ...semesters.map(
            (semester) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.folder_outlined,
                  color: Color(0xFF173B70),
                ),
                title: Text(
                  semester,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'Class Routine',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          RoutineCard(
            time: '09:00 AM',
            subject: 'Management Accounting',
            teacher: 'Class Teacher',
            room: 'Room 301',
          ),
          RoutineCard(
            time: '11:00 AM',
            subject: 'Human Resource Management',
            teacher: 'Class Teacher',
            room: 'Room 302',
          ),
        ],
      ),
    );
  }
}

class RoutineCard extends StatelessWidget {
  final String time;
  final String subject;
  final String teacher;
  final String room;

  const RoutineCard({
    super.key,
    required this.time,
    required this.subject,
    required this.teacher,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            const Icon(
              Icons.access_time,
              color: Color(0xFF173B70),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(subject),
                  Text(
                    '$teacher · $room',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'My Progress',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  const Text(
                    'Overall Progress',
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '42%',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: .42,
                    minHeight: 9,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          const ProgressItem(
            title: 'Management Accounting',
            value: .65,
          ),
          const ProgressItem(
            title: 'Human Resource Management',
            value: .48,
          ),
          const ProgressItem(
            title: 'Finance',
            value: .30,
          ),
        ],
      ),
    );
  }
}

class ProgressItem extends StatelessWidget {
  final String title;
  final double value;

  const ProgressItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 10),
            LinearProgressIndicator(value: value),
          ],
        ),
      ),
    );
  }
}

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'More',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text('Notifications'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.quiz_outlined),
            title: Text('Quizzes'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.calculate_outlined),
            title: Text('CGPA Calculator'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.psychology_outlined),
            title: Text('AI Question Analyzer'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.download_outlined),
            title: Text('Offline Library'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Settings'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
