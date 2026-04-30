-- lua/kape/theme/scheme.lua
-- Maps Kape's flat palette into named semantic slots.
-- All group/plugin files reference scheme.* rather than raw palette colors.

---@class Kape.Scheme.Editor
---@field background              string
---@field foreground              string
---@field lineHighlightBackground string
---@field selectionBackground     string
---@field findMatchBackground     string
---@field findMatchBorder         string
---@field findMatchHighlightBackground string
---@field foldBackground          string
---@field wordHighlightBackground string
---@field selectionHighlightBackground string
---@field wordHighlightStrongBackground string

---@class Kape.Scheme.EditorLineNumber
---@field foreground       string
---@field activeForeground string

---@class Kape.Scheme.EditorHoverWidget
---@field background string
---@field border     string

---@class Kape.Scheme.EditorSuggestWidget
---@field background        string
---@field border            string
---@field foreground        string
---@field highlightForeground string
---@field selectedBackground string

---@class Kape.Scheme.EditorIndentGuide
---@field background       string
---@field activeBackground string

---@class Kape.Scheme.EditorInlayHint
---@field background string
---@field foreground string

---@class Kape.Scheme.EditorGutter
---@field addedBackground    string
---@field deletedBackground  string
---@field modifiedBackground string

---@class Kape.Scheme.SideBar
---@field background string
---@field foreground string

---@class Kape.Scheme.SideBarTitle
---@field foreground string

---@class Kape.Scheme.List
---@field activeSelectionBackground string

---@class Kape.Scheme.SideBarSectionHeader
---@field background string
---@field foreground string

---@class Kape.Scheme.Breadcrumb
---@field foreground string

---@class Kape.Scheme.Button
---@field background     string
---@field foreground     string
---@field hoverBackground string
---@field separator      string

---@class Kape.Scheme.ScrollbarSlider
---@field hoverBackground string

---@class Kape.Scheme.GitDecoration
---@field addedResourceForeground         string
---@field conflictingResourceForeground   string
---@field deletedResourceForeground       string
---@field ignoredResourceForeground       string
---@field modifiedResourceForeground      string
---@field stageDeletedResourceForeground  string
---@field stageModifiedResourceForeground string
---@field untrackedResourceForeground     string

---@class Kape.Scheme.InputValidation
---@field errorBackground   string
---@field errorBorder       string
---@field errorForeground   string
---@field infoBackground    string
---@field infoBorder        string
---@field infoForeground    string
---@field warningBackground string
---@field warningBorder     string
---@field warningForeground string

---@class Kape.Scheme.ErrorLens
---@field errorBackground   string
---@field errorForeground   string
---@field warningBackground string
---@field warningForeground string
---@field infoBackground    string
---@field infoForeground    string
---@field hintBackground    string
---@field hintForeground    string

---@class Kape.Scheme.Terminal
---@field background string
---@field foreground string

---@class Kape.Scheme.TerminalCursor
---@field background string
---@field foreground string

---@class Kape.Scheme.EditorGroupHeader
---@field tabsBackground string
---@field tabsBorder     string

---@class Kape.Scheme.Tab
---@field activeBackground         string
---@field activeBorder             string
---@field activeForeground         string
---@field inactiveBackground       string
---@field inactiveForeground       string
---@field unfocusedActiveBackground string
---@field unfocusedActiveBorder    string
---@field unfocusedActiveForeground string

---@class Kape.Scheme.StatusBar
---@field background     string
---@field foreground     string
---@field activeForeground string

---@class Kape.Scheme.DiffEditor
---@field insertedLineBackground string
---@field removedLineBackground  string
---@field modifiedLineBackground string

---@class Kape.Scheme.DiffEditorOverview
---@field insertedForeground string
---@field removedForeground  string
---@field modifiedForeground string

---@class Kape.Scheme.Notifications
---@field background string
---@field border     string
---@field foreground string

---@class Kape.Scheme.NotificationsErrorIcon
---@field foreground string

---@class Kape.Scheme.NotificationsInfoIcon
---@field foreground string

---@class Kape.Scheme.NotificationsWarningIcon
---@field foreground string

---@class Kape.Scheme.Base
---@field dark    string
---@field black   string
---@field red     string
---@field orange  string
---@field green   string
---@field yellow  string
---@field blue    string
---@field magenta string
---@field cyan    string
---@field white   string
---@field dimmed1 string
---@field dimmed2 string
---@field dimmed3 string
---@field dimmed4 string
---@field dimmed5 string

---@class Kape.Scheme.Diagnostic
---@field errorBackground   string
---@field errorForeground   string
---@field warningBackground string
---@field warningForeground string
---@field infoBackground    string
---@field infoForeground    string
---@field hintBackground    string
---@field hintForeground    string

---@class Kape.Scheme
---@field editor               Kape.Scheme.Editor
---@field editorLineNumber     Kape.Scheme.EditorLineNumber
---@field editorHoverWidget    Kape.Scheme.EditorHoverWidget
---@field editorSuggestWidget  Kape.Scheme.EditorSuggestWidget
---@field editorIndentGuide    Kape.Scheme.EditorIndentGuide
---@field editorInlayHint      Kape.Scheme.EditorInlayHint
---@field editorGutter         Kape.Scheme.EditorGutter
---@field sideBar              Kape.Scheme.SideBar
---@field sideBarTitle         Kape.Scheme.SideBarTitle
---@field list                 Kape.Scheme.List
---@field sideBarSectionHeader Kape.Scheme.SideBarSectionHeader
---@field breadcrumb           Kape.Scheme.Breadcrumb
---@field button               Kape.Scheme.Button
---@field scrollbarSlider      Kape.Scheme.ScrollbarSlider
---@field gitDecoration        Kape.Scheme.GitDecoration
---@field inputValidation      Kape.Scheme.InputValidation
---@field errorLens            Kape.Scheme.ErrorLens
---@field terminal             Kape.Scheme.Terminal
---@field terminalCursor       Kape.Scheme.TerminalCursor
---@field editorGroupHeader    Kape.Scheme.EditorGroupHeader
---@field tab                  Kape.Scheme.Tab
---@field statusBar            Kape.Scheme.StatusBar
---@field diffEditor           Kape.Scheme.DiffEditor
---@field diffEditorOverview   Kape.Scheme.DiffEditorOverview
---@field notifications        Kape.Scheme.Notifications
---@field notificationsErrorIcon   Kape.Scheme.NotificationsErrorIcon
---@field notificationsInfoIcon    Kape.Scheme.NotificationsInfoIcon
---@field notificationsWarningIcon Kape.Scheme.NotificationsWarningIcon
---@field base                 Kape.Scheme.Base
---@field diagnostic           Kape.Scheme.Diagnostic

local colors = require("kape.colors")

---@class Kape.SchemeModule
local M = {}

--- Build the color scheme from a palette and config
---@param palette Kape.Palette
---@param config  Kape.Config
---@return Kape.Scheme
function M.build(palette, config)
  local p           = palette
  local transparent = config.transparent_background

  ---@type Kape.Scheme
  local scheme = {}

  -- Editor
  scheme.editor = {
    background                     = transparent and "NONE" or p.background,
    foreground                     = p.text,
    lineHighlightBackground        = colors.blend(p.text, 0.05, p.background),
    selectionBackground            = colors.blend(p.dimmed1, 0.15, p.background),
    findMatchBackground            = colors.blend(p.text, 0.15, p.background),
    findMatchBorder                = p.accent3,
    findMatchHighlightBackground   = colors.blend(p.text, 0.10, p.background),
    foldBackground                 = colors.blend(p.text, 0.08, p.background),
    wordHighlightBackground        = colors.blend(p.dimmed5, 1.0, p.background),
    selectionHighlightBackground   = colors.blend(p.dimmed5, 1.0, p.background),
    wordHighlightStrongBackground  = colors.blend(p.dimmed5, 1.0, p.background),
  }

  scheme.editorLineNumber = {
    foreground       = p.dimmed4,
    activeForeground = p.dimmed2,
  }

  scheme.editorHoverWidget = {
    background = p.dimmed5,
    border     = p.background,
  }

  scheme.editorSuggestWidget = {
    background         = p.dimmed5,
    border             = p.dimmed5,
    foreground         = p.dimmed2,
    highlightForeground = p.text,
    selectedBackground  = colors.blend(p.text, 0.08, p.dimmed5),
  }

  scheme.editorIndentGuide = {
    background       = p.dimmed5,
    activeBackground = colors.blend(p.text, 0.15, p.dimmed5),
  }

  scheme.editorInlayHint = {
    background = transparent and "NONE" or p.dark1,
    foreground = p.dimmed3,
  }

  scheme.editorGutter = {
    addedBackground    = p.accent4,
    deletedBackground  = p.accent1,
    modifiedBackground = p.accent2,
  }

  -- Sidebar
  scheme.sideBar = {
    background = transparent and "NONE" or p.dark1,
    foreground = p.dimmed2,
  }

  scheme.sideBarTitle = {
    foreground = p.dimmed4,
  }

  scheme.list = {
    activeSelectionBackground = colors.blend(p.text, 0.10, p.dark1),
  }

  scheme.sideBarSectionHeader = {
    background = p.dark1,
    foreground = p.dimmed1,
  }

  scheme.breadcrumb = {
    foreground = p.dimmed2,
  }

  -- Buttons
  scheme.button = {
    background      = p.dimmed5,
    foreground      = p.dimmed1,
    hoverBackground = colors.blend(p.text, 0.10, p.dimmed5),
    separator       = p.background,
  }

  scheme.scrollbarSlider = {
    hoverBackground = colors.blend(p.dimmed1, 0.15, p.background),
  }

  -- Git decorations
  scheme.gitDecoration = {
    addedResourceForeground         = p.accent4,
    conflictingResourceForeground   = p.accent2,
    deletedResourceForeground       = p.accent1,
    ignoredResourceForeground       = p.dimmed4,
    modifiedResourceForeground      = p.accent3,
    stageDeletedResourceForeground  = p.accent1,
    stageModifiedResourceForeground = p.accent3,
    untrackedResourceForeground     = p.dimmed2,
  }

  -- Validation / diagnostics
  scheme.inputValidation = {
    errorBackground   = p.dimmed5,
    errorBorder       = p.accent1,
    errorForeground   = p.accent1,
    infoBackground    = p.dimmed5,
    infoBorder        = p.blue,
    infoForeground    = p.blue,
    warningBackground = p.dimmed5,
    warningBorder     = p.accent3,
    warningForeground = p.accent3,
  }

  -- Virtual text: tinted backgrounds or flat grey depending on config
  if config.diagnostic_virtual_text == "grey" then
    scheme.errorLens = {
      errorBackground   = p.background,
      errorForeground   = p.dimmed3,
      warningBackground = p.background,
      warningForeground = p.dimmed3,
      infoBackground    = p.background,
      infoForeground    = p.dimmed3,
      hintBackground    = p.background,
      hintForeground    = p.dimmed3,
    }
  else
    scheme.errorLens = {
      errorBackground   = p.bg_visual_red,
      errorForeground   = p.accent1,
      warningBackground = p.bg_visual_yellow,
      warningForeground = p.accent3,
      infoBackground    = p.bg_visual_blue,
      infoForeground    = p.blue,
      hintBackground    = p.bg_visual_green,
      hintForeground    = p.accent5,
    }
  end

  -- Diagnostic undercurl
  scheme.diagnostic = {
    errorBackground   = p.bg_visual_red,
    errorForeground   = p.accent1,
    warningBackground = p.bg_visual_yellow,
    warningForeground = p.accent3,
    infoBackground    = p.bg_visual_blue,
    infoForeground    = p.blue,
    hintBackground    = p.bg_visual_green,
    hintForeground    = p.accent5,
  }

  -- Terminal
  scheme.terminal = {
    background = p.dimmed5,
    foreground = p.text,
  }

  scheme.terminalCursor = {
    background = p.text,
    foreground = p.background,
  }

  -- Tabs
  scheme.editorGroupHeader = {
    tabsBackground = transparent and "NONE" or p.dark1,
    tabsBorder     = p.dark1,
  }

  scheme.tab = {
    activeBackground          = transparent and "NONE" or p.background,
    activeBorder              = p.accent3,
    activeForeground          = p.text,
    inactiveBackground        = p.dark1,
    inactiveForeground        = p.dimmed3,
    unfocusedActiveBackground = p.dark1,
    unfocusedActiveBorder     = p.dimmed3,
    unfocusedActiveForeground = p.dimmed2,
  }

  -- Status bar
  scheme.statusBar = {
    background      = p.dark2,
    foreground      = p.dimmed3,
    activeForeground = p.dimmed1,
  }

  -- Diff
  scheme.diffEditor = {
    insertedLineBackground = p.bg_diff_green,
    removedLineBackground  = p.bg_diff_red,
    modifiedLineBackground = p.bg_diff_blue,
  }

  scheme.diffEditorOverview = {
    insertedForeground = colors.blend(p.accent4, 0.65, p.bg_diff_green),
    removedForeground  = colors.blend(p.accent1, 0.65, p.bg_diff_red),
    modifiedForeground = colors.blend(p.blue,    0.65, p.bg_diff_blue),
  }

  -- Notifications
  scheme.notifications = {
    background = p.dimmed5,
    border     = p.dimmed5,
    foreground = p.dimmed1,
  }

  scheme.notificationsErrorIcon   = { foreground = p.accent1 }
  scheme.notificationsInfoIcon    = { foreground = p.blue }
  scheme.notificationsWarningIcon = { foreground = p.accent3 }

  -- Base
  scheme.base = {
    dark    = p.dark2,
    black   = p.dark1,
    red     = p.accent1,
    orange  = p.accent2,
    green   = p.accent4,
    yellow  = p.accent3,
    blue    = p.blue,
    magenta = p.accent6,
    cyan    = p.accent5,
    white   = p.text,
    dimmed1 = p.dimmed1,
    dimmed2 = p.dimmed2,
    dimmed3 = p.dimmed3,
    dimmed4 = p.dimmed4,
    dimmed5 = p.dimmed5,
  }

  return scheme
end

return M
