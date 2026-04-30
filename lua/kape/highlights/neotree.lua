-- lua/kape/highlights/neotree.lua
-- Uses semantic group links where possible.

local M = function(p, opts)
	local bg = opts.transparent_background and p.none or p.bg1

	local highlights = {

		-- Base window
		NeoTreeNormal         = { fg = p.fg0,   bg = bg },
		NeoTreeNormalNC       = { fg = p.fg1,   bg = bg },
		NeoTreeSignColumn     = { fg = p.fg0,   bg = bg },
		NeoTreeStatusLine     = { fg = p.fg0,   bg = p.bg2 },
		NeoTreeStatusLineNC   = { fg = p.grey0, bg = bg },
		NeoTreeVertSplit      = { fg = p.bg0,   bg = p.bg0 },
		NeoTreeWinSeparator   = { fg = p.bg3,   bg = p.bg0 },
		NeoTreeEndOfBuffer    = { fg = bg },
		NeoTreeCursorLine     = { bg = p.bg0,   bold = true },

		-- Float / popup
		NeoTreeFloatBorder    = { fg = p.grey1, bg = bg },
		NeoTreeFloatNormal    = { fg = p.fg0,   bg = bg },
		NeoTreeFloatTitle     = { fg = p.orange, bg = bg, bold = true },
		NeoTreeTitleBar       = { fg = p.bg0,   bg = p.orange, bold = true },

		-- Root & directory
		NeoTreeRootName       = { fg = p.orange, bold = true, italic = true },
		NeoTreeDirectoryName  = { link = "KapeGreen" },
		NeoTreeDirectoryIcon  = { link = "KapeOrange" },
		NeoTreeExpander       = { link = "KapeGrey" },

		-- Files
		NeoTreeFileName       = { link = "KapeFg" },
		NeoTreeFileNameOpened = { fg = p.fg0,   bold = true },
		NeoTreeFileIcon       = { link = "KapeFg" },
		NeoTreeSymbolicLinkTarget = { link = "KapeCyan" },

		-- Dotfiles / hidden / faded
		NeoTreeDotfile        = { link = "KapeGrey" },
		NeoTreeHiddenByName   = { link = "KapeGrey" },
		NeoTreeWindowsHidden  = { link = "KapeGrey" },
		NeoTreeDimText        = { fg = p.grey0 },
		NeoTreeFadeText1      = { fg = p.grey1 },
		NeoTreeFadeText2      = { fg = p.bg3 },
		NeoTreeIndentMarker   = { link = "KapeGrey" },
		NeoTreeMessage        = { fg = p.grey0, italic = true },

		-- Modified / filter
		NeoTreeModified       = { link = "KapeYellow" },
		NeoTreeFilterTerm     = { link = "KapeCyan" },
		NeoTreeBufferNumber   = { link = "KapeOrange" },
		NeoTreePreview        = { link = "Search" },

		-- File stats
		NeoTreeFileStats      = { fg = p.grey1 },
		NeoTreeFileStatsHeader = { fg = p.grey0, bold = true, italic = true },

		-- Tabs
		NeoTreeTabActive            = { fg = p.fg0,   bg = p.bg0,  bold = true },
		NeoTreeTabInactive          = { fg = p.grey0, bg = p.bg1 },
		NeoTreeTabSeparatorActive   = { fg = p.bg0,   bg = p.bg0 },
		NeoTreeTabSeparatorInactive = { fg = p.bg1,   bg = p.bg1 },

		-- Git status
		NeoTreeGitAdded      = { link = "KapeGreen" },
		NeoTreeGitDeleted    = { link = "KapeRed" },
		NeoTreeGitModified   = { link = "KapeYellow" },
		NeoTreeGitConflict   = { fg = p.orange, bold = true, italic = true },
		NeoTreeGitIgnored    = { link = "KapeGrey" },
		NeoTreeGitRenamed    = { link = "KapeViolet" },
		NeoTreeGitStaged     = { link = "KapeBlue" },
		NeoTreeGitUnstaged   = { link = "KapeOrange" },
		NeoTreeGitUntracked  = { link = "KapeCyan" },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
