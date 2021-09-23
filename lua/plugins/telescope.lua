local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "λ -> ",
    selection_caret = "|> ",
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    -- Don't pass to normal mode with ESC, problem with telescope-project
    -- mappings = {
    --   i = {
    --     ["<esc>"] = actions.close,
    --   },
    -- },
  },
  extensions = {
    fzy_native = {
      -- fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  }
}

-- Extensions

require('telescope').load_extension('octo')
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('ultisnips')
require('telescope').load_extension('project')

-- Implement delta as previewer for diffs

local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local conf = require('telescope.config')
local M = {}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- this is for status
    -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
    -- just do an if and return a different command
    if entry.status == '??' or 'A ' then
      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
    end

    -- note we can't use pipes
    -- this command is for git_commits and git_bcommits
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }

  end
}

M.my_git_commits = function(opts)
  opts = opts or {}
--  opts.previewer = delta

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
--  opts.previewer = delta

  builtin.git_bcommits(opts)
end

M.my_git_status = function(opts)
  opts = opts or {}
  --  opts.previewer = delta

  builtin.git_status(opts)
end

M.my_note = function(opts)
  builtin.live_grep { prompt_title = ' Note ', cwd = '~/Note' }
end

M.project_files = function()
  local opts = {}
  opts.hidden = true
  opts.file_ignore_patterns = { "node_modules", ".git" }
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
  -- require'telescope.builtin'.find_files(opts)
end

return M
