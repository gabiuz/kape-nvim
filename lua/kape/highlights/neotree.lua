-- lua/kape/highlights/neotree.lua

local M = function(p, opts)
	local bg = opts.transparent_background and p.none or p.bg1

	local highlights = {
		-- Base window
		NeoTreeNormal               = { fg = p.fg0,   bg = bg },
		NeoTreeNormalNC             = { fg = p.fg0,   bg = bg },
		NeoTreeSignColumn           = { fg = p.fg0,   bg = bg },
		NeoTreeStatusLine           = { fg = bg,      bg = bg },
		NeoTreeStatusLineNC         = { fg = bg,      bg = bg },
		NeoTreeEndOfBuffer          = { fg = bg,      bg = bg },
		NeoTreeWinSeparator         = { fg = p.bg3,   bg = p.bg0 },

		-- Cursor
		NeoTreeCursor               = { bg = p.bg2 },
		NeoTreeCursorLine           = { bg = p.bg2,   bold = true },
		NeoTreeCursorLineSign       = { bg = p.bg2 },

		-- Root & directory
		NeoTreeRootName             = { fg = p.orange, bold = true },
		NeoTreeDirectoryIcon        = { fg = p.fg0 },
		NeoTreeDirectoryName        = { fg = p.fg0 },
		NeoTreeExpander             = { link = "NeoTreeDirectoryIcon" },

		-- Files
		NeoTreeFileName             = { fg = p.fg0 },
		NeoTreeFileNameOpened       = { fg = p.fg0,   bold = true },
		NeoTreeFileIcon             = { fg = p.fg0 },
		NeoTreeSymbolicLinkTarget   = { link = "KapeCyan" },

		-- Dotfiles / hidden / faded
		NeoTreeDotfile              = { link = "KapeGrey" },
		NeoTreeHiddenByName         = { link = "KapeGrey" },
		NeoTreeWindowsHidden        = { link = "KapeGrey" },
		NeoTreeDimText              = { fg = p.grey0 },
		NeoTreeFadeText1            = { fg = p.grey1 },
		NeoTreeFadeText2            = { fg = p.bg3 },
		NeoTreeIndentMarker         = { fg = p.grey0 },
		NeoTreeMessage              = { fg = p.grey0,  italic = true },

		-- Modified / filter
		NeoTreeModified             = { link = "KapeYellow" },
		NeoTreeFilterTerm           = { link = "KapeCyan" },
		NeoTreeBufferNumber         = { link = "KapeOrange" },
		NeoTreePreview              = { link = "Search" },

		-- File stats
		NeoTreeFileStats            = { fg = p.grey1 },
		NeoTreeFileStatsHeader      = { fg = p.grey0,  bold = true, italic = true },

		-- Float / popup
		NeoTreeFloatNormal          = { fg = p.fg0,   bg = bg },
		NeoTreeFloatBorder          = { fg = bg,      bg = bg },
		NeoTreeTitleBar             = { fg = p.yellow, bg = bg,    bold = true },
		NeoTreeFloatTitle           = { fg = p.yellow, bg = bg,    bold = true },

		-- Tabs
		NeoTreeTabActive            = { fg = p.fg0,   bg = p.bg0,  bold = true },
		NeoTreeTabInactive          = { fg = p.grey0, bg = p.bg1 },
		NeoTreeTabSeparatorActive   = { fg = p.bg3,   bg = p.bg0 },
		NeoTreeTabSeparatorInactive = { fg = p.bg3,   bg = p.bg1 },

		-- Git status
		NeoTreeGitAdded             = { link = "KapeGreen" },
		NeoTreeGitConflict          = { fg = p.orange, bold = true, italic = true },
		NeoTreeGitDeleted           = { link = "KapeRed" },
		NeoTreeGitIgnored           = { link = "KapeGrey" },
		NeoTreeGitModified          = { link = "KapeYellow" },
		NeoTreeGitStaged            = { link = "KapeBlue" },
		NeoTreeGitRenamed           = { link = "KapeViolet" },
		NeoTreeGitUntracked         = { link = "KapeCyan" },
		NeoTreeGitUnstaged          = { link = "KapeOrange" },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
