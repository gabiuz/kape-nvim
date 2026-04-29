-- lua/kape/highlights/nvimtree.lua
-- Uses semantic group links where possible.

local M = function(p, opts)
	local bg = opts.transparent_background and p.none or p.bg1

	local highlights = {

		-- Base window
		NvimTreeNormal        = { fg = p.fg0,        bg = bg },
		NvimTreeNormalFloat   = { fg = p.fg0,        bg = bg },
		NvimTreeNormalNC      = { fg = p.fg1,        bg = bg },
		NvimTreeEndOfBuffer   = { fg = bg },
		NvimTreeVertSplit     = { fg = p.bg0,        bg = p.bg0 },
		NvimTreeCursorLine    = { bg = p.bg0 },
		NvimTreeCursorColumn  = { bg = p.bg0 },
		NvimTreeWinSeparator  = { fg = p.bg3,        bg = p.bg0 },

		-- Files & folders
		NvimTreeRootFolder         = { link = "KapeGrey" },
		NvimTreeFolderIcon         = { link = "KapeOrange" },
		NvimTreeFolderName         = { link = "KapeGreen" },
		NvimTreeOpenedFolderName   = { link = "KapeGreen" },
		NvimTreeEmptyFolderName    = { link = "KapeGreen" },
		NvimTreeFileName           = { link = "KapeFg" },
		NvimTreeFileIcon           = { link = "KapeFg" },
		NvimTreeSpecialFile        = { link = "KapeFg" },
		NvimTreeSymlink            = { link = "KapeFg" },
		NvimTreeSymlinkIcon        = { link = "KapeFg" },
		NvimTreeSymlinkFolderName  = { link = "KapeGreen" },
		NvimTreeImageFile          = { link = "KapeFg" },
		NvimTreeExecFile           = { link = "KapeFg" },
		NvimTreeIndentMarker       = { link = "KapeGrey" },

		-- Git status
		NvimTreeGitDirty    = { link = "KapeYellow" },
		NvimTreeGitStaged   = { link = "KapeBlue" },
		NvimTreeGitMerge    = { link = "KapeOrange" },
		NvimTreeGitRenamed  = { link = "KapeViolet" },
		NvimTreeGitNew      = { link = "KapeCyan" },
		NvimTreeGitDeleted  = { link = "KapeRed" },
		NvimTreeGitIgnored  = { link = "KapeGrey" },

		-- Diagnostics (link to sign groups)
		NvimTreeLspDiagnosticsError       = { link = "KapeRedSign" },
		NvimTreeLspDiagnosticsWarning     = { link = "KapeYellowSign" },
		NvimTreeLspDiagnosticsInformation = { link = "KapeBlueSign" },
		NvimTreeLspDiagnosticsHint        = { link = "KapeVioletSign" },

		-- Misc
		NvimTreePopup            = { fg = p.fg0,    bg = p.bg2 },
		NvimTreeBookmark         = { link = "KapeViolet" },
		NvimTreeLiveFilterPrefix = { link = "KapeRed" },
		NvimTreeLiveFilterValue  = { fg = p.fg0,    bold = true },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
