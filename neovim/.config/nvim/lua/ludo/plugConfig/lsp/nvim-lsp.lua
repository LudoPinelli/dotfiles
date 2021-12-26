local lsp_installer = require("nvim-lsp-installer")

local on_attach = function(client, bufnr)
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre,InsertLeave <buffer> lua vim.lsp.buf.formatting_sync()")
	end

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp_omnifunc")

	local opts = { noremap = true, silent = true }

	-- ee `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<space>fr", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Include the servers you want to have installed by default below
local servers = {
	"bashls",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tsserver",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

lsp_installer.on_server_ready(function(server)
	-- Specify the default options which we'll use to setup all servers
	local default_opts = {
		on_attach = on_attach,
	}

	local server_opts = {
		["rust_analyzer"] = function()
			default_opts.setting = {
				on_attach = function(client)
					client.resolved_capabilities.document_formatting = false
					client.resolved_capabilities.document_range_formatting = false
				end,
				cargo = { loadOutDirsFromCheck = true },
				procMacro = { enable = true },
			}
		end,
		["sumneko_lua"] = function()
			default_opts.settings = {
				Lua = {
					runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
					completion = { enable = true, callSnippet = "Both" },
					diagnostics = {
						enable = true,
						globals = { "vim", "describe" },
						disable = { "lowercase-global" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
				},
			}
		end,
	}

	local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
	server:setup(server_options)
end)

require("rust-tools").setup({
	tools = {
		autoSetHints = true,
		hover_with_actions = true,
		runnable = {
			use_telescope = true,
		},
	},
})
require("rust-tools").ft = { "rust", "rs" }
