return {
  {
    'jaawerth/fennel.vim',
    ft = 'fennel',
  },
  {
    'gpanders/nvim-parinfer',
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    -- event = 'VeryLazy',
    -- event = { "BufReadPost", "BufNewFile" },
    -- main = 'rainbow-delimiters.setup',
    config = function ()
      local rainbow_delimiters = require 'rainbow-delimiters'
      require('rainbow-delimiters.setup').setup {
        strategy = {
            [''] = rainbow_delimiters.strategy['global'],
            vim = rainbow_delimiters.strategy['local'],
        },
        query = {
            [''] = 'rainbow-delimiters',
            lua = 'rainbow-blocks',
        },
        highlight = {
            'RainbowDelimiterRed',
            'RainbowDelimiterYellow',
            'RainbowDelimiterBlue',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterCyan',
        },
      }
    end
  },
}
