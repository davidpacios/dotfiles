
# Multimonitor support

from libqtile.config import Screen
from libqtile import bar
from libqtile.log_utils import logger
from .widgets import primary_widgets, secondary_widgets
import subprocess


def status_bar(widgets):
    return bar.Bar(widgets, 28, opacity=0.9)


screens = [Screen(top=status_bar(primary_widgets), wallpaper='a.jpg',
        wallpaper_mode='fill')]

xrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"

command = subprocess.run(
    xrandr,
    shell=True,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
)

if command.returncode != 0:
    error = command.stderr.decode("UTF-8")
    logger.error(f"Failed counting monitors using {xrandr}:\n{error}")
    connected_monitors = 1
else:
    connected_monitors = int(command.stdout.decode("UTF-8"))

if connected_monitors > 1:
    for _ in range(1, connected_monitors):
        screens.append(Screen(top=status_bar(secondary_widgets),wallpaper='a.jpg',
        wallpaper_mode='fill'))

# import subprocess
# from libqtile.config import Screen
# from libqtile import bar
# from libqtile.log_utils import logger
# from .widgets import primary_widgets, secondary_widgets  # Asegúrate de tener estos widgets definidos

# def status_bar(widgets):
#     return bar.Bar(widgets, 28, opacity=0.9)

# def get_connected_monitors():
#     """
#     Obtiene una lista de monitores conectados y determina cuál es el principal.
#     Retorna una lista de diccionarios con 'name', 'connection' y 'primary'.
#     """
#     xrandr_cmd = "xrandr | grep ' connected'"

#     try:
#         # Ejecuta el comando xrandr para obtener los monitores conectados
#         output = subprocess.check_output(xrandr_cmd, shell=True, text=True)
#     except subprocess.CalledProcessError as e:
#         logger.error(f"Error al ejecutar xrandr: {e}")
#         return []

#     monitors = []
#     for line in output.strip().split('\n'):
#         parts = line.split()
#         name = parts[0]
#         connection = 'Other'
#         primary = False

#         # Determina el tipo de conexión basado en el nombre del monitor
#         if 'HDMI' in name:
#             connection = 'HDMI'
#         elif 'DP' in name or 'DisplayPort' in name:
#             connection = 'DP'
#         elif 'eDP' in name:  # Para pantallas integradas en laptops
#             connection = 'eDP'

#         # Verifica si el monitor es el principal
#         if 'primary' in line:
#             primary = True

#         monitors.append({'name': name, 'connection': connection, 'primary': primary})

#     return monitors

# def sort_monitors(monitors):
#     """
#     Ordena la lista de monitores para que el monitor principal esté primero.
#     Si no hay monitor principal, ordena por tipo de conexión con HDMI primero.
#     """
#     if not monitors:
#         return []

#     # Filtrar monitores principales
#     primary_monitors = [m for m in monitors if m['primary']]
#     non_primary_monitors = [m for m in monitors if not m['primary']]

#     if primary_monitors:
#         # Si hay monitores marcados como principales, asegurarse de que estén primero
#         sorted_monitors = primary_monitors + non_primary_monitors
#     else:
#         # Si no hay monitor principal, priorizar HDMI
#         sorted_monitors = sorted(non_primary_monitors, key=lambda m: 0 if m['connection'] == 'HDMI' else 1)

#     return sorted_monitors

# # Obtener y ordenar los monitores conectados
# monitors = get_connected_monitors()
# sorted_monitors = sort_monitors(monitors)

# # Inicializar la lista de pantallas
# screens = []

# if not sorted_monitors:
#     # Fallback a una sola pantalla si no se detectan monitores
#     screens.append(Screen(
#         top=status_bar(primary_widgets),
#         wallpaper='/usr/share/backgrounds/hardy_wallpaper_uhd.png',
#         wallpaper_mode='fill'
#     ))
# else:
#     for idx, monitor in enumerate(sorted_monitors):
#         if idx == 0:
#             # Pantalla principal
#             screens.append(Screen(
#                 top=status_bar(primary_widgets),
# 		wallpaper='/usr/share/backgrounds/hardy_wallpaper_uhd.png',
#                 wallpaper_mode='fill'
#             ))
#         else:
#             # Pantallas secundarias
#             screens.append(Screen(
#                 top=status_bar(secondary_widgets),
#                 wallpaper='/usr/share/backgrounds/hardy_wallpaper_uhd.png',
#                 wallpaper_mode='fill'
#             ))
