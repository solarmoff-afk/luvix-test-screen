local view = {}

view.build = function()
    local root = luvix.Node({
        w = "100%", h = "100%",
        layout = luvix.LinearLayoutVertical({spacing = 10}),
    })

    luvix.buildColor({31 / 255, 31 / 255, 31 / 255}, {19 / 255, 19 / 255, 19 / 255})

    local field = luvix.Node({
        w = "100%", h = "33%",
        backgroundColor = {51 / 255, 51 / 255, 51 / 255},
        rounding = 20,
        margin = {vertical = -10},
        layout = luvix.ZLayout({})
    })

    field:push(luvix.Rect({
        w = "10%", h = "2%",
        color = {1, 1, 1},
        gravity = {vertical = "bottom", horizontal = "center"},
        margin = {vertical = 5},
        rounding = 3
    }))

    root:push(field)

    local topButtonsField = luvix.Node({
        w = "100%", h = "7%",
        backgroundColor = {1, 1, 1, 0},
        layout = luvix.SpaceBetweenLayout({padding = {horizontal = 40}})
    })

    local topButtons = {"#", "#", "#", "^", "!"}

    for _, button in ipairs(topButtons) do
        topButtonsField:push(luvix.Text({
            text = button, fontSize = 25,
            gravity = {vertical = "center"}
        }))
    end

    root:push(topButtonsField)
    
    local buttons = {{
            {name = "AC", color = {145 / 255, 145 / 255, 145 / 255}, textColor = {0, 0, 0}},
            {name = "()", color = {71 / 255,  71 / 255, 71 / 255}}, 
            {name = "%", color = {71 / 255,  71 / 255, 71 / 255}},
            {name = "/", color = {71 / 255,  71 / 255, 71 / 255}},
        }, {
            {name = "7"}, {name = "8"}, {name = "9"},
            {name = "X", color = {71 / 255,  71 / 255, 71 / 255}},
        }, {
            {name = "4"}, {name = "5"}, {name = "6"},
            {name = "-", color = {71 / 255,  71 / 255, 71 / 255}},
        }, {
            {name = "1"}, {name = "2"}, {name = "3"},
            {name = "+", color = {71 / 255,  71 / 255, 71 / 255}},
        }, {
            {name = "0"}, {name = ","}, {name = "<"},
            {name = "=", color = {212 / 255,  212 / 255, 212 / 255}, textColor = {0, 0, 0}},
        }
    }

    local mainButtonsField = luvix.Node({
        w = "100%", h = "50%",
        backgroundColor = {1, 1, 1, 0},
        layout = luvix.LinearLayoutVertical({})
    })

    for _, horizontal in ipairs(buttons) do
        local row = luvix.Node({
            w = "100%", h = "20%",
            backgroundColor = {0, 0, 0, 0},
            layout = luvix.SpaceBetweenLayout({padding = {horizontal = 20}})
        })

        for _, vertical in ipairs(horizontal) do
            row:push(luvix.FilledButton({
                w = 70, h = 70,
                text = vertical.name,
                backgroundColor = vertical.color or {31 / 255, 31 / 255, 31 / 255},
                textColor = vertical.textColor or {1, 1, 1},
                rounding = 36, fontSize = 25
            }))
        end

        mainButtonsField:push(luvix.Space({h = 5}))
        mainButtonsField:push(row)
    end

    root:push(mainButtonsField)

    root.backgroundColor = luvix.getTheme().surface
    luvix.trackTheme(root, {backgroundColor = "surface"})

    return root
end

return view