class ExpertiseItem {
  const ExpertiseItem({
    required this.title,
    required this.description,
    required this.codeTag,
    required this.accentIndex,
  });

  final String title;
  final String description;
  final String codeTag;
  final int accentIndex;
}

class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.description,
    required this.techStack,
    required this.accentIndex,
    this.appStoreUrl,
    this.playStoreUrl,
  });

  final String title;
  final String subtitle;
  final String category;
  final String description;
  final List<String> techStack;
  final int accentIndex;
  final String? appStoreUrl;
  final String? playStoreUrl;
}

class ExperienceItem {
  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.badge,
    required this.responsibilities,
    this.isCurrent = false,
  });

  final String role;
  final String company;
  final String period;
  final String badge;
  final List<String> responsibilities;
  final bool isCurrent;
}

class TechColumn {
  const TechColumn({
    required this.header,
    required this.skills,
  });

  final String header;
  final List<String> skills;
}

class EducationItem {
  const EducationItem({
    required this.degree,
    required this.institution,
    required this.period,
    required this.badge,
    required this.note,
    this.isPrimary = false,
  });

  final String degree;
  final String institution;
  final String period;
  final String badge;
  final String note;
  final bool isPrimary;
}

abstract final class AppData {
  static const String fullName = 'Daniel Flores';
  static const String lastName = 'Ambrosio';
  static const String brandName = 'Daniel Flores Ambrosio';
  static const String title = 'Mobile Tech Lead | Especialista en Flutter';
  static const String location = 'Puebla, México • Disponible para Proyectos';
  static const String phone = '+52 222 366 8305';
  static const String phoneUrl = 'tel:+522223668305';
  static const String whatsappUrl = 'https://wa.me/522223668305';
  static const String heroDescription =
      'Mobile Tech Lead e Ingeniero de Software con más de 6 años de experiencia liderando '
      'la arquitectura, desarrollo y entrega de aplicaciones móviles a gran escala con Flutter '
      'para iOS y Android. Especialista en Clean Architecture, CI/CD automatizado y flujos asistidos por IA.';

  static const String email = 'sinfogamo.gaahl@gmail.com';
  static const String githubUrl = 'https://github.com/dflores91';
  static const String linkedinUrl = 'https://www.linkedin.com/in/daniel-flores-ambrosio/';

  static const List<ExpertiseItem> expertiseList = [
    ExpertiseItem(
      title: 'Clean Architecture',
      description:
          'Liderazgo técnico en definición de arquitecturas escalables (Feature-driven), '
          'monorepos y patrones de diseño desacoplados que garantizan alta mantenibilidad en producción.',
      codeTag: 'FEATURE_DRIVEN_CLEAN_ARCH',
      accentIndex: 0,
    ),
    ExpertiseItem(
      title: 'State Management & Core',
      description:
          'Especialista en BLoC / Cubit, Riverpod, Provider y Streams reactivos. '
          'Gestión de estados predecibles y pipelines de alto rendimiento para aplicaciones críticas.',
      codeTag: 'BLOC_RIVERPOD_STREAMS',
      accentIndex: 1,
    ),
    ExpertiseItem(
      title: 'Platform Channels & Hardware',
      description:
          'Integraciones nativas de bajo nivel con Kotlin y Swift. Experto en comunicación '
          'con hardware e IoT mediante Bluetooth Low Energy (BLE / GATT) y módulos de seguridad.',
      codeTag: 'BLE_GATT_NATIVE_CHANNELS',
      accentIndex: 2,
    ),
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: 'Kigo – Parkimovil',
      subtitle: 'Movilidad Inteligente & IoT',
      category: 'IOT & MOVILIDAD',
      description:
          'Ecosistema integral de movilidad urbana que digitaliza el acceso vehicular mediante Bluetooth (BLE), pago de parquímetros sin monedas y telepeaje para millones de conductores en México.',
      techStack: ['Flutter & Dart', 'BLE / GATT', 'Codemagic CI/CD', 'Clean Arch'],
      accentIndex: 0,
      appStoreUrl: 'https://apps.apple.com/mx/app/kigo-parkimovil/id954503274',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.parkimovil.app&pcampaignid=web_share',
    ),
    ProjectItem(
      title: 'Fondeadora',
      subtitle: 'Neobanco & Servicios Financieros',
      category: 'FINTECH',
      description:
          'Plataforma bancaria digital mexicana con cuenta de débito Mastercard, transferencias SPEI instantáneas 24/7, bóvedas de rendimiento, biometría nativa y control financiero sin fricción.',
      techStack: ['Flutter & Dart', 'BLoC Pattern', 'Platform Channels', 'Kotlin & Swift'],
      accentIndex: 2,
      appStoreUrl: 'https://apps.apple.com/mx/app/fondea-personal/id1438141144',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.fondeadora.bank&pcampaignid=web_share',
    ),
    ProjectItem(
      title: 'Trii',
      subtitle: 'Trading & Acceso Bursátil',
      category: 'TRADING & INVERSIONES',
      description:
          'Aplicación financiera que democratiza el acceso a la bolsa de valores en Colombia, Perú y Chile, facilitando compra y venta de acciones locales e internacionales con ejecución en tiempo real.',
      techStack: ['Flutter & Dart', 'Provider', 'Low-Latency REST', 'Streaming Charts'],
      accentIndex: 1,
      appStoreUrl: 'https://apps.apple.com/mx/app/trii/id1513826307',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.triico.app&pcampaignid=web_share',
    ),
  ];

  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      role: 'Mobile Tech Lead',
      company: 'Kigo – Parkimovil',
      period: 'Ene 2024 — Ago 2026 | Puebla, México',
      badge: 'LIDERAZGO',
      isCurrent: false,
      responsibilities: [
        'Liderazgo técnico del equipo móvil, definiendo la arquitectura base (Clean Architecture / Feature-driven) y garantizando calidad.',
        'Estándares técnicos para integraciones complejas de hardware e IoT mediante Bluetooth Low Energy (BLE / GATT) en iOS y Android.',
        'Diseño e implementación de CI/CD en Codemagic: pruebas unitarias automatizadas, análisis estático y releases multi-ambiente.',
        'Adopción de flujos asistidos por Inteligencia Artificial para acelerar componentes arquitectónicos, facades y generación de pruebas.',
        'Mentoría técnica a desarrolladores, code reviews y estrategia de testing automatizado con Mocktail y bloc_test.',
        'Alineación de iniciativas con Product Managers, diseñadores UI/UX y equipos Backend bajo Scrum.',
      ],
    ),
    ExperienceItem(
      role: 'Senior Flutter Developer',
      company: 'Fondeadora',
      period: 'May 2022 — Dic 2023 | CDMX, México (Remoto)',
      badge: 'SENIOR',
      responsibilities: [
        'Arquitectura y desarrollo de módulos core financieros utilizando BLoC para gestión de estado reactiva y predecible.',
        'Integraciones nativas avanzadas mediante Platform Channels en Kotlin y Swift para módulos críticos de seguridad.',
        'Supervisión y gestión del proceso de despliegues y aprobaciones en App Store Connect y Google Play Console.',
        'Colaboración clave en sprints Scrum, ejecutando refactorizaciones estratégicas y reduciendo deuda técnica.',
      ],
    ),
    ExperienceItem(
      role: 'Flutter Developer',
      company: 'Trii',
      period: 'May 2021 — May 2022 | Bogotá, Colombia (Remoto)',
      badge: 'DESARROLLADOR',
      responsibilities: [
        'Desarrollo y optimización de funcionalidades críticas para plataforma bursátil y transaccional con Provider y REST APIs.',
        'Optimización de UI/UX, reducción de latencia en renderizado de componentes y control de versiones con Git.',
        'Colaboración activa con equipos multidisciplinarios distribuidos en Latinoamérica orientados a objetivos.',
      ],
    ),
    ExperienceItem(
      role: 'Flutter Developer',
      company: 'Tulkit Pay',
      period: 'Mar 2019 — May 2021 | Lima, Perú (Remoto)',
      badge: 'DESARROLLADOR',
      responsibilities: [
        'Construcción de aplicaciones móviles Flutter desde fase inicial, estableciendo patrones de arquitectura y componentes reutilizables.',
        'Integración de pasarelas de pago y consumo seguro de servicios backend bajo Scrum.',
      ],
    ),
    ExperienceItem(
      role: 'Freelance & Sistemas / TI',
      company: 'Freelance & Holkan de México',
      period: '2013 — 2018 | Puebla, México',
      badge: 'PREVIO',
      responsibilities: [
        'Desarrollo de aplicaciones web y desktop con Laravel y C# (2015 – 2018).',
        'Encargado de Sistemas e infraestructura de TI en Holkan de México (2013 – 2015).',
      ],
    ),
  ];

  static const List<TechColumn> techColumns = [
    TechColumn(
      header: '01 // ARQUITECTURA & LEAD',
      skills: [
        'Clean Architecture',
        'Diseño de Sistemas Móviles',
        'Platform Channels',
        'Hardware BLE / GATT',
        'Code Reviews & Mentoría',
      ],
    ),
    TechColumn(
      header: '02 // MOBILE & ESTADO',
      skills: [
        'Flutter & Dart',
        'BLoC / Cubit',
        'Riverpod',
        'Provider',
        'Android (Kotlin) / iOS (Swift)',
      ],
    ),
    TechColumn(
      header: '03 // CI/CD & DEVOPS',
      skills: [
        'Pipelines en Codemagic',
        'App Store Connect',
        'Google Play Console',
        'FVM & Flavors',
        'Flujos de Git',
      ],
    ),
    TechColumn(
      header: '04 // DATOS & CALIDAD',
      skills: [
        'Mocktail & bloc_test',
        'Pruebas Unitarias & Integración',
        'Dio & REST APIs',
        'Drift (SQLite) & PowerSync',
        'Freezed & Dartz',
      ],
    ),
    TechColumn(
      header: '05 // IA & AGILE',
      skills: [
        'Flujos Asistidos por IA',
        'Metodología Scrum & Agile',
        'Alineación con Stakeholders',
        'Entrega de Producto',
      ],
    ),
  ];

  static const List<EducationItem> educationList = [
    EducationItem(
      degree: 'Ingeniería en Tecnologías de la Información',
      institution: 'Benemérita Universidad Autónoma de Puebla (BUAP)',
      period: '2013 — 2021',
      badge: 'Cédula: 13225130',
      note: 'Cédula Profesional: 13225130 • Titulado con Mención',
      isPrimary: true,
    ),
    EducationItem(
      degree: 'Técnico Superior Universitario',
      institution: 'Universidad Tecnológica de Puebla (UTP)',
      period: '2009 — 2012',
      badge: 'Graduado',
      note: 'Especialidad en Tecnologías de la Información',
      isPrimary: false,
    ),
    EducationItem(
      degree: 'Cursos & Certificaciones',
      institution: 'Huawei University',
      period: 'Educación Continua',
      badge: 'Certificado',
      note: 'Huawei University Open Courses',
      isPrimary: false,
    ),
  ];
}
