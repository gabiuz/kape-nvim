-- lua/kape/palette/kape.lua
-- Kape's color palette.

---@class Kape.Palette
---@field dark2      string
---@field dark1      string
---@field background string
---@field text       string
---@field accent1    string
---@field accent2    string
---@field accent3    string
---@field accent4    string
---@field accent5    string
---@field accent6    string
---@field dimmed1    string
---@field dimmed2    string
---@field dimmed3    string
---@field dimmed4    string
---@field dimmed5    string
---@field blue          string
---@field bright_red    string
---@field bright_orange string
---@field bright_yellow string
---@field bright_green  string
---@field bright_aqua   string
---@field bright_blue   string
---@field bright_purple string
---@field bg_visual_red    string
---@field bg_visual_yellow string
---@field bg_visual_green  string
---@field bg_visual_blue   string
---@field bg_visual_purple string
---@field bg_diff_red   string
---@field bg_diff_green string
---@field bg_diff_blue  string

---@type Kape.Palette
return {
  -- Backgrounds
  dark2      = "#181616",
  dark1      = "#1e1b1b",
  background = "#181616",
  text       = "#d4be98",

  -- Accents
  accent1 = "#b53535",
  accent2 = "#c87941",
  accent3 = "#e7bb5c",
  accent4 = "#b4c76e",
  accent5 = "#689d8a",
  accent6 = "#b06880",

  -- Grays
  dimmed1 = "#d4be98",
  dimmed2 = "#bdae8b",
  dimmed3 = "#928374",
  dimmed4 = "#928374",
  dimmed5 = "#2e2a2a",

  -- Blue (separate from aqua, used for LSP info)
  blue = "#7b8fd4",

  -- Brights
  bright_red    = "#c94040",
  bright_orange = "#d4975a",
  bright_yellow = "#f0cc7a",
  bright_green  = "#cad98a",
  bright_aqua   = "#89b8a8",
  bright_blue   = "#9aaae0",
  bright_purple = "#c8889a",

  -- Visual / diff tinted backgrounds
  bg_visual_red    = "#3c1f1e",
  bg_visual_yellow = "#3a2e1a",
  bg_visual_green  = "#2a3120",
  bg_visual_blue   = "#1e2b30",
  bg_visual_purple = "#2e1e30",

  -- ANSI compatibility aliases
  bright_cyan   = "#89b8a8",
  bright_violet = "#c8889a",
  bg_visual_violet = "#2e1e30",

  bg_diff_red   = "#3c1f1e",
  bg_diff_green = "#2a3120",
  bg_diff_blue  = "#1e2b30",
}
