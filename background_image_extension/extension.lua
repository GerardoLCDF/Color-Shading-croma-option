local BackgroundImage = dofile("./backgroundImage.lua") -- Carga el archivo funcional principal

local isDialogOpen = false -- Para evitar múltiples cuadros abiertos

function init(plugin)
    plugin:newCommand{
        id = "BackgroundImage",
        title = "Add Background Image",
        group = "Frame", -- Grupo "Frame" asegura que salga en el menú Frame
        onenabled = function()
            return app.activeSprite ~= nil and not isDialogOpen
        end,
        onclick = function()
            BackgroundImage:Execute{
                onclose = function() isDialogOpen = false end
            }
            isDialogOpen = true
        end
    }
end

function exit(plugin) end
