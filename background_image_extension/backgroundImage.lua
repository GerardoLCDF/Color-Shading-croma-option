local BackgroundImage = {}

function BackgroundImage:Execute(options)
    local dlg = Dialog("Agregar Imagen de Fondo")
    local zoom = 1.0
    local offsetX, offsetY = 0, 0
    local backgroundImage = nil

    -- Cargar imagen desde una ruta ingresada manualmente
    local function cargarImagenDesdeRuta()
        local filePath = dlg.data.ruta -- Obtiene la ruta ingresada en el cuadro de texto
        if filePath and app.fs.isFile(filePath) then
            backgroundImage = app.open(filePath)
            offsetX, offsetY = 0, 0
            zoom = 1.0
            app.alert("Imagen cargada: " .. filePath)
        else
            app.alert("El archivo no existe en la ruta proporcionada.")
        end
    end

    -- Renderizar imagen
    local function renderizarImagen()
        if backgroundImage then
            -- Aquí puedes implementar el renderizado personalizado
            app.alert("Renderizado pendiente.")
        else
            app.alert("Primero carga una imagen.")
        end
    end

    -- Configurar cuadro de diálogo
    dlg:entry{
        id = "ruta",
        label = "Ruta de la imagen:",
        text = "C:/ruta/a/tu/imagen.png" -- Ruta predeterminada de ejemplo
    }
    dlg:button{ text = "Cargar Imagen", onclick = cargarImagenDesdeRuta }
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
    dlg:button{ text = "Cerrar", onclick = function() dlg:close() end }

    dlg:show{ wait = false }
end

return BackgroundImage
