local nvim_lsp = require('lspconfig')
local which_key = require("which-key")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
--  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

local keymap_local = {
	l = {
		name = "Code",
		r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
		a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action"},
		d = {"<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics"},
		i = {"<cmd>LspInfo<CR>", "Lsp Info"},
	}
}

-- if client.resolved_capabilities.document_formatting then 
-- 	keymap_local.l.f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document"},
-- end

local keymap_global = {
		name = "Goto",
		d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Definition"},
		D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
		-- s = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"},
		I = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation"},
		t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type definition"},
		o = {"<C-o>", "Goto back definition"},
}
which_key.register(keymap_local, {buffer = bufnr, prefix = "<leader>"})
which_key.register(keymap_global, {buffer = bufnr, prefix = "g"})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local servers = {'sumneko_lua', 'cssls', 'emmet_ls', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require'lspconfig'.sumneko_lua.setup {
    -- ... other configs
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
