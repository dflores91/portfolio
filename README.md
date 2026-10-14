# 🚀 Daniel Flores Ambrosio — Portfolio Web

> **Portafolio profesional interactivo desarrollado en Flutter Web**, diseñado con arquitectura limpia (Feature-Driven), gestión de estado reactiva con BLoC y una estética moderna inspirada en herramientas de desarrollo e ingeniería de software.

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Feature--Driven%20Clean%20Arch-4EBA6F?style=for-the-badge)](https://bloclibrary.dev)
[![State Management](https://img.shields.io/badge/State-BLoC%20%2F%20Cubit-blueviolet?style=for-the-badge)](https://pub.dev/packages/flutter_bloc)
[![Platform](https://img.shields.io/badge/Platform-Web%20%2F%20Responsive-orange?style=for-the-badge)](https://flutter.dev/multi-platform/web)

---

## 📌 Tabla de Contenidos

- [Sobre el Proyecto](#-sobre-el-proyecto)
- [Características Principales](#-características-principales)
- [Arquitectura y Estructura](#-arquitectura-y-estructura)
- [Tech Stack y Dependencias](#-tech-stack-y-dependencias)
- [Instalación y Ejecución Local](#-instalación-y-ejecución-local)
- [Pruebas Automatizadas](#-pruebas-automatizadas)
- [Build y Despliegue](#-build-y-despliegue)
- [Contacto](#-contacto)

---

## 💡 Sobre el Proyecto

Este repositorio contiene el código fuente del portafolio personal de **Daniel Flores Ambrosio**, Mobile Tech Lead & Especialista en Flutter. 

El objetivo principal es demostrar habilidades avanzadas en:
- Construcción de aplicaciones **Flutter Web de alto rendimiento**.
- Implementación de **Clean Architecture** modular y desacoplada orientada a features.
- Diseño responsivo adaptativo sin depender de frameworks CSS externos, controlando el ciclo de vida del layout en Flutter.
- Gestión de estado predecible mediante **BLoC / Cubit**.

---

## ✨ Características Principales

- 📱 **Diseño 100% Responsivo:** Soporte fluido para resoluciones Mobile (`< 768px`), Tablet (`768px — 1024px`) y Desktop (`>= 1024px`) a través de `ResponsiveLayout`.
- 💻 **Interactive IDE Mockup:** Simulación de entorno de desarrollo (VS Code / Android Studio) en la sección Hero con pestañas dinámicas y código Dart con syntax highlight temático.
- 🎯 **Navegación Sincronizada con Scroll:** Barra de navegación persistente con detección en tiempo real de la sección activa mediante `ScrollController` y `GlobalKey`.
- 🎨 **Dark Theme & Estética Tech:** Paleta de colores HSL personalizada en tonos oscuros (cyberpunk/modern terminal), microinteracciones y tipografía moderna con `GoogleFonts.firaCode` e `Inter`.
- 🌐 **Rutas Web Limpias:** Integración de `usePathUrlStrategy()` eliminando el hash (`#`) de las URLs del navegador.
- ⚡ **Testing Multi-Viewport:** Suite de pruebas en `test/widget_test.dart` que valida ausencia de overflow en múltiples tamaños de pantalla móviles (`320x568`, `375x812`, `390x844`, `414x896`).

---

## 🏗 Arquitectura y Estructura

El proyecto sigue una estructura **Feature-First (Feature-Driven Development)** desacoplada, facilitando el mantenimiento, la escalabilidad y las pruebas unitarias:

```text
lib/
├── core/
│   ├── constants/        # Información profesional estática (AppData) y modelos de dominio
│   ├── theme/            # Tokens de diseño, paleta de colores (AppColors) y ThemeData
│   └── utils/            # Utilidades de layout responsivo (ResponsiveLayout) y helpers
├── features/
│   ├── contact/          # Sección de contacto, enlaces y llamadas a la acción
│   ├── education/        # Formación académica y certificaciones profesionales
│   ├── expertise/        # Pilares técnicos principales (Clean Arch, BLoC, BLE/IoT)
│   ├── hero/             # Header principal con presentación y mockup del IDE
│   ├── journey/          # Línea de tiempo de trayectoria laboral y roles senior
│   ├── navigation/       # Cubit de navegación y barra de navegación adaptativa
│   ├── portfolio/        # Ensamblador de la página principal (PortfolioPage)
│   ├── projects/         # Showcase de proyectos en producción (Kigo, Fondeadora, Trii)
│   └── skills/           # Matriz técnica clasificada por columnas de especialidad
├── shared/               # Widgets y componentes visuales reutilizables
└── main.dart             # Punto de entrada de la aplicación y configuración de proveedores
```

---

## 🛠 Tech Stack y Dependencias

| Tecnología | Propósito |
| :--- | :--- |
| **Flutter SDK** (`^3.13.5`+) | Framework multiplataforma de interfaz de usuario |
| **Dart** | Lenguaje tipado con soporte estricto de Sound Null Safety |
| **flutter_bloc** (`^9.1.1`) | Gestión de estado reactiva y predecible para navegación |
| **google_fonts** (`^6.2.1`) | Tipografía moderna optimizada para web |
| **url_launcher** (`^6.3.3`) | Lanzamiento de enlaces externos (GitHub, LinkedIn, WhatsApp, stores) |
| **font_awesome_flutter** (`^11.0.0`) | Iconografía vectorial técnica y redes sociales |
| **flutter_lints** (`^6.0.0`) | Reglas de análisis estático recomendadas por el equipo de Dart/Flutter |

---

## 🚀 Instalación y Ejecución Local

### Prerrequisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versión 3.13 o superior, compatible con Flutter 3.29+)
- Google Chrome o cualquier navegador moderno
- Git

### Pasos

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/dflores91/portfolio.git
   cd portfolio
   ```

2. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

3. **Ejecutar en modo desarrollo:**
   ```bash
   flutter run -d chrome
   ```

---

## 🧪 Pruebas Automatizadas

El proyecto incluye pruebas de widgets para verificar el renderizado en múltiples densidades y resoluciones de pantalla sin excepciones de layout (`RenderFlex overflow`):

```bash
flutter test
```

Para ejecutar el análisis estático de código:

```bash
dart analyze
```

---

## 📦 Build y Despliegue

Para compilar la versión optimizada de producción para Flutter Web:

```bash
flutter build web --release --base-href "/"
```

Los artefactos generados se ubicarán en `build/web/`, listos para ser desplegados en plataformas como **Firebase Hosting**, **GitHub Pages**, **Vercel** o **Cloudflare Pages**.

---

## 📬 Contacto

- **Nombre:** Daniel Flores Ambrosio
- **Rol:** Mobile Tech Lead | Especialista en Flutter
- **LinkedIn:** [linkedin.com/in/daniel-flores-ambrosio](https://www.linkedin.com/in/daniel-flores-ambrosio/)
- **GitHub:** [@dflores91](https://github.com/dflores91)
- **Ubicación:** Puebla, México
