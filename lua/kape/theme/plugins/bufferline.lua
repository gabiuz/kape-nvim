-- lua/kape/theme/plugins/bufferline.lua

local colors = require("kape.colors")

---@class Kape.Theme.Plugins.Bufferline.State
---@field tab table|nil
---@field underline_config table|nil
local state = {
  tab             = nil,
  underline_config = nil,
}

--- Generate icon highlight groups for bufferline
---@param icon_hl_name string|nil
---@param icon_color   string|nil
---@return table<string, vim.api.keyset.highlight>
local function generate_icon_highlights(icon_hl_name, icon_color)
  if not icon_hl_name or not state.tab then
    return {}
  end

  local tab = state.tab
  local highlights = {
    ["BufferLine" .. icon_hl_name .. "Selected"] = { bg = tab.activeBackground,          fg = icon_color },
    ["BufferLine" .. icon_hl_name]               = { bg = tab.inactiveBackground,        fg = icon_color },
    ["BufferLine" .. icon_hl_name .. "Inactive"] = { bg = tab.unfocusedActiveBackground, fg = icon_color },
  }

  if state.underline_config then
    for key, hl_value in pairs(highlights) do
      if string.find(key, "Selected") then
        hl_value.underline = state.underline_config.selected
      elseif string.find(key, "Inactive") then
        hl_value.underline = state.underline_config.visible
      else
        hl_value.underline = state.underline_config.fill
      end
    end
  end

  return highlights
end

---@type Kape.PluginSpec
return {
  name = "akinsho/bufferline.nvim",
  lazy = { module = "bufferline" },

  highlights = function(c, config)
    local bufferline_config = config.plugins and config.plugins.bufferline or {}

    local normal_alpha    = 0.6
    local visible_alpha   = 0.8
    local duplicate_alpha = 0.6
    local count_alpha     = 0.75

    state.underline_config = {
      selected = bufferline_config.underline_selected
        or bufferline_config.underline_visible
        or bufferline_config.underline_fill,
      visible = bufferline_config.underline_visible or bufferline_config.underline_fill,
      fill    = bufferline_config.underline_fill,
    }

    local is_bold  = bufferline_config.bold ~= false
    local is_clear = vim.tbl_contains(config.background_clear or {}, "bufferline")
    local amt      = 10

    local tabs_background = is_clear and c.editor.background or c.editorGroupHeader.tabsBackground

    state.tab = vim.tbl_deep_extend("force", {
      activeBackground          = c.tab.activeBackground,
      activeBorder              = c.tab.activeBorder,
      activeForeground          = c.tab.activeForeground,
      inactiveBackground        = c.tab.inactiveBackground,
      inactiveForeground        = c.tab.inactiveForeground,
      unfocusedActiveBackground = c.tab.unfocusedActiveBackground,
      unfocusedActiveBorder     = c.tab.unfocusedActiveBorder,
      unfocusedActiveForeground = c.tab.unfocusedActiveForeground,
    }, is_clear and {
      activeBackground          = colors.lighten(c.tab.activeBackground, amt),
      inactiveBackground        = colors.lighten(c.tab.inactiveBackground, amt),
      unfocusedActiveBackground = colors.lighten(c.tab.unfocusedActiveBackground, amt),
    } or {})

    local tab = state.tab

    ---@param underline_type "fill"|"visible"|"selected"
    local function fallback_sp(underline_type)
      if underline_type == "selected" then
        return bufferline_config.underline_selected and tab.activeBorder or fallback_sp("visible")
      elseif underline_type == "visible" then
        return bufferline_config.underline_visible and tab.unfocusedActiveBorder or fallback_sp("fill")
      elseif underline_type == "fill" then
        return bufferline_config.underline_fill and c.editorGroupHeader.tabsBorder or c.editor.background
      end
      return c.editor.background
    end

    ---@param highlights table<string, vim.api.keyset.highlight>
    local function add_underline(highlights)
      for key, hl_value in pairs(highlights) do
        if type(hl_value) == "table" and not hl_value.link then
          if string.find(key, "Selected") then
            hl_value.underline = state.underline_config.selected
            hl_value.sp        = fallback_sp("selected")
          elseif string.find(key, "Visible") or string.find(key, "Inactive") then
            hl_value.underline = state.underline_config.visible
            hl_value.sp        = fallback_sp("visible")
          else
            hl_value.underline = state.underline_config.fill
            hl_value.sp        = fallback_sp("fill")
          end
        end
      end
    end

    local function setup_bufferline_icons()
      vim.api.nvim_create_autocmd({ "ColorScheme", "BufEnter" }, {
        pattern  = "*",
        callback = function()
          local icon_ok, web_devicons = pcall(require, "nvim-web-devicons")
          if not icon_ok then return end

          for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
            pcall(function()
              local buf_name = vim.api.nvim_buf_get_name(buf_id)
              if buf_name and buf_name ~= "" then
                local filename  = vim.fn.fnamemodify(buf_name, ":t")
                local extension = vim.fn.fnamemodify(buf_name, ":e")
                local _, icon_hl    = web_devicons.get_icon(filename, extension, { default = true })
                local _, icon_color = web_devicons.get_icon_color(filename, extension, { default = true })
                if icon_hl then
                  local icon_highlights = generate_icon_highlights(icon_hl, icon_color)
                  add_underline(icon_highlights)
                  colors.apply_highlights(icon_highlights)
                end
              end
            end)
          end
        end,
      })
    end

    local highlights = {
      -- Offset / fill
      BufferLineFill            = { bg = tabs_background },
      BufferLineOffsetSeparator = { link = "NeoTreeWinSeparator" },

      -- Buffer states
      BufferLineBufferSelected = { bg = tab.activeBackground,          fg = tab.activeForeground },
      BufferLineBackground     = {
        bg = tab.inactiveBackground,
        fg = colors.blend(c.base.white, normal_alpha, tab.inactiveBackground),
      },
      BufferLineBufferVisible  = {
        bg = tab.unfocusedActiveBackground,
        fg = colors.blend(c.base.white, visible_alpha, c.editor.background),
      },

      -- Duplicate
      BufferLineDuplicateSelected = {
        bg = tab.activeBackground,
        fg = colors.blend(tab.activeForeground, duplicate_alpha, tab.activeBackground),
        italic = true,
      },
      BufferLineDuplicate = {
        bg = tab.inactiveBackground,
        fg = colors.blend(c.base.white, normal_alpha * duplicate_alpha, tab.inactiveBackground),
        italic = true,
      },
      BufferLineDuplicateVisible = {
        bg = tab.unfocusedActiveBackground,
        fg = colors.blend(c.base.white, visible_alpha * duplicate_alpha, tab.unfocusedActiveBackground),
        italic = true,
      },

      -- Close button
      BufferLineCloseButtonSelected = { bg = tab.activeBackground,          fg = tab.activeForeground },
      BufferLineCloseButton         = { bg = tab.inactiveBackground,        fg = c.base.white },
      BufferLineCloseButtonVisible  = { bg = tab.unfocusedActiveBackground, fg = c.base.white },

      -- Separator
      BufferLineSeparatorSelected = { bg = tab.activeBackground,          fg = tabs_background },
      BufferLineSeparator         = { bg = tab.inactiveBackground,        fg = tabs_background },
      BufferLineSeparatorVisible  = { bg = tab.unfocusedActiveBackground, fg = tabs_background },

      -- Numbers
      BufferLineNumbersSelected = { bg = tab.activeBackground,          fg = tab.activeForeground },
      BufferLineNumbers         = { bg = tab.inactiveBackground,        fg = c.base.dimmed3 },
      BufferLineNumbersVisible  = { bg = tab.unfocusedActiveBackground, fg = c.base.dimmed2 },

      -- Modified
      BufferLineModifiedSelected = { bg = tab.activeBackground,          fg = c.base.yellow },
      BufferLineModified         = { bg = tab.inactiveBackground,        fg = c.base.yellow },
      BufferLineModifiedVisible  = { bg = tab.unfocusedActiveBackground, fg = c.base.yellow },

      -- Warning
      BufferLineWarningSelected = { bg = tab.activeBackground, fg = c.inputValidation.warningForeground },
      BufferLineWarning         = {
        bg = tab.inactiveBackground,
        fg = colors.blend(c.inputValidation.warningForeground, normal_alpha, tab.inactiveBackground),
      },
      BufferLineWarningVisible  = {
        bg = tab.unfocusedActiveBackground,
        fg = colors.blend(c.inputValidation.warningForeground, visible_alpha, tab.unfocusedActiveBackground),
      },

      -- Warning diagnostic count
      BufferLineWarningDiagnosticSelected = {
        bg = tab.activeBackground,
        fg = colors.blend(c.inputValidation.warningForeground, count_alpha, c.editor.background),
      },
      BufferLineWarningDiagnostic = {
        bg = tab.inactiveBackground,
        fg = colors.blend(c.inputValidation.warningForeground, normal_alpha * count_alpha, tab.inactiveBackground),
      },
      BufferLineWarningDiagnosticVisible = {
        bg = tab.unfocusedActiveBackground,
        fg = colors.blend(c.inputValidation.warningForeground, visible_alpha * count_alpha, tab.unfocusedActiveBackground),
      },

      -- Error
      BufferLineErrorSelected = { bg = tab.activeBackground, fg = c.inputValidation.errorForeground },
      BufferLineError         = {
        bg = tab.inactiveBackground,
        fg = colors.blend(c.inputValidation.errorForeground, normal_alpha, tab.inactiveBackground),
      },
      BufferLineErrorVisible  = {
        bg = tab.unfocusedActiveBackground,
        fg = colors.blend(c.inputValidation.errorForeground, visible_alpha, tab.unfocusedActiveBackground),
      },

      -- Error diagnostic count
      BufferLineErrorDiagnosticSelected = {
        bg = tab.activeBackground, bold = true,
        fg = colors.blend(c.inputValidation.errorForeground, count_alpha, c.editor.background),
      },
      BufferLineErrorDiagnostic = {
        bg = tab.inactiveBackground, bold = true,
        fg = colors.blend(c.inputValidation.errorForeground, normal_alpha * count_alpha, tab.inactiveBackground),
      },
      BufferLineErrorDiagnosticVisible = {
        bg = tab.unfocusedActiveBackground, bold = true,
        fg = colors.blend(c.inputValidation.errorForeground, visible_alpha * count_alpha, tab.unfocusedActiveBackground),
      },

      -- Info
      BufferLineInfoSelected = { bg = tab.activeBackground, fg = c.inputValidation.infoForeground },
      BufferLineInfo         = {
        bg = tab.inactiveBackground,
        fg = colors.blend(c.inputValidation.infoForeground, normal_alpha, tab.inactiveBackground),
      },
      BufferLineInfoVisible  = {
        bg = tab.unfocusedActiveBackground,
        fg = colors.blend(c.inputValidation.infoForeground, visible_alpha, tab.unfocusedActiveBackground),
      },

      -- Info diagnostic count
      BufferLineInfoDiagnosticSelected = {
        bg = tab.activeBackground, bold = true,
        fg = colors.blend(c.inputValidation.infoForeground, count_alpha, c.editor.background),
      },
      BufferLineInfoDiagnostic = {
        bg = tab.inactiveBackground, bold = true,
        fg = colors.blend(c.inputValidation.infoForeground, normal_alpha * count_alpha, tab.inactiveBackground),
      },
      BufferLineInfoDiagnosticVisible = {
        bg = tab.unfocusedActiveBackground, bold = true,
        fg = colors.blend(c.inputValidation.infoForeground, visible_alpha * count_alpha, tab.unfocusedActiveBackground),
      },

      -- Hint (linked to info)
      BufferLineHintSelected                = { link = "BufferLineInfoSelected" },
      BufferLineHint                        = { link = "BufferLineInfo" },
      BufferLineHintVisible                 = { link = "BufferLineInfoVisible" },
      BufferLineHintDiagnosticSelected      = { link = "BufferLineInfoDiagnosticSelected" },
      BufferLineHintDiagnostic              = { link = "BufferLineInfoDiagnostic" },
      BufferLineHintDiagnosticVisible       = { link = "BufferLineInfoDiagnosticVisible" },

      -- Pick
      BufferLinePickSelected = { bg = tab.activeBackground,          fg = c.base.red, bold = true },
      BufferLinePick         = { bg = tab.inactiveBackground,        fg = c.base.red, bold = true },
      BufferLinePickVisible  = { bg = tab.unfocusedActiveBackground, fg = c.base.red, bold = true },

      -- Tab
      BufferLineTab = {
        bg = tab.inactiveBackground,
        fg = colors.blend(c.base.white, normal_alpha, tab.inactiveBackground),
      },
      BufferLineTabClose         = { bg = tabs_background, fg = tabs_background },
      BufferLineTabSelected      = { bg = tab.activeBackground, fg = tab.activeForeground },
      BufferLineTabSeparator     = { bg = tab.inactiveBackground,  fg = tab.inactiveBackground },
      BufferLineTabSeparatorSelected = { bg = tab.activeBackground, fg = tab.activeBackground },

      -- Indicator
      BufferLineIndicatorSelected = { bg = tab.activeBackground,          fg = c.tab.activeBorder },
      BufferLineIndicator         = { bg = tab.inactiveBackground,        fg = tab.inactiveBackground },
      BufferLineIndicatorVisible  = { bg = tab.unfocusedActiveBackground, fg = tab.unfocusedActiveBackground },
    }

    if is_bold then
      for _, hl_value in pairs(highlights) do
        if type(hl_value) == "table" and not hl_value.link then
          hl_value.bold = true
        end
      end
    end

    add_underline(highlights)
    setup_bufferline_icons()

    return highlights
  end,
}
