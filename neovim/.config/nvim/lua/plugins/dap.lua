return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'theHamsta/nvim-dap-virtual-text', -- Show variable values in virtual text
        'jay-babu/mason-nvim-dap.nvim', -- Automatic DAP configuration
        'williamboman/mason.nvim',
    },
    config = function()
        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'Error' })
        vim.fn.sign_define('DapBreakpointCondition', { text = 'לּ', texthl = 'Error' })
        vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'Directory' })
        vim.fn.sign_define('DapStopped', { text = 'ﰲ', texthl = 'TSConstant' })
        vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'Error' })

        -- Automatically set up installed DAP adapters
        require('mason-nvim-dap').setup({ automatic_setup = true })
        require('mason-nvim-dap').setup_handlers()
        -- DAP virtual text --
        require('nvim-dap-virtual-text').setup()
    end
}
