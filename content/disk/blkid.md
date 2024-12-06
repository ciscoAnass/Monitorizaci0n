# 💾 Comando blkid: Identificación de Dispositivos de Bloque

## 📝 Descripción
`blkid` proporciona información detallada sobre dispositivos de almacenamiento, incluyendo UUID, tipo de sistema de archivos y atributos de particiones.

## 🔍 Opciones Principales

| Opción | Descripción | Ejemplo |
|--------|-------------|---------|
| `-o` | Formato de salida | `blkid -o list` |
| `-p` | Evitar escaneo de particiones | `blkid -p` |

## 💻 Ejemplos Prácticos

```bash
# Información básica de dispositivos
blkid

# Formato de lista detallada
blkid -o list

# Solo valores
blkid -o value

# Información completa
blkid -o full
```

## 💡 Consejos Rápidos
- Identifica dispositivos de almacenamiento
- Consulta UUID y tipos de sistemas de archivos
- Útil para configuraciones de montaje
- Ayuda en troubleshooting de almacenamiento