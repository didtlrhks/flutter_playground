import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/line-chart',
      builder: (context, state) => const LineChartScreen(),
    ),
    GoRoute(
      path: '/bar-chart',
      builder: (context, state) => const BarChartScreen(),
    ),
    GoRoute(
      path: '/pie-chart',
      builder: (context, state) => const PieChartScreen(),
    ),
    GoRoute(
      path: '/scatter-chart',
      builder: (context, state) => const ScatterChartScreen(),
    ),
    GoRoute(
      path: '/radar-chart',
      builder: (context, state) => const RadarChartScreen(),
    ),
  ],
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FL Chart Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildChartButton(context, title: 'Line Chart', route: '/line-chart'),
          const SizedBox(height: 12),
          _buildChartButton(context, title: 'Bar Chart', route: '/bar-chart'),
          const SizedBox(height: 12),
          _buildChartButton(context, title: 'Pie Chart', route: '/pie-chart'),
          const SizedBox(height: 12),
          _buildChartButton(context,
              title: 'Scatter Chart', route: '/scatter-chart'),
          const SizedBox(height: 12),
          _buildChartButton(context,
              title: 'Radar Chart', route: '/radar-chart'),
        ],
      ),
    );
  }

  Widget _buildChartButton(
    BuildContext context, {
    required String title,
    required String route,
  }) {
    return ElevatedButton(
      onPressed: () => context.go(route),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(title),
      ),
    );
  }
}

class BarChartScreen extends StatelessWidget {
  const BarChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart'),
      ),
      body: const Center(
        child: Text('Bar Chart Implementation Coming Soon'),
      ),
    );
  }
}

class LineChartScreen extends StatelessWidget {
  const LineChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart'),
      ),
      body: const Center(
        child: Text('Line Chart Implementation Coming Soon'),
      ),
    );
  }
}

class PieChartScreen extends StatelessWidget {
  const PieChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart'),
      ),
      body: const Center(
        child: Text('Pie Chart Implementation Coming Soon'),
      ),
    );
  }
}

class ScatterChartScreen extends StatelessWidget {
  const ScatterChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scatter Chart'),
      ),
      body: const Center(
        child: Text('Scatter Chart Implementation Coming Soon'),
      ),
    );
  }
}

class RadarChartScreen extends StatelessWidget {
  const RadarChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radar Chart'),
      ),
      body: const Center(
        child: Text('Radar Chart Implementation Coming Soon'),
      ),
    );
  }
}
