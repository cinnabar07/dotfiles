return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("configs.tokyonight")
    end
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "cpp", "c", "python"
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "prettier",
        "stylua",
        "clangd",
        "pyright",
        "rls",
        "asm_lsp"
      },
    },
  },

  -- {
  --   "andweeb/presence.nvim",
  --   config = function()
  --     require("presence").setup({
  --       -- General options
  --       auto_update         = true,                   -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
  --       neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
  --       main_image          = "neovim",               -- Main image display (either "neovim" or "file")
  --       log_level           = nil,                    -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  --       debounce_timeout    = 10,                     -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  --       enable_line_number  = false,                  -- Displays the current line number instead of the current project
  --       blacklist           = {},                     -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  --       buttons             = true,                   -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  --       file_assets         = {},                     -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  --       show_time           = true,                   -- Show the timer
  --
  --       -- Rich Presence text options
  --       editing_text        = "Editing %s",     -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  --       file_explorer_text  = "Browsing %s",    -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
  --       git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  --       plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  --       reading_text        = "Reading %s",     -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  --       workspace_text      = "Working on %s",  -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  --       line_number_text    = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
  --     })
  --   end,
  --   lazy = false
  -- },
  -- {
  --   "zbirenbaum/nvterm",
  --   config = function()
  --     require "configs.nvterm"
  --   end,
  --   lazy = false,
  -- },
  {
    "rainbowhxch/accelerated-jk.nvim",
    config = function()
      require "configs.jk"
    end,
    lazy = false,
  },
  {
    "ggandor/leap.nvim",
    requires = {
      { "tpope/vim-repeat" }
    },
    config = function()
      require('configs.leap')
    end,
    lazy = false,
  },

  {
    "andymass/vim-matchup",
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require "configs.nvim-notify"
    end,
    lazy = false,
  },

  {
    "img-paste-devs/img-paste.vim",
    lazy = false
  },

  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
  },


  -- {
  --   "lervag/vimtex",
  -- opt = true,
  -- config = function()
  --   require "configs.vimtex"
  -- end
  -- setup = function()
  --   vim.cmd([[autocmd BufEnter *.tex lua require'utils'.lazy_load("vimtex")]])
  -- end
  -- },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require "configs.neoscroll"
    end,
    lazy = false
  },

  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { "nvim-telescope/telescope.nvim" }
    },
    config = function()
      require("neoclip").setup()
    end,
    lazy = false
  },

  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
    lazy = false
  },

  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false, -- Recommended
  --   -- ft = "markdown" -- If you decide to lazy-load anyway
  --
  --   dependencies = {
  --     -- You will not need this if you installed the
  --     -- parsers manually
  --     -- Or if the parsers are in your $RUNTIMEPATH
  --     "nvim-treesitter/nvim-treesitter",
  --
  --     "nvim-tree/nvim-web-devicons"
  --   }
  -- },

  -- NOTE: This one might consume a lot of memory
  -- {
  --   "codota/tabnine-nvim",
  --   build = "./dl_binaries.sh",
  --   config = function()
  --     require "configs.tabnine-nvim"
  --   end,
  --   lazy = false
  -- },

  ---- lsp

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "configs.null-ls"
    end
  },

  {
    "glepnir/lspsaga.nvim",
    config = function()
      require "configs.lspsaga"
    end
  },

  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require("refactoring").setup {}
      -- require("telescope").load_extension("refactoring")
    end
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require "configs.luasnip"
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end
  },

  -------------------

  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("configs.nvim-treesitter-context")
    end,
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "configs.ibl"
    end
  },
  {
    "echasnovski/mini.cursorword",
    config = function()
      require('mini.cursorword').setup()
    end,
    lazy = false
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
    lazy = true
  },

  -- {
  --   "tpope/vim-obsession",
  -- },

  -- NOTE: Appearance
  -- {
  --   "sunjon/shade.nvim",
  --   config = function ()
  --     require("configs.shade")
  --   end,
  --   lazy = false
  --
  -- },
  {
    "SmiteshP/nvim-navic",
    requires = { "neovim/nvim-lspconfig" },
    config = function()
      require("nvim-navic").setup()
    end,
    lazy = false,
  },

  {
    'crusj/bookmarks.nvim',
    keys = {
      { "<leader>bm", mode = { "n" } },
    },
    branch = 'main',
    dependencies = { 'nvim-web-devicons' },
    config = function()
      require("bookmarks").setup({
        keymap = {
          toggle = "<leader>bm",
        }
      })
      require("telescope").load_extension("bookmarks")
    end
  }

}
