# 🖥️ Instalación de Node Exporter

## 📝 Descripción General

Node Exporter es un componente crucial en el ecosistema Prometheus que permite recopilar métricas detalladas sobre el rendimiento y estado de los sistemas Linux.

## 🔍 Características Principales

- Métricas de sistema en tiempo real
- Bajo consumo de recursos
- Fácil integración con Prometheus
- Soporte para múltiples métricas de sistema

## 💻 Requisitos Previos

- Sistema Linux
- Prometheus instalado
- Permisos de administrador
- Conexión a Internet
- Curl instalado

## 🛠️ Proceso de Instalación

### 1. Crear Usuario Dedicado

```bash
# Crear usuario sin directorio home
sudo useradd --no-create-home --shell /bin/false node_exporter
```

### 2. Descargar Node Exporter

```bash
# Descargar última versión
curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz

# Descomprimir
tar xvf node_exporter-1.1.2.linux-amd64.tar.gz

# Copiar binario
sudo cp node_exporter-1.1.2.linux-amd64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Limpiar archivos de instalación
rm -rf node_exporter-1.1.2.linux-amd64.tar.gz node_exporter-1.1.2.linux-amd64
```

### 3. Configurar Servicio Systemd

```bash
# Crear archivo de servicio
sudo nano /etc/systemd/system/node_exporter.service
```

Contenido del archivo de servicio:
```ini
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```

### 4. Iniciar y Habilitar Servicio

```bash
# Recargar systemd
sudo systemctl daemon-reload

# Iniciar servicio
sudo systemctl start node_exporter

# Verificar estado
sudo systemctl status node_exporter

# Habilitar inicio automático
sudo systemctl enable node_exporter
```

## 🔗 Configuración en Prometheus

### Editar Configuración de Prometheus

```bash
# Abrir archivo de configuración
sudo nano /etc/prometheus/prometheus.yml
```

Añadir configuración de Node Exporter:
```yaml
scrape_configs:
  - job_name: 'node_exporter'
    scrape_interval: 5s
    scrape_timeout: 4s
    static_configs:
      - targets: ['192.168.1.166:9100']
```

### Reiniciar Servicio Prometheus

```bash
sudo systemctl restart prometheus
sudo systemctl status prometheus
```

## 🌐 Verificación

- Métricas disponibles en: `http://localhost:9100/metrics`
- Accesible mediante navegador web
- Muestra métricas detalladas del sistema


## 🔍 Métricas Principales

- Uso de CPU
- Memoria RAM
- Uso de disco
- Tráfico de red
- Temperatura del sistema
- Carga del sistema


## 📚 Referencias

- Documentación oficial de Prometheus
- Repositorio de Node Exporter
- Guías de configuración avanzada