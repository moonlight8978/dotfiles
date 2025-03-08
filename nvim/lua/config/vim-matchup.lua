vim.g.matchup_matchparen_deferred = 1 -- Improve performance
vim.g.matchup_matchparen_timeout = 100 -- Timeout for normal mode
vim.g.matchup_matchparen_insert_timeout = 30 -- Timeout for insert mode
vim.g.matchup_override_vimtex = 1 -- Enhanced matching with matchup plugin
vim.g.matchup_delim_noskips = 0 -- Enable matching inside comments/strings
vim.g.matchup_matchparen_offscreen = {
	method = "popup",
} -- Show offscreen matches in popup
