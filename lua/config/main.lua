local vim_cache
if vim.g.cfg_vim_chache == nil then
  if vim.fn.has('win32') then
    vim_cache = vim.fn.expand('$HOME/vimfiles/')
  else
    vim_cache = vim.fn.expand('$HOME/.vim/')
  end
else
  vim_cache = vim.g.cfg_vim_chache
end

vim.g.vim_cache = vim_cache

--add vim-plug to runtime path
vim.opt.runtimepath:append(','..vim.g.vim_cache..'bundle/vim-plug')


vim.opt.spell = true
vim.opt.spelllang = { 'en' }

-- Map leader to spacebar and unmap movement from spacebar
vim.g.mapleader = ' '
vim.keymap.set({'n'}, '<Space>', '')

-- unmap arrows
vim.keymap.set({'n', 'v', 'i'}, '<Up>',     '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Down>',   '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Left>',   '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Right>',  '<Nop>')

-- map Del key to Backspace
vim.keymap.set({'n', 'i'}, '<Up>', '<BS>', { noremap = true })

-- fsync on windows might be slow
if vim.fn.has('win32') then
  vim.opt.fsync = false
end


--set language
vim.opt.langmenu = nil
vim.opt.encoding = 'utf-8'
if vim.fn.has('win32') then
  vim.cmd [[language messages en_GB]]
else
  vim.cmd [[language messages en_US.utf8]]
end

local isWsl = false
local uname = vim.fn.substitute(vim.fn.system('uname'),'\n','','')
if uname == 'Linux' then
  local lines = vim.fn.readfile("/proc/version")
  if  string.find(lines[0], "Microsoft") then
    isWsl = true
  end
end

vim.keymap.set('n', '<leader>m', function() vim.cmd[[echo 123]] end)

vim.opt.filetype.plugin = true;
--indent on

vim.keymap.set({'n'}, '<leader>ev', ':e $HOME/vimfiles/init.lua<cr>', {silent})
vim.keymap.set({'n'}, '<leader>sv', ':so $HOME/vimfiles/init.lua<cr>', {silent})

-- copy & paste to system clipboard with <space>p and <space>y:
vim.keymap.set({'v'}, '<leader>y', [["+y]])
vim.keymap.set({'v'}, '<leader>d', [["+d]])
vim.keymap.set({'n'}, '<leader>p', [["+p]])
vim.keymap.set({'n'}, '<leader>p', [["+p]])
vim.keymap.set({'v'}, '<leader>p', [["+p]])
vim.keymap.set({'v'}, '<leader>p', [["+p]])

-- tab settings
vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.smarttab = true
vim.opt.expandtab =true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- nonprint symbols display
vim.opt.listchars = {tab = " ‣", eol = "↩", space = '.'}
vim.opt.list = true

vim.opt.colorcolumn = "80"

vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.backup = false
vim.opt.swapfile = false

-- use system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- set similar search format for windows findstr as for defaoult vimgrep
vim.opt.grepprg= [[ findstr /n\ /s ]]

--Use ctrl-[hjkl] to select the active split!
vim.keymap.set( {'n'}, '<C-k>', ':wincmd k<CR>', {silent})
vim.keymap.set( {'n'}, '<C-j>', ':wincmd j<CR>', {silent})
vim.keymap.set( {'n'}, '<C-h>', ':wincmd h<CR>', {silent})
vim.keymap.set( {'n'}, '<C-l>', ':wincmd l<CR>', {silent})

if isWsl then
  vim.g.vim_perforce_executable = 'p4.exe'
  vim.g.perforce_use_cygpath = 1
end

--Disable beeping
vim.opt.errorbells = false
vim.opt.visualbell = false

vim.cmd [[ set formatoptions-=o ]]
