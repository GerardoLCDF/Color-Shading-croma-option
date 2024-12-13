-- Crear un diálogo personalizado con botones Agregar, Ver y Cerrar
local dlg = Dialog("Seleccionar Imagen")

-- Ruta base para la carpeta de imágenes
local rutaBase = "C:\\Users\\braya\\OneDrive\\Imágenes\\"

-- Sprite temporal para la vista previa
local vistaPreviaSprite = nil

-- Función para mostrar una vista previa de la imagen seleccionada
local function vistaPreviaImagen()
    local nombreArchivo = dlg.data.ruta -- Obtiene el nombre del archivo ingresado
    local rutaImagen = rutaBase .. nombreArchivo -- Combina la ruta base con el nombre del archivo

    if nombreArchivo and app.fs.isFile(rutaImagen) then
        -- Cierra cualquier vista previa anterior
        if vistaPreviaSprite then
            vistaPreviaSprite:close()
        end

        -- Cargar la imagen como un sprite temporal para vista previa
        vistaPreviaSprite = app.open(rutaImagen)
        app.alert("Vista previa cargada: " .. rutaImagen)
    else
        app.alert("El archivo no existe en la ruta: " .. rutaImagen)
    end
end

-- Función para cargar definitivamente la imagen
local function cargarImagen()
    if vistaPreviaSprite then
        app.alert("Imagen abierta desde la vista previa.")
    else
        app.alert("Por favor, utiliza 'Ver' para cargar la vista previa primero.")
    end
end

-- Campo de entrada para ingresar el nombre del archivo
dlg:entry{
    id = "ruta",
    label = "Nombre del archivo:",
    text = "ejemplo.png" -- Nombre de archivo de ejemplo
}

-- Botón Ver para mostrar la vista previa de la imagen
dlg:button{
    id = "ver",
    text = "Ver",
    onclick = vistaPreviaImagen
}

-- Botón Agregar para confirmar la imagen seleccionada
dlg:button{
    id = "agregar",
    text = "Agregar",
    onclick = cargarImagen
}

-- Botón Cerrar para cerrar el cuadro de diálogo
dlg:button{
    id = "cerrar",
    text = "Cerrar",
    onclick = function()
        if vistaPreviaSprite then
            vistaPreviaSprite:close() -- Cierra el sprite temporal si existe
        end
        dlg:close()
    end
}

dlg:show{ wait = false }
