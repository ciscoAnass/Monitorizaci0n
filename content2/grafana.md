# 📊 Grafana: Visualización y Monitoreo de Datos

## 📝 Descripción
Grafana es una plataforma de código abierto líder para visualización y análisis de métricas, permitiendo la creación de dashboards interactivos y dinámicos para monitoreo de sistemas y aplicaciones.

## 🔍 Componentes Principales
| Componente | Descripción | Funcionalidad |
|------------|-------------|---------------|
| Dashboards | Paneles de visualización | Representación gráfica de datos |
| Datasources | Fuentes de datos | Conexión a bases de datos y sistemas |
| Paneles | Elementos individuales de visualización | Gráficos, tablas, alertas |
| Plugins | Extensiones | Añadir funcionalidades personalizadas |

## 💻 Proceso de Instalación

### Instalar dependencias de Grafana:
```bash
sudo apt install -y apt-transport-https
sudo apt install -y software-properties-common wget
```

### Configurar repositorio de Grafana:
```bash
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update
```

### Instalar Grafana:
```bash
sudo apt install grafana
```

### Gestionar servicio Grafana:
```bash
sudo systemctl daemon-reload
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
sudo systemctl status grafana-server
```

## 🔐 Acceso y Configuración
- Credenciales por defecto: `admin/admin`
- Cambiar contraseña inmediatamente después del primer inicio de sesión
- Configurar fuentes de datos externas
- Personalizar dashboards según necesidades


## 🔧 Requisitos del Sistema
- Sistema operativo Linux (preferiblemente Ubuntu/Debian)
- Mínimo 1 GB de RAM
- Conexión a internet para instalación de plugins
- Navegador web moderno