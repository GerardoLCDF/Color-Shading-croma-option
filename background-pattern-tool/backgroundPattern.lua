local BackgroundPattern = {}

-- Variables globales para la imagen de fondo
local backgroundImage = nil
local zoom = 1.0
local offsetX, offsetY = 0, 0

-- Función para cargar la imagen desde una ruta
local function cargarImagen(filePath)
    if filePath and app.fs.isFile(filePath) then
        backgroundImage = Image{ fromFile = filePath }
        offsetX, offsetY = 0, 0
        zoom = 1.0
    else
        app.alert("Ruta inválida o archivo no encontrado.")
    end
end

-- Función para renderizar la imagen en el lienzo activo
local function renderizarImagen()
    if backgroundImage then
        local sprite = app.activeSprite
        if sprite then
            local cel = sprite.cels[1]
            local img = cel.image:clone()

            -- Dibujar la imagen de fondo escalada y desplazada
            img:drawImage(backgroundImage, offsetX, offsetY, { scale = zoom })

            -- Actualizar la cel con la imagen renderizada
            cel.image = img
        else
            app.alert("No hay un sprite activo.")
        end
    else
        app.alert("Primero carga una imagen válida.")
    end
end

-- Mostrar el cuadro de diálogo principal
function BackgroundPattern:Open()
    local dlg = Dialog("Patrón de Fondo")

    -- Campo para ingresar la ruta de la imagen
    dlg:entry{
        id = "ruta",
        label = "Ruta de la imagen:",
        text = "C:/ruta/a/tu/imagen.png"
    }

    -- Botón para cargar la imagen
    dlg:button{
        text = "Cargar Imagen",
        onclick = function()
            local filePath = dlg.data.ruta
            cargarImagen(filePath)
            renderizarImagen()
        end
    }

    -- Controles para mover la imagen
    dlg:button{ text = "↑", onclick = function() offsetY = offsetY - 10; renderizarImagen() end }
    dlg:button{ text = "↓", onclick = function() offsetY = offsetY + 10; renderizarImagen() end }
    dlg:button{ text = "←", onclick = function() offsetX = offsetX - 10; renderizarImagen() end }
    dlg:button{ text = "→", onclick = function() offsetX = offsetX + 10; renderizarImagen() end }

    -- Control deslizante para ajustar el zoom
    dlg:slider{
        id = "zoom",
        label = "Zoom",
        min = 0.1,
        max = 5.0,
        value = 1.0,
        onchange = function(value)
            zoom = value
            renderizarImagen()
        end
    }

    -- Botón para cerrar el cuadro
    dlg:button{
        text = "Cerrar",
        onclick = function() dlg:close() end
    }

    dlg:show{ wait = false }
end

return BackgroundPattern
