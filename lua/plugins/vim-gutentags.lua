vim.cmd('set tags+=tags,.git/tags')
vim.g.gutentags_enabled = 1
vim.g.gutentags_generate_on_missing = 1
vim.g.gutentags_generate_on_write = 1
vim.g.gutentags_resolve_symlinks = 1
vim.g.gutentags_ctags_tagfile = '.git/tags'
vim.g.gutentags_project_root = { 'package.json', '.git' }
vim.g.gutentags_ctags_extra_args = { '--fields=+l' }
vim.g.gutentags_add_default_project_roots = 0
vim.g.gutentags_ctags_executable_ruby = 'ripper-tags'
-- vim.g.gutentags_ctags_extra_args = { '--recursive' }
-- vim.g.gutentags_trace = 1
-- vim.g.gutentags_ctags_exclude = { '*.git', '*.svg', '*.hg', '*/tests/*', 'build', 'dist', '*sites/*/files/*', 'bin', 'node_modules', 'bower_components','cache', 'compiled', 'docs', 'example', 'bundle', 'vendor', '*.md', '*-lock.json', '*.lock', '*bundle*.js', '*build*.js', '.*rc*', '*.json', '*.min.*','*.map', '*.bak', '*.zip', '*.pyc', '*.class', '*.sln', '*.Master', '*.csproj', '*.tmp', '*.csproj.user', '*.cache', '*.pdb', 'tags*', 'cscope.*', '*.css', '*.less', '*.scss', '*.exe', '*.dll', '*.mp3', '*.ogg', '*.flac', '*.swp', '*.swo', '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2', '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', }

