local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Change diagnostic signs in the gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = false,
	-- virtual_text = {
	-- 	prefix = "", -- Could be '●', '▎', 'x'
	-- 	source = "if_many", -- Or "always"
	-- },
	float = {
		source = "always", -- Or "if_many"
	},
	underline = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<Leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<Leader>lD", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	-- buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<Leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
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

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp_installer.on_server_ready(function(server)
	-- Specify the default options which we'll use to setup all servers
	local opts = {
		on_attach = on_attach,
	}

	-- Rust
	if server.name == "rust_analyzer" then
		local rustopts = {
			on_attach = on_attach,
			tools = {
				autoSetHints = true,
				hover_with_actions = true,
				inlay_hints = {
					show_parameter_hints = true,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
				},
			},
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts, {
				settings = {
					["rust-analyzer"] = { checkOnSave = { command = "clippy" } },
				},
			}),
		}
		require("rust-tools").setup(rustopts)
		server:attach_buffers()

		-- Lua
	elseif server.name == "sumneko_lua" then
		local luaopts = {
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = runtime_path,
					},
					diagnostics = {
						globals = { "vim" },
						disable = { "lowercase-global" }, --, "different-requires" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		}
		server:setup(luaopts)

		-- Python
	elseif server.name == "pyright" then
		local pyopts = {
			on_attach = on_attach,
			flags = {
				allow_incremental_sync = true,
			},
			single_file_support = true,
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
					},
				},
			},
		}
		server:setup(pyopts)
	else
		server:setup(opts)
	end
end)
