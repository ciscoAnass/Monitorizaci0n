# 🚀 Instalación de Prometheus en GNU/Linux

## 📝 Descripción del Proyecto

Prometheus es una herramienta de monitoreo de código abierto diseñada para recopilar, almacenar y analizar métricas en tiempo real de sistemas y servicios distribuidos. Ideal para entornos de contenedores y infraestructuras complejas.

## 🔍 Características Principales

- Recopilación de métricas en tiempo real
- Sistema de alertas configurable
- Alta escalabilidad
- Soporte para múltiples sistemas y servicios
- Interfaz web intuitiva

## 💻 Requisitos Previos

- Sistema operativo Linux (Debian/Ubuntu)
- Permisos de administrador (sudo)
- Conexión a Internet
- Curl instalado

## 🛠️ Pasos de Instalación

### 1. Configuración de Usuario y Directorios

```bash
# Crear usuario sin directorio home
sudo useradd --no-create-home --shell /bin/false prometheus

# Crear directorios necesarios
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

# Establecer permisos
sudo chown prometheus:prometheus /etc/prometheus/
sudo chown prometheus:prometheus /var/lib/prometheus/
```

### 2. Descarga e Instalación de Prometheus

```bash
# Instalar curl si no está disponible
sudo apt install curl

# Descargar Prometheus
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.48.0/prometheus-2.48.0.linux-amd64.tar.gz

# Descomprimir
tar xvf prometheus-2.48.0.linux-amd64.tar.gz

# Copiar binarios
sudo cp prometheus-2.48.0.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-2.48.0.linux-amd64/promtool /usr/local/bin/

# Establecer permisos
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
```

### 3. Configuración de Prometheus

```bash
# Copiar archivos de configuración
sudo cp -r prometheus-2.48.0.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-2.48.0.linux-amd64/console_libraries /etc/prometheus

# Configurar permisos
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries

# Limpiar archivos de instalación
rm -rf prometheus-2.48.0.linux-amd64.tar.gz prometheus-2.48.0.linux-amd64
```

### 4. Configuración del Archivo de Configuración

```yaml
# Contenido de /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s
scrape_configs:
  - job_name: "prometheus"
    scrape_interval: 5s
    static_configs:
    - targets: ['localhost:9090']
```

### 5. Crear Servicio Systemd

```bash
# Crear archivo de servicio
sudo nano /etc/systemd/system/prometheus.service

# Contenido del servicio
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
--config.file /etc/prometheus/prometheus.yml \
--storage.tsdb.path /var/lib/prometheus/ \
--web.console.templates=/etc/prometheus/consoles \
--web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
```

### 6. Iniciar y Habilitar Servicio

```bash
# Recargar systemd
sudo systemctl daemon-reload

# Iniciar servicio
sudo systemctl start prometheus

# Verificar estado
sudo systemctl status prometheus

# Habilitar inicio automático
sudo systemctl enable prometheus
```

## 🔗 Referencias Adicionales

- Documentación oficial de Prometheus
- Guías de configuración avanzada
- Comunidad y soporte en línea