# 💽 Comando fdisk: Gestión de Particiones de Disco

## 📝 Descripción
`fdisk` es una herramienta de línea de comandos para administrar particiones de discos, permitiendo crear, modificar y eliminar particiones.

## 🔍 Opciones Principales

| Opción | Descripción | Ejemplo |
|--------|-------------|---------|
| `-l` | Listar particiones | `fdisk -l` |
| `-u` | Mostrar en sectores | `fdisk -u /dev/sda` |
| `-p` | Tabla procesable | `fdisk -p` |
| `-n` | Nueva partición | `fdisk /dev/sdb` |
| `-d` | Eliminar partición | `fdisk /dev/sdc` |
| `-t` | Cambiar tipo | `fdisk /dev/sdd` |
| `-w` | Guardar cambios | `fdisk -w` |
| `-q` | Salir sin guardar | `fdisk -q` |

## ⚠️ Precauciones
- Usar con cuidado, riesgo de pérdida de datos
- Realizar respaldo antes de modificar particiones
- Requiere permisos de administrador (root)

## 💻 Ejemplos Prácticos

```bash
# Listar particiones
sudo fdisk -l

# Iniciar fdisk para un disco
sudo fdisk /dev/sdb

# Comandos interactivos dentro de fdisk:
# n: nueva partición
# d: eliminar partición
# w: guardar cambios
# q: salir sin guardar
```

## 💡 Consejos Rápidos
- Use herramientas como `parted` para discos GPT
- Siempre haga respaldo antes de modificar
- Verifique cambios con `lsblk` o `blkid`