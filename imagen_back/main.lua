-- Crear un diálogo personalizado
local dlg = Dialog("Vista Previa de Imágenes")

-- Ruta base para las imágenes (ajusta según tu sistema operativo)
local rutaBase = "C:\\Users\\braya\\OneDrive\\Imágenes\\"

-- Función para mostrar una vista previa de la imagen seleccionada
local function cargarVistaPrevia()
    local nombreArchivo = dlg.data.ruta -- Obtiene el nombre del archivo ingresado
    local rutaImagen = rutaBase .. nombreArchivo -- Combina la ruta base con el nombre del archivo

    if nombreArchivo and app.fs.isFile(rutaImagen) then
        dlg:modify{
            id = "vistaPrevia",
            widget = "image",
            file = rutaImagen,
            scale = "fit" -- Ajusta la imagen al tamaño del cuadro
        }
    else
        app.alert("El archivo no existe en la ruta: " .. rutaImagen)
    end
end

-- Función para abrir la imagen seleccionada
local function abrirImagen()
    local nombreArchivo = dlg.data.ruta
    local rutaImagen = rutaBase .. nombreArchivo

    if nombreArchivo and app.fs.isFile(rutaImagen) then
        app.open(rutaImagen) -- Abre la imagen seleccionada
    else
        app.alert("Por favor, selecciona un archivo válido.")
    end
end

-- Campo de entrada para el nombre del archivo
dlg:entry{
    id = "ruta",
    label = "Nombre del archivo:",
    text = "ejemplo.png" -- Nombre de archivo predeterminado
}

-- Espacio para la vista previa (inicialmente vacío)
dlg:image{
    id = "vistaPrevia",
    label = "Vista previa:",
    file = nil -- Sin imagen al inicio
}

-- Botón Ver para cargar y mostrar la vista previa
dlg:button{
    id = "ver",
    text = "Ver",
    onclick = cargarVistaPrevia
}

-- Botón Abrir para cargar la imagen seleccionada en el lienzo
dlg:button{
    id = "abrir",
    text = "Abrir",
    onclick = abrirImagen
}

-- Botón Cerrar para cerrar el cuadro de diálogo
dlg:button{
    id = "cerrar",
    text = "Cerrar",
    onclick = function()
        dlg:close()
    end
}

-- Mostrar el cuadro de diálogo
dlg:show{ wait = false }
