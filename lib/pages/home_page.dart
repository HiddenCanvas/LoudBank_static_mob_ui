import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildTopBar(),
              const SizedBox(height: 24),
              _buildBalanceSection(),
              const SizedBox(height: 20),
              _buildCardsRow(),
              const SizedBox(height: 28),
              _buildFinanceSection(context),
              const SizedBox(height: 28),
              _buildCurrentLoans(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF8B6914),
            border: Border.all(color: const Color(0xFFD4A017), width: 2),
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 20),
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Lou',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'Bank',
                style: TextStyle(
                  color: Color(0xFFD4E157),
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.search, color: Colors.white70, size: 18),
        ),
      ],
    );
  }

  Widget _buildBalanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your balance',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '\$ 7,896',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildCardsRow() {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCard(
            background: const Color(0xFFD4F5E9),
            label: 'VISA',
            subtitle: 'Salary',
            amount: '\$ 2,230',
            last4: '** 6917',
          ),
          const SizedBox(width: 12),
          _buildCard(
            background: const Color(0xFFF5F5A0),
            label: 'VISA',
            subtitle: 'Savings account',
            amount: '\$ 5,566',
            last4: '** 4552',
          ),
          const SizedBox(width: 12),
          _buildCard(
            background: const Color(0xFFE8D5F5),
            label: 'VISA',
            subtitle: 'Investment',
            amount: '\$ 100',
            last4: '** 7821',
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required Color background,
    required String label,
    required String subtitle,
    required String amount,
    required String last4,
  }) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontWeight: FontWeight.w700,
              fontSize: 14,
              letterSpacing: 2,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFF555555), fontSize: 12),
              ),
              const SizedBox(height: 2),
              Text(
                amount,
                style: const TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text(
            last4,
            style: const TextStyle(color: Color(0xFF666666), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildFinanceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'FINANCE',
          style: TextStyle(
            color: Colors.white38,
            fontSize: 11,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            _buildFinanceItem(
              icon: Icons.star_border_rounded,
              label: 'My bonuses',
              color: const Color(0xFFD4E157),
              onTap: () {},
            ),
            const SizedBox(width: 12),
            _buildFinanceItem(
              icon: Icons.account_balance_wallet_outlined,
              label: 'My budget',
              color: const Color(0xFF80DEEA),
              onTap: () => Navigator.pushNamed(context, '/budget'),
            ),
            const SizedBox(width: 12),
            _buildFinanceItem(
              icon: Icons.bar_chart_rounded,
              label: 'Finance analysis',
              color: const Color(0xFFCE93D8),
              onTap: () => Navigator.pushNamed(context, '/analysis'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFinanceItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentLoans() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.keyboard_arrow_down, color: Colors.white54, size: 18),
                SizedBox(width: 6),
                Text(
                  'CURRENT LOANS',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.add, color: Colors.white54, size: 16),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF383838),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.credit_card_outlined,
                  color: Colors.white54,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Account № 3874825',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Expires 12/22/2023',
                      style: TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '\$ 78,92',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Rate 3.5%',
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFF2C2C2C),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 65,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xFFD4E157),
                  ),
                ),
              ),
              const Expanded(flex: 35, child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    final icons = [
      Icons.home_rounded,
      Icons.shopping_bag_outlined,
      Icons.credit_card_outlined,
      Icons.chat_bubble_outline_rounded,
      Icons.access_time_rounded,
    ];

    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFF222222),
        border: Border(top: BorderSide(color: Color(0xFF333333), width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (i) {
          final isSelected = i == _selectedIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = i),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFD4E157).withOpacity(0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icons[i],
                color: isSelected ? const Color(0xFFD4E157) : Colors.white38,
                size: 22,
              ),
            ),
          );
        }),
      ),
    );
  }
}
