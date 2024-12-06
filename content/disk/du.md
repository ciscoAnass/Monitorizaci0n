# 💾 Comando du: Análisis de Uso de Disco

## 📝 Descripción
`du` (disk usage) muestra el espacio ocupado por directorios y archivos, ayudando a identificar consumidores de espacio.

## 🔍 Opciones Principales

| Opción | Descripción | Ejemplo |
|--------|-------------|---------|
| `-h` | Formato legible | `du -h` |
| `-s` | Total por directorio | `du -s *` |
| `-c` | Total acumulado | `du -c` |
| `-k` | Tamaño en kilobytes | `du -k` |

## 💻 Ejemplos Prácticos

```bash
# Espacio por directorio (legible)
du -h

# Top 5 directorios más grandes
du -h | sort -rh | head -5

# Total de un directorio específico
du -sh /home/usuario
```

## 💡 Consejos Rápidos
- Use `-h` para lecturas claras
- Combine con `sort` para identificar directorios grandes
- Útil para limpiar espacio en disco