local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" }},
  { "nvim-treesitter/nvim-treesitter", build= ":TSUpdate" },

  -- Barbecue
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = { create_autocmd = true, attach_navic = true },
  },

  -- Alpha
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                         ",
        " ▗▄▖               ▗▄      ",
        " █▀█               ▟█  ▐▌  ",
        "▐▌ ▐▌ ▝█ █▘  ▟██▖ ▐▘█ ▐███ ",
        "▐▌█▐▌  ▐█▌  ▐▛  ▘▗▛ █  ▐▌  ",
        "▐▌ ▐▌  ▗█▖  ▐▌   ▐███▌ ▐▌  ",
        " █▄█   ▟▀▙  ▝█▄▄▌   █  ▐▙▄ ",
        " ▝▀▘  ▝▀ ▀▘  ▝▀▀    ▀   ▀▀ ",
        "                         ",
        "                         ",
      }


      dashboard.section.buttons.val = {
	dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("g", "󰈞  Live grep", ":Telescope live_grep<CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      dashboard.section.footer.val = "Emulate. Exploit. Evade. Pivot"
      dashboard.section.buttons.opts.spacing = 0	
      alpha.setup(dashboard.opts)
    end,
  },
  -- CMP + LSP
  { "hrsh7th/nvim-cmp", dependencies = {
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path", "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
  }},
  { "neovim/nvim-lspconfig" },
}

require("lazy").setup(plugins, {})
