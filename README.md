![Qtile](./screenshots/index.png)

# Instalacion ArchLinux con QTile

## Update packages
```bash
sudo pacman -Syu
```

## Network: iwd
**[iwd](https://wiki.archlinux.org/title/iwd)**

```bash
sudo pacman -S iwd dhcp

systemctl enable --now iwd

iwctl
```
Para su configuración:

```bash

station *device* scan

station *device* get-networks

station *device* connect SSID
```

## Terminal y Shell

```bash
sudo pacman -S alacritty fish starship

chsh *user*

/bin/fish
```

## Menu rofi

```bash
sudo pacman -S rofi which

rofi-theme-selector
```

Para descargar temas para rofi:
 -> https://github.com/davatorium/rofi-themes
 -> https://github.com/newmanls/rofi-themes-collection


## Monitores y gráficos

Para múltiples monitores, se necesitará xrandr:

```bash
sudo pacman -S xrandr xorg-xrandr
```

Para descargar los drivers de nvidia y poder controlar los hercios y otras carcaterísticas gráficas:

```bash
sudo pacman -S nvidia nvidia-utils nvidia-settings
```

## Qtile: Keys, Layouts, Screens, Widgets, Groups & Themes

Para instalar Qtile y algunos módulos necesarios:

```bash
sudo pacman -S python python-pip python-psutil
```

### Keys

| Atajo                   | Acción                                       |
| ----------------------- | -------------------------------------------- |
| **mod + j**             | siguiente ventana                            |
| **mod + k**             | ventana previa                               |
| **mod + shift + h**     | aumentar master                              |
| **mod + shift + l**     | decrementar master                           |
| **mod + shift + j**     | mover ventana abajo                          |
| **mod + shift + k**     | mover ventana arriba                         |
| **mod + shift + f**     | pasar ventana a flotante                     |
| **mod + tab**           | cambiar la disposición de las ventanas       |
| **mod + [1-9]**         | cambiar al espacio de trabajo N (1-9)        |
| **mod + shift + [1-9]** | mandar ventana al espacio de trabajo N (1-9) |
| **mod + punto**         | enfocar siguiente monitor                    |
| **mod + coma**          | enfocar monitor previo                       |
| **mod + w**             | cerrar ventana                               |
| **mod + enter**         | abrir alacritty                              |
| **mod + e**             | abrir thunar                                 |
| **mod + p**             | abrir ranger                                 |
| **mod + c**             | abrir vscode                                 |
| **mod + b**             | abrir brave                                  |
| **mod + m**             | lanzar rofi                                  |
| **mod + shift + m**     | navegación (rofi)                            |
| **mod + s**             | scrot                                        |
| **mod + shift + s**     | scrot manual                                 |
| **mod + r**             | redshift                                     |
| **mod + shift + r**     | reset redshift                               |

### Layouts

layout.Max(),
layout.MonadTall(**layout_conf),
layout.MonadWide(**layout_conf),

### Screens

Multimonitor support:  

```bash
screens = [
    Screen(top=status_bar(primary_widgets), wallpaper='~/background.jpg',wallpaper_mode='fill')
]

xrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l" # Number os monitors availables
```

En caso de encontrar más monitores se añadirán con el grupo secundario de widgets.


### Widgets

```python
primary_widgets = [
       widget.CheckUpdates(
        background=colors['color4'],
            colour_have_updates=colors['text'],
            colour_no_updates=colors['text'],
            no_update_string='0',
            display_format='{updates}',
            update_interval=1800,
            custom_command='checkupdates',
       ),
       widget.Net(**base(bg='color3'), interface='wlan0',use_bits=True),
       widget.CPU(
            format='{load_percent:5.2f} %',
            background=colors['color5'],
            foreground=colors['dark']
       ),
       widget.Memory(
            foreground = colors['dark'],
            background = colors['color6'],
            format = '{MemUsed:.0f} {mm} / {MemTotal:.0f} {mm}'
        ),
       widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),
       widget.CurrentLayout(**base(bg='color2'), padding=5),
       widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M:%S '),
       widget.Systray(background=colors['dark'], padding=5,base_size=30),
]

secondary_widgets = [
       widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),
       widget.CurrentLayout(**base(bg='color1'), padding=5),
       widget.Clock(**base(bg='color2'), format='%d/%m/%Y - %H:%M:%S ').
]
```

### Groups

```python
groups = [Group(i) for i in ["  󰆟  ","    ","    ","    ","    ","  󰙯  ","  󰍹  ",]]
```

### Themes

Selecionar un tema de la carpeta themes e inidicarlo en el config.py. Se pueden crear nuevos temas tomando los existentes como plantillas y modificando los colores.

## Audio

Con pulseaudio y alsa, además de una interfaz gráfica, pavucontrol, para una expereciencia más cómoda:

```bash
sudo pacman -S pulseaudio alsamixer alsa-utils pavucontrol
```

Keys para el volumen:

```python
Key([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
Key([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),
```
## Brillo

Para controlar el brillo en laptops se puede utilizar **[brightnessctl](https://www.archlinux.org/packages/community/x86_64/brightnessctl/)**:

```bash
sudo pacman -S brightnessctl
```

Keys para el brillo:

```python
Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
```

## Xob

Para tener un overlay para el nivel de brillo y/o volumen actual:

```bash
cd ~/Descargas
git clone https://github.com/florentc/xob
cd xob
make
make install
cd
```
Para decargar los módulos dependientes:

```bash
sudo pacman -S python-pulsectl
```

## Almacenamiento

Para montar de forma automática unidades de alamacenamiento extrernas y poder leer y escribir en discos NTFS:

```bash
sudo pacman -S udiskie ntfs-3g
```

Si quieres conectar tu teléfono usando un cable USB, necesitarás una implementación de MTP y alguna interfaz de línea de comandos como:

```bash
sudo pacman -S libmtp
yay -S simple-mtpfs
```
Para utilizarlo:

```bash
simple-mtpfs -l # Lista todos los dispositivos conectados
simple-mtpfs --device 1 /mount/point # Monta el primer dispositivo de la lista anterior
```

## Systray

Qtile por defecto tiene su bandeja para aquellos applets de programas. Para ejecutarlos se deben indicar dichos programas en el autostart.sh de Qtile:

```bash
#!/bin/sh

# systray battery icon
cbatticon -u 5 &

# systray volume
volumeicon &

# opacity
picom --no-vsync &

# bg
# feh --bg-fill ~/background.png

# Overlay Bar
~/.local/bin/xob-pulse-py | xob &

# Apps
megasync &
discord &
udiskie -t &
```

Algunos de los applets que utilizo son:

```bash
sudo pacman -S cbatticon volumeicon
```

## Comandos y utilidades básicas

Para la transparencia en las aplicaciones:

```bash
sudo pacman -S picom #opacity             
```

Algunos comando extra con mejoras con respecto a los tradicionales:
```bash
sudo pacman -S exa #grep
               lsd #ls
               bat #cat
```

## Explorador de archivos

Para gestionar los archivos sin tener que utilizar comando en la terminal:
-> **[thunar](https://wiki.archlinux.org/index.php/Thunar)**
-> **[ranger](https://wiki.archlinux.org/index.php/Ranger)**

Para añadir plugins a ranger:

```bash
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins #icons
```

## Basura

Para no utilizar constantemente **rm** sin capacidad de recuperar lo eliminado:

```bash
sudo pacman -S glib2 gvfs
```

## Gestionar dotfiles

Para gestionar los ficheros de configuracion, utilizo stow que genera soft links sobre una carpeta base hasta cada una de las rutas donde deben ir dichos ficheros.

```bash
sudo pacman -S stow
```

## Multimedia

### Imagenes

Para abrir imágenes y trabajar sin muchas herramientas avanzadas:

```bash
sudo pacman -S geeqie
```

### Video y audio

Para reproducir música y videos:

```bash 
sudo pacman -S vlc
```
### PDF

Para la lectura y escritura de pdfs: 

```bash
sudo pacman -S evince
```

### Texto

Para poder modificar ficheros desde la terminal:

```bash
sudo pacman -S nvim
```

Para poder transformar .md en latex:

```bash
sudo pacman -Sy pandoc
```

## Yay

Gestor de paquetes con acceso a *Arch User Repository*:

```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git ~
cd ~/yay
makepkg -si
cd
```
### Yay software

```bash
yay brave-bin
yay megasync-bin
yay visual-studio-code-bin
```

## Git software

### Fzf

Fzf

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Fonts-Themes-Icons

Para poder utilizar las fuentes, temas e iconos a instalar a continuación es necesario indicar en los ficheros de configuracion gtk3 y gtk4 el tema que se quiere utilizar. Si se utiliza el script **stow.sh** ya se utilizaran ficheros para gtk correctamente configurados.

### Fonts

```bash
sudo cp fonts-themes-icons/fonts/* /usr/share/fonts/
```

### Themes

```bash
mkdir ~/.themes
git clone https://github.com/vinceliuice/Graphite-gtk-theme ~/Descargas
bash ~/Descargas/Graphite-gtk-theme/install.sh
```

Para el tema del cursor:

```bash
yay breeze-snow-cursor-theme
```

### Icons

```bash
mkdir ~/Downloads
git clone https://github.com/yeyushengfan258/We10X-icon-theme ~/Descargas
bash ~/Descargas/We10X-icon-theme/install.sh -a
```











