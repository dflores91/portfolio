import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/features/contact/presentation/contact_section.dart';
import 'package:portfolio/features/education/presentation/education_section.dart';
import 'package:portfolio/features/expertise/presentation/expertise_section.dart';
import 'package:portfolio/features/hero/presentation/hero_section.dart';
import 'package:portfolio/features/journey/presentation/journey_section.dart';
import 'package:portfolio/features/navigation/cubit/navigation_cubit.dart';
import 'package:portfolio/features/navigation/widgets/nav_bar.dart';
import 'package:portfolio/features/projects/presentation/projects_section.dart';
import 'package:portfolio/features/skills/presentation/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _expertiseKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key, NavigationSection section) {
    context.read<NavigationCubit>().setSection(section);
    final BuildContext? targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _onSectionSelected(NavigationSection section) {
    switch (section) {
      case NavigationSection.about:
        _scrollTo(_aboutKey, section);
      case NavigationSection.expertise:
        _scrollTo(_expertiseKey, section);
      case NavigationSection.projects:
        _scrollTo(_projectsKey, section);
      case NavigationSection.journey:
        _scrollTo(_journeyKey, section);
      case NavigationSection.skills:
        _scrollTo(_skillsKey, section);
      case NavigationSection.education:
        _scrollTo(_educationKey, section);
      case NavigationSection.contact:
        _scrollTo(_contactKey, section);
    }
  }

  void _scrollToTop() {
    context.read<NavigationCubit>().setSection(NavigationSection.about);
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          _buildBackgroundAura(),
          Column(
            children: [
              NavBar(onSectionTap: _onSectionSelected),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Container(
                        key: _aboutKey,
                        child: HeroSection(
                          onProjectsTap: () =>
                              _onSectionSelected(NavigationSection.projects),
                          onContactTap: () =>
                              _onSectionSelected(NavigationSection.contact),
                        ),
                      ),
                      Container(
                        key: _expertiseKey,
                        child: const ExpertiseSection(),
                      ),
                      Container(
                        key: _projectsKey,
                        child: const ProjectsSection(),
                      ),
                      Container(
                        key: _journeyKey,
                        child: const JourneySection(),
                      ),
                      Container(
                        key: _skillsKey,
                        child: const SkillsSection(),
                      ),
                      Container(
                        key: _educationKey,
                        child: const EducationSection(),
                      ),
                      Container(
                        key: _contactKey,
                        child: ContactSection(
                          onScrollToTop: _scrollToTop,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundAura() {
    return Positioned(
      top: -120,
      left: -120,
      child: IgnorePointer(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                AppColors.primary.withValues(alpha: 0.1),
                AppColors.secondary.withValues(alpha: 0.05),
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
