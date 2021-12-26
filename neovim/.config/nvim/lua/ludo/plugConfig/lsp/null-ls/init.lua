local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.stylua,
	formatting.autopep8,
	formatting.prettier,
	formatting.shellharden,
	formatting.taplo,
	diagnostics.shellcheck,
}

null_ls.setup({
	sources = sources,

	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre,InsertLeave <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
