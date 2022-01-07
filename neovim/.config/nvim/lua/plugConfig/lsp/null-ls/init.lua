local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local function sources()
	if jit.os ~= "Windows" then
		return {
			formatting.stylua,
			formatting.autopep8,
			formatting.prettier,
			formatting.shellharden,
			formatting.taplo,
			diagnostics.shellcheck,
		}
	else
		return {
			formatting.stylua,
			formatting.autopep8,
			formatting.prettier,
			formatting.taplo,
			diagnostics.shellcheck,
		}
	end
end

null_ls.setup({
	sources = sources(),

	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
