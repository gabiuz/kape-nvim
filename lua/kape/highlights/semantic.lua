-- lua/kape/highlights/semantic.lua
-- Defines named intermediate groups (KapeRed, KapeErrorText, etc.) that
-- plugin highlight files link to, keeping them decoupled from raw colors.
local M = function(p, opts)
    local hl = vim.api.nvim_set_hl

    -- Color aliases 
    hl(0, "KapeFg", {
        fg = p.fg0
    })
    hl(0, "KapeGrey", {
        fg = p.grey0
    })
    hl(0, "KapeRed", {
        fg = p.red
    })
    hl(0, "KapeOrange", {
        fg = p.orange
    })
    hl(0, "KapeYellow", {
        fg = p.yellow
    })
    hl(0, "KapeGreen", {
        fg = p.green
    })
    hl(0, "KapeCyan", {
        fg = p.cyan
    })
    hl(0, "KapeBlue", {
        fg = p.blue
    })
    hl(0, "KapeViolet", {
        fg = p.violet
    })

    -- Italic variants (respects italic_comments option)
    local italic = opts.italic_comments and true or false
    hl(0, "KapeRedItalic", {
        fg = p.red,
        italic = italic
    })
    hl(0, "KapeYellowItalic", {
        fg = p.yellow,
        italic = italic
    })
    hl(0, "KapeGreenItalic", {
        fg = p.green,
        italic = italic
    })
    hl(0, "KapeCyanItalic", {
        fg = p.cyan,
        italic = italic
    })
    hl(0, "KapeBlueItalic", {
        fg = p.blue,
        italic = italic
    })
    hl(0, "KapeVioletItalic", {
        fg = p.violet,
        italic = italic
    })

    -- Sign column colors 
    hl(0, "KapeRedSign", {
        fg = p.red,
        bg = p.bg1
    })
    hl(0, "KapeOrangeSign", {
        fg = p.orange,
        bg = p.bg1
    })
    hl(0, "KapeYellowSign", {
        fg = p.yellow,
        bg = p.bg1
    })
    hl(0, "KapeGreenSign", {
        fg = p.green,
        bg = p.bg1
    })
    hl(0, "KapeCyanSign", {
        fg = p.cyan,
        bg = p.bg1
    })
    hl(0, "KapeBlueSign", {
        fg = p.blue,
        bg = p.bg1
    })
    hl(0, "KapeVioletSign", {
        fg = p.violet,
        bg = p.bg1
    })

    -- Diagnostic virtual text 
    -- "colored" = tinted bg wash; "grey" = muted uniform color
    local vt = opts.diagnostic_virtual_text
    if vt == "grey" then
        hl(0, "KapeVirtualTextError", {
            link = "KapeGrey"
        })
        hl(0, "KapeVirtualTextWarning", {
            link = "KapeGrey"
        })
        hl(0, "KapeVirtualTextInfo", {
            link = "KapeGrey"
        })
        hl(0, "KapeVirtualTextHint", {
            link = "KapeGrey"
        })
    else -- "colored" (default)
        hl(0, "KapeVirtualTextError", {
            fg = p.red,
            bg = p.bg_visual_red
        })
        hl(0, "KapeVirtualTextWarning", {
            fg = p.yellow,
            bg = p.bg_visual_yellow
        })
        hl(0, "KapeVirtualTextInfo", {
            fg = p.blue,
            bg = p.bg_visual_blue
        })
        hl(0, "KapeVirtualTextHint", {
            fg = p.cyan,
            bg = p.bg_visual_green
        })
    end

    -- Inline diagnostic text 
    hl(0, "KapeErrorText", {
        undercurl = true,
        sp = p.red
    })
    hl(0, "KapeWarningText", {
        undercurl = true,
        sp = p.yellow
    })
    hl(0, "KapeInfoText", {
        undercurl = true,
        sp = p.blue
    })
    hl(0, "KapeHintText", {
        undercurl = true,
        sp = p.cyan
    })

    -- Float diagnostic (no background, just color)
    hl(0, "KapeErrorFloat", {
        fg = p.red
    })
    hl(0, "KapeWarningFloat", {
        fg = p.yellow
    })
    hl(0, "KapeInfoFloat", {
        fg = p.blue
    })
    hl(0, "KapeHintFloat", {
        fg = p.cyan
    })

    -- Current word 
    hl(0, "KapeCurrentWord", {
        bg = p.bg2
    })

    -- Inlay hints
    hl(0, "KapeInlayHints", {
        fg = p.grey0,
        bg = p.bg1
    })
end

return M
