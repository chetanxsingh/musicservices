import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/music_service_viewmodel.dart';
import '../widget/service_card.dart';
import 'service_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MusicServiceViewModel>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD81B60), // pink.shade600
              Color(0xFFAD1457), // pink.shade800
              Color(0xFF880E4F)
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              _buildFreeDemo(),
              Expanded(
                child: _buildServicesSection(viewModel, context),
              ),
              _buildBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 16),
                  Icon(Icons.search, color: Colors.grey, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Search "Punjabi Lyrics"',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.grey, size: 20),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_2_outlined,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFreeDemo() {
    return SizedBox(
      height: 250,
      child: OverflowBox(
        maxWidth: 470,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/freedemo.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            // Book Now Button positioned above the existing text
            Positioned(
              bottom: 45, // Adjust this value to position above the existing "Book Now" text
              child: ElevatedButton(
                onPressed: () {
                  // Add your booking functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button color
                  foregroundColor: Colors.black, // Text color
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'BOOK NOW',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildServicesSection(MusicServiceViewModel viewModel, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Hire hand-picked Pros for popular music services',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Expanded(
            child: _buildServicesList(viewModel, context),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesList(MusicServiceViewModel viewModel, BuildContext context) {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }

    if (viewModel.error.isNotEmpty) {
      return Center(
        child: Text(
          'Error: ${viewModel.error}',
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    if (viewModel.services.isEmpty) {
      return const Center(
        child: Text(
          'No services available',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: viewModel.services.length,
      itemBuilder: (context, index) {
        final service = viewModel.services[index];
        return _buildServiceTile(service, context);
      },
    );
  }
  Widget _buildServiceTile(dynamic service, BuildContext context) {
    return SizedBox(  // Added SizedBox here
      height: 100,  // Set a fixed height for the tile
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDetailScreen(service: service),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(_getServiceBackground(service.title)),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
            ),
          ),
          child: Row(
            children: [
              // Service Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _getServiceColor(service.title),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getServiceIcon(service.title),
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              // Service Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      service.title ?? 'Service',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service.description ?? 'Service description',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow Icon
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[200],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Color _getServiceColor(String? title) {
    switch (title?.toLowerCase()) {
      case 'music production':
        return Colors.red;
      case 'mixing & mastering':
        return Colors.blue;
      case 'lyrics writing':
        return Colors.orange;
      case 'vocals':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  IconData _getServiceIcon(String? title) {
    switch (title?.toLowerCase()) {
      case 'music production':
        return Icons.equalizer;
      case 'mixing & mastering':
        return Icons.tune;
      case 'lyrics writing':
        return Icons.edit;
      case 'vocals':
        return Icons.mic;
      default:
        return Icons.music_note;
    }
  }
// Add this new method to get different backgrounds for each service
  String _getServiceBackground(String? title) {
    switch (title?.toLowerCase()) {
      case 'music production':
        return 'assets/listbg1.png';
      case 'mixing & mastering':
        return 'assets/listbg2.png';
      case 'lyrics writing':
        return 'assets/listbg3.png';
      case 'vocals':
        return 'assets/listbg4.png';
      default:
        return 'assets/listbg1.png';
    }
  }


  Widget _buildBottomNavBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
        top: BorderSide(
        color: Colors.grey[800]!,
        width: 0.5,
    ),),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem('assets/Home.png', 'Home', true),
            _buildNavItem('assets/Vector.png', 'News', false),
            _buildNavItem('assets/Music.png', 'TrackBox', false),
            _buildNavItem('assets/Union.png', 'Projects', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String assetPath, String label, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                assetPath,
                width: 24,
                height: 24,
                color: isSelected ? Colors.white : Colors.grey[600],
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[600],
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            if (isSelected)
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
