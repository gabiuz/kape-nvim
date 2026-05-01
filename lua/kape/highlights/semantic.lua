-- lua/kape/highlights/semantic.lua
-- Defines named intermediate groups (KapeRed, KapeErrorText, etc.) that
-- plugin highlight files link to, keeping them decoupled from raw colors.
local M = function(p, opts)
    opts = opts or {}

    local colors = {
        fg = p.text or p.fg0,
        grey = p.dimmed3 or p.grey0,
        red = p.accent1 or p.red,
        orange = p.accent2 or p.orange,
        yellow = p.accent3 or p.yellow,
        green = p.accent4 or p.green,
        aqua = p.accent5 or p.aqua or p.cyan,
        blue = p.blue,
        purple = p.accent6 or p.purple or p.violet,
        sign_bg = p.dimmed5 or p.bg1,
        current_word_bg = p.dimmed5 or p.bg2,
        inlay_bg = p.dark1 or p.bg1,
        bg_visual_red = p.bg_visual_red,
        bg_visual_yellow = p.bg_visual_yellow,
        bg_visual_green = p.bg_visual_green,
        bg_visual_blue = p.bg_visual_blue
    }

    local hl = vim.api.nvim_set_hl

    -- Color aliases 
    hl(0, "KapeFg", {
        fg = colors.fg
    })
    hl(0, "KapeGrey", {
        fg = colors.grey
    })
    hl(0, "KapeRed", {
        fg = colors.red
    })
    hl(0, "KapeOrange", {
        fg = colors.orange
    })
    hl(0, "KapeYellow", {
        fg = colors.yellow
    })
    hl(0, "KapeGreen", {
        fg = colors.green
    })
    hl(0, "KapeAqua", {
        fg = colors.aqua
    })
    hl(0, "KapeBlue", {
        fg = colors.blue
    })
    hl(0, "KapePurple", {
        fg = colors.purple
    })
    hl(0, "KapeCyan", {
        fg = colors.aqua
    })
    hl(0, "KapeViolet", {
        fg = colors.purple
    })

    -- Italic variants (respects italic_comments option)
    local italic = opts.italic_comments and true or false
    hl(0, "KapeRedItalic", {
        fg = colors.red,
        italic = italic
    })
    hl(0, "KapeYellowItalic", {
        fg = colors.yellow,
        italic = italic
    })
    hl(0, "KapeGreenItalic", {
        fg = colors.green,
        italic = italic
    })
    hl(0, "KapeAquaItalic", {
        fg = colors.aqua,
        italic = italic
    })
    hl(0, "KapeBlueItalic", {
        fg = colors.blue,
        italic = italic
    })
    hl(0, "KapePurpleItalic", {
        fg = colors.purple,
        italic = italic
    })
    hl(0, "KapeCyanItalic", {
        fg = colors.aqua,
        italic = italic
    })
    hl(0, "KapeVioletItalic", {
        fg = colors.purple,
        italic = italic
    })

    -- Sign column colors 
    hl(0, "KapeRedSign", {
        fg = colors.red,
        bg = colors.sign_bg
    })
    hl(0, "KapeOrangeSign", {
        fg = colors.orange,
        bg = colors.sign_bg
    })
    hl(0, "KapeYellowSign", {
        fg = colors.yellow,
        bg = colors.sign_bg
    })
    hl(0, "KapeGreenSign", {
        fg = colors.green,
        bg = colors.sign_bg
    })
    hl(0, "KapeAquaSign", {
        fg = colors.aqua,
        bg = colors.sign_bg
    })
    hl(0, "KapeBlueSign", {
        fg = colors.blue,
        bg = colors.sign_bg
    })
    hl(0, "KapePurpleSign", {
        fg = colors.purple,
        bg = colors.sign_bg
    })
    hl(0, "KapeCyanSign", {
        fg = colors.aqua,
        bg = colors.sign_bg
    })
    hl(0, "KapeVioletSign", {
        fg = colors.purple,
        bg = colors.sign_bg
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
            fg = colors.red,
            bg = colors.bg_visual_red
        })
        hl(0, "KapeVirtualTextWarning", {
            fg = colors.yellow,
            bg = colors.bg_visual_yellow
        })
        hl(0, "KapeVirtualTextInfo", {
            fg = colors.blue,
            bg = colors.bg_visual_blue
        })
        hl(0, "KapeVirtualTextHint", {
            fg = colors.aqua,
            bg = colors.bg_visual_green
        })
    end

    -- Inline diagnostic text 
    hl(0, "KapeErrorText", {
        undercurl = true,
        sp = colors.red
    })
    hl(0, "KapeWarningText", {
        undercurl = true,
        sp = colors.yellow
    })
    hl(0, "KapeInfoText", {
        undercurl = true,
        sp = colors.blue
    })
    hl(0, "KapeHintText", {
        undercurl = true,
        sp = colors.aqua
    })

    -- Float diagnostic (no background, just color)
    hl(0, "KapeErrorFloat", {
        fg = colors.red
    })
    hl(0, "KapeWarningFloat", {
        fg = colors.yellow
    })
    hl(0, "KapeInfoFloat", {
        fg = colors.blue
    })
    hl(0, "KapeHintFloat", {
        fg = colors.aqua
    })

    -- Current word 
    hl(0, "KapeCurrentWord", {
        bg = colors.current_word_bg
    })

    -- Inlay hints
    hl(0, "KapeInlayHints", {
        fg = colors.grey,
        bg = colors.inlay_bg
    })
end

return M
