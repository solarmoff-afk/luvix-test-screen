local M = {}

function M.config(options)
    return {
        width = 720,
        height = 1280,
        virtualWidth = 360,
        virtualHeight = 480,
        style = luvix.materialStyle
    }
end

function M.main()
    luvix.goto("views.home")
end

return M
