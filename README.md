🐾 NekoBox iOS

Minimal iOS client for sing-box / NB4A architecture
Мобильный клиент для sing-box / NB4A на iOS

⸻

🇷🇺 Описание

NekoBox iOS (MVP) — это минималистичное iOS-приложение на базе sing-box с поддержкой расширения VPN.
Проект написан на Swift и предназначен для экспериментов с туннелями, логированием и системами маршрутизации.

⸻

🧩 Возможности
 • 📦 Полностью типизированная модель маршрутов (RouteModel.swift)
 • ⚙️ Менеджер конфигураций ConfigManager.swift (чтение/запись config.json)
 • 🪵 Структурированное логирование NB4ALogger.swift на базе os.log
 • 🧠 Простая интеграция с PacketTunnelProvider
 • 🧾 Пример готовой конфигурации (config.json)
 • 🔒 Поддержка App Group для шаринга данных между приложением и VPN Extension
 ⚙️ Требования
Xcode - 16.0+
Swift - 5.9+
iOS - 18.0+
VPN Extension - PacketTunnelProvider
Структура проекта
NekoBox-iOS/
│
├── NekoBox/
│   ├── Logger/
│   │   └── NB4ALogger.swift
│   ├── Models/
│   │   └── RouteModel.swift
│   ├── Managers/
│   │   └── ConfigManager.swift
│   ├── Resources/
│   │   └── config.json
│   └── Info.plist
│
├── NekoBoxTunnel/
│   └── PacketTunnelProvider.swift
│
└── README.md
🚀 Запуск проекта
 1. Открой проект в Xcode 16+
 2. Выбери схему NekoBox
 3. Установи профиль разработчика и включи VPN-права
 4. Запусти на реальном устройстве (Simulator не поддерживает VPN-туннели)

⸻

⚠️ Ограничения версии MVP
 • Нет пользовательского интерфейса (UI)
 • Подписки (Clash, SingBox, Hysteria2) пока не импортируются
 • Узлы заданы статически
 • Конфигурация не сохраняется между сессиями

⸻

🛠 План развития
 • Поддержка импорта .json, .yaml, .link подписок
 • Интерфейс на SwiftUI
 • Управление VPN-сессией в реальном времени
 • Локализация (EN / ZH / RU)

⸻

📲 Установка

🧪 Через TestFlight (в будущем)

Ссылка появится после публикации первого билда на TestFlight.

🛠 Ручная установка
 1. Склонируй проект:
git clone https://github.com/beatzip/NekoBox-iOS.git
2. Открой NekoBox-iOS.xcodeproj в Xcode
 3. Настрой App Group и Provisioning Profile
 4. Запусти на iPhone

⸻

⚖️ Лицензия

Проект распространяется под лицензией MIT.

MIT License

Copyright (c) 2025 beatzip

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
[... полный текст MIT ...]
