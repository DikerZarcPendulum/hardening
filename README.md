# README - Script de Hardening para CentOS y Ubuntu

## Descripción
Este script tiene como objetivo mejorar la seguridad en sistemas operativos CentOS y Ubuntu mediante la instalación y configuración del antivirus ClamAV,
la instalación de paquetes EPEL (en CentOS 7) y la actualización del sistema.

## Requisitos
- Sistema operativo basado en **CentOS** o **Ubuntu**.
- Privilegios de **superusuario (sudo)**.
- Conexión a Internet para la instalación de paquetes y actualizaciones.

## Funcionalidad
1. **Verificación de la versión del sistema operativo**:
   - Obtiene y muestra la versión de CentOS y Ubuntu instalada en la máquina.

2. **Manejo del antivirus ClamAV**:
   - Comprueba si ClamAV está instalado.
   - Si está instalado, lo actualiza y reinicia el servicio.
   - Si no está instalado, lo instala y configura correctamente.

3. **Instalación de paquetes EPEL (solo en CentOS 7)**:
   - Descarga e instala los paquetes EPEL si el sistema operativo es CentOS 7.
   - Verifica la instalación en la lista de repositorios.

4. **Actualización del sistema**:
   - Verifica las actualizaciones pendientes.
   - Instala las actualizaciones necesarias.
   - Recomienda reiniciar la máquina.

## Uso
Para ejecutar el script, usa el siguiente comando en la terminal:
```bash
sudo bash Diego\ Ibarra-hardening.sh
```
> **Nota**: Es importante ejecutar el script con permisos de superusuario (sudo) para realizar cambios en el sistema.

## Advertencias
- Este script realiza cambios en el sistema, por lo que se recomienda ejecutarlo en un entorno de prueba antes de implementarlo en producción.
- Asegúrese de contar con una copia de seguridad del sistema antes de ejecutarlo.
