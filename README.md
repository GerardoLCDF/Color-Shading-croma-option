# Aseprite Color Shading v4.0

Este script para [Aseprite](https://www.aseprite.org/) abre una ventana dinámica de selección de color con opciones relevantes de degradado y matiz, ayudándote a crear paletas y sombras de forma más sencilla.

## Créditos y Orígenes

Este trabajo se basa en contribuciones previas:

- Versión 1.0-2.0 por [Dominick John](https://github.com/dominickjohn/aseprite/tree/master) y [David Capello](https://aseprite.org/).
- Versión 3.0 por [yashar98](https://github.com/yashar98/aseprite/tree/main).
- Versión 3.1 por [Daeyangae](https://github.com/Daeyangae/aseprite).
- Versión 4.0 por [Manuel Hoelzl](https://github.com/hoelzlmanuel/aseprite-color-shading).

Esta versión mantiene las funcionalidades introducidas anteriormente y agrega mejoras adicionales.

## Instalación

1. Descarga el archivo del script (ej. `Color Shading v4.0.lua`).
2. Abre Aseprite y ve a **File -> Scripts -> Open Scripts Folder** para abrir la carpeta de scripts.
3. Copia el archivo del script en la carpeta de scripts de Aseprite.
4. Reinicia Aseprite si es necesario.

## Uso

1. En Aseprite, ve a **File -> Scripts -> Color Shading v4.0** para ejecutar el script.
2. Se abrirá una ventana con diferentes secciones de colores y opciones para generar paletas.

### Funcionalidades:

- **Base:** Al hacer clic en uno de los colores base, el resto de las sombras y matices se recalcularán en función de ese color.
- **Botón "Get":** Actualiza los colores base usando el color de primer plano (FG) y de fondo (BG) actuales, y regenera las sombras.
- **Clic Izquierdo en un color:** Establece ese color como el FG (foreground).
- **Clic Derecho en un color:** Establece ese color como BG (background).
- **Clic Medio en un color:** Alterna entre FG/BG dependiendo de cuál se cambió por última vez (si "auto pick" está activado), y regenera todas las sombras basadas en el nuevo color.
  
### Controles Avanzados:

- **Temperatura (Temp. Osc. / Temp. Clara):** Ajustan la temperatura (tinte cálido o frío) para las sombras oscuras y claras, respectivamente.
- **Intensidad (Intensity):** Agrega un gradiente de saturación a las muestras de sombra.
- **Pico (Peak):** Agrega un gradiente de luminosidad en las sombras, afectando cuánto se aclaran las muestras más claras.
- **Oscilación (Sway):** Ajusta la influencia real de las temperaturas establecidas.
- **Ranuras (Slots):** Cambia el número de muestras de color generadas.

## Notas

- Asegúrate de tener la última versión de Aseprite para la compatibilidad con scripts.
- Este script está destinado a artistas y diseñadores que trabajen con pixel art y necesiten herramientas para generar rápidamente paletas y degradados de color.
