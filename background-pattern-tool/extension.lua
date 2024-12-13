local BackgroundPattern = dofile("./backgroundPattern.lua") -- Archivo funcional principal

function init(plugin)
    plugin:newCommand{
        id = "BackgroundPatternTool",
        title = "Add Background Pattern",
        group = "edit_fill", -- Coloca la herramienta en el menú Frame
        onclick = function()
            BackgroundPattern:Open()
        end
    }
end

function exit(plugin) end
