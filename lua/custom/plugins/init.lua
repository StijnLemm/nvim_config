-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'kdheepak/lazygit.nvim',
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false, priority = 1000 },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    'kndndrj/nvim-dbee',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require('dbee').install 'go'
    end,
    config = function()
      require('dbee').setup {
        sources = {
          require('dbee.sources').FileSource:new(vim.fn.stdpath 'config' .. '/dbee_connections.json'),
          require('dbee.sources').FileSource:new(vim.fn.stdpath 'cache' .. '/dbee/persistence.json'),
        },
        editor = {
          directory = nil,
        },
      }
    end,
  },
  {
    'github/copilot.vim',
    config = function()
      -- Optional: customize key mappings
      vim.keymap.set('i', '<C-a>', 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.set('i', '<C-j>', 'copilot#Next()', { silent = true })
      vim.keymap.set('i', '<C-k>', 'copilot#Previous()', { silent = true })
    end,
  },
  {
    'manuuurino/autoread.nvim',
    cmd = 'Autoread',
    opts = {},
  },
}
