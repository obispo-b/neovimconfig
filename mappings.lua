---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>o"] = {
      function()
        if vim.bo.filetype == "NvimTree" then
          vim.api.nvim_input "<C-w>l"
        else
          vim.cmd "NvimTreeFocus"
        end
      end,
      desc = "Toggle Explorer Focus",
    },
    ["<leader>q"] = {
      function()
        vim.cmd "qa!"
      end,
      "Quit without saving",
    },
    ["<leader>fd"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<leader>w"] = {
      function()
        vim.lsp.buf.format()
        vim.cmd "w"
      end,
      "Save",
    },
    -- Telescope diagnostics
    ["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<CR>", desc = "Search document symbols" },
    ["<leader>ld"] = { "<cmd>Telescope diagnostics<CR>", desc = "Show document diagnostics" },

    -- ZenMode
    ["<leader>z"] = { "<cmd>ZenMode<CR>", desc = "ZenMode" },

    -- Harpoon
    ["<leader>a"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Harpoon add file" },
    ["<leader>h"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon quick menu" },
    ["<leader>1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon to 1" },
    ["<leader>2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon to 2" },
    ["<leader>3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon to 3" },
    ["<leader>4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon to 4" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["]b"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["[b"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.disabled = {
  n = {
    ["<Tab>"] = "",
  },
}

-- more keybinds!

return M
