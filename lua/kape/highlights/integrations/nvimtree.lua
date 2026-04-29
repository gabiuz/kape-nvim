local M = function(p, opts)
	local bg = opts.transparent and "NONE" or p.surface0
	local highlights = {

		-- Base
		NvimTreeNormal = { fg = p.foreground, bg = bg },
		NvimTreeNormalFloat = { fg = p.foreground, bg = bg },
		NvimTreeNormalNC = { fg = p.second_text, bg = bg },
		NvimTreeEndOfBuffer = { fg = bg },
		NvimTreeWinSeparator = { fg = p.surface2, bg = p.background },
		NvimTreeCursorLine = { bg = p.surface1 },
		NvimTreeCursorColumn = { bg = p.surface1 },

		-- Files & Folders
		NvimTreeRootFolder = { fg = p.yellow, bold = true },
		NvimTreeFolderIcon = { fg = p.yellow },
		NvimTreeFolderName = { fg = p.foreground },
		NvimTreeOpenedFolderName = { fg = p.foreground, bold = true },
		NvimTreeEmptyFolderName = { fg = p.third_text },
		NvimTreeFileName = { fg = p.foreground },
		NvimTreeFileIcon = { fg = p.second_text },
		NvimTreeSpecialFile = { fg = p.violet },
		NvimTreeSymlink = { fg = p.cyan },
		NvimTreeSymlinkIcon = { fg = p.cyan },
		NvimTreeSymlinkFolderName = { fg = p.cyan },
		NvimTreeImageFile = { fg = p.violet },
		NvimTreeExecFile = { fg = p.green },

		-- Git
		NvimTreeGitDirty = { fg = p.yellow },
		NvimTreeGitStaged = { fg = p.green },
		NvimTreeGitMerge = { fg = p.red },
		NvimTreeGitRenamed = { fg = p.violet },
		NvimTreeGitNew = { fg = p.green },
		NvimTreeGitDeleted = { fg = p.red },
		NvimTreeGitIgnored = { fg = p.third_text },

		-- Diagnostics
		NvimTreeDiagnosticErrorIcon = { fg = p.red },
		NvimTreeDiagnosticWarningIcon = { fg = p.yellow },
		NvimTreeDiagnosticInfoIcon = { fg = p.blue },
		NvimTreeDiagnosticHintIcon = { fg = p.cyan },
		NvimTreeDiagnosticErrorFileHL = { fg = p.red },
		NvimTreeDiagnosticWarningFileHL = { fg = p.yellow },
		NvimTreeDiagnosticInfoFileHL = { fg = p.blue },
		NvimTreeDiagnosticHintFileHL = { fg = p.cyan },

		-- Popup & Bookmarks
		NvimTreePopup = { fg = p.foreground, bg = p.surface1 },
		NvimTreeBookmark = { fg = p.violet },
		NvimTreeBookmarkHL = { fg = p.background, bg = p.violet },
		NvimTreeLiveFilterPrefix = { fg = p.red, bold = true },
		NvimTreeLiveFilterValue = { fg = p.foreground, bold = true },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
