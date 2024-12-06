# 🔍 Comando lsof: Listado de Archivos Abiertos

## 📝 Descripción
`lsof` (List Open Files) proporciona información detallada sobre archivos abiertos por procesos, incluyendo archivos de red, dispositivos y más.

## 🔍 Opciones Principales

| Opción | Descripción | Ejemplo |
|--------|-------------|---------|
| `-i` | Conexiones de red | `lsof -i` |
| `-u` | Filtrar por usuario | `lsof -u nombreusuario` |
| `-p` | Filtrar por PID | `lsof -p 1234` |
| `-c` | Filtrar por comando | `lsof -c firefox` |

## 💻 Ejemplos Prácticos

```bash
# Todos los archivos abiertos
lsof

# Conexiones de red abiertas
lsof -i

# Archivos abiertos por un usuario
lsof -u root

# Procesos escuchando en puertos
lsof -i :80
```

## 💡 Consejos Rápidos
- Identifica procesos usando archivos/puertos
- Útil para solucionar bloqueos de archivos
- Detecta conexiones de red activas
- Ayuda en troubleshooting de sistemas