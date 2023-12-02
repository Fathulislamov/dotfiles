set number           "Включить нумерацию строк
set nowrap           "Не переносить строку
set tabstop=2        "Настройка ширины таба
set shiftwidth=2     "Настройка ширины таба
set smarttab         "Настройка ширины таба
set expandtab        "Настройка ширины таба
set noswapfile       "Отключение создания своп файлов
syntax on            "Включение подсветки синтаксиса
"set foldcolumn=2    "Отступы от левого края экрана
set guitablabel=%t   "Во вкладках отображать только название файла 
set termguicolors    "Устанавливает 256 цветов
"set mouse=a         "Поддержка мыши

imap <C-s> <Esc>:w <CR>
nmap <C-s> <Esc>:w <CR>
nmap <F12> :source ~/.config/nvim/init.vim <CR>
imap jj <Esc> 


" Установка шрифтов WebIcons
" Скачать в папку .fonts https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Ubuntu/Medium/complete/Ubuntu%20Medium%20Nerd%20Font%20Complete.ttf
" Установить в настройках шрифт
" Перезапустить терминал 
" Вернуть шрифт по умолчанию

:let g:completion_trigger_character = ['.']

call plug#begin(stdpath('data') . '/plugged')
Plug 'digitaltoad/vim-pug'                       " Устанавливает плагины
Plug 'kyazdani42/nvim-web-devicons'              " для значков файлов 
Plug 'kyazdani42/nvim-tree.lua'                  " Проводник
Plug 'Jeetsukumaran/vim-buffergator'
Plug 'xolox/vim-misc'
Plug 'feline-nvim/feline.nvim'
Plug 'sickill/vim-monokai'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox' 
Plug 'voldikss/vim-floaterm' "Терминал          
" 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For luasnip users.
"Plug 'L3MON4D3/LuaSnip'
"Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()




" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'


set completeopt=menu,menuone,noselect


lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
 -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
 --   capabilities = capabilities
 -- }
EOF

"Цветовые схемы
"colorscheme delek 
"colorscheme landscape 
"colorscheme monokai
"colorscheme xterm16 
"colorscheme visualstudio 
"colorscheme tayra 
"colorscheme tango2 
"colorscheme gruvbox 
colorscheme codedark


let g:nvim_tree_quit_on_open = 1               " 0 по умолчанию, закрывает дерево при открытии файла
let g:nvim_tree_indent_markers = 1             " 0 по умолчанию, эта опция показывает маркеры отступа, когда папки открыты
let g:nvim_tree_git_hl =  1                    " 0 по умолчанию, включит подсветку файлов для атрибутов git (можно использовать без значков). 
let g:nvim_tree_highlight_opened_files = 1     " 0 по умолчанию, включит подсветку значков папок и файлов для открытых файлов/каталогов.
let g:nvim_tree_root_folder_modifier = ':~'    " Это по умолчанию См:. Справки имя_файла-модификаторы для более вариантов
let g:nvim_tree_add_trailing = 1               " 0 по умолчанию, добавьте косую черту в названиях папок
let g:nvim_tree_group_empty = 1                " 0 по умолчанию, компактный папки, которые содержат только одну папку в один узел в дереве файлов
let g:nvim_tree_disable_window_picker = 1      " 0 по умолчанию отключит средство выбора окон.
let g:nvim_tree_icon_padding = ' '             " один пробел по умолчанию, используемый для рендеринга пробела между значком и именем файла. Используйте с осторожностью, это может нарушить рендеринг, если вы установите пустую строку в зависимости от вашего шрифта. 
let g:nvim_tree_symlink_arrow = ' >> '         " по умолчанию ' ➛ '. используется как разделитель между источником и целью символических ссылок.
let g:nvim_tree_respect_buf_cwd = 1            " 0 по умолчанию изменит cwd nvim-tree на значение нового при открытии nvim-дерева.
let g:nvim_tree_create_in_closed_folder = 1    " 1 по умолчанию При создании файлов, задает путь к файлу , когда курсор находится на закрытой папки в родительской папке , когда 0, и внутри папки , когда 1. 
let g:nvim_tree_refresh_wait = 500             " 1000 по умолчанию, контроль , как часто дерево может быть обновлен, 1000 означает , что дерево может быть обновление один раз в 1000 мс. 
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Словарь" Словарь имен параметров буфера, сопоставленный со списком значений параметров, который 
" указывает средству выбора окна, что окно буфера не должно быть 
" доступным для выбора. 
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " Список имен файлов, которые выделяются с помощью NvimTreeSpecialFile 
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
" Если 0, не показать значки для одного из «git», «папка» и «файлы» 
" 1 по умолчанию, обратите внимание, что если «файлы» равны 1,будет отображаться только 
" если nvim-web-devicons установлен и находится в вашем пути выполнения. 
" если папка равна 1, вы также можете указать, чтобы folder_arrows 1 отображала маленькие стрелки рядом со значками папок. 
" но это не будет работать, если вы установите indent_markers (из-за конфликта пользовательского интерфейса) 

" по умолчанию будет отображаться значок по умолчанию, если значок не 
" указан "по умолчанию значок не отображается по умолчанию
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle и NvimTreeResize также доступны , если вам нужно их 

" settingst termguicolors " эта переменная должна быть включена для цветов , которые будут применены правильно 

" список групп можно найти на`: помощь nvim_tree_highlight `

highlight NvimTreeFolderIcon guibg=blue

lua << EOF

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
require('feline').setup()

EOF


lua << EOF
local nvim_lsp = require('lspconfig')
local configs = require('lspconfig.configs')

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
        'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end
-- nvim_lsp.ls_emmet.setup{ capabilities = capabilities }
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'ls_emmet'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF


