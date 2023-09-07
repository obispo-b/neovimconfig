---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>h"] = { "<cmd> Nvdash <CR>", "Open Nvdash" },
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
    ["<leader>w"] = {
      function()
        vim.lsp.buf.format()
        vim.cmd "w"
      end,
      "Save",
    },
    ["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<CR>", desc = "Search document symbols" },
    ["<leader>ld"] = { "<cmd>Telescope diagnostics<CR>", desc = "Show document diagnostics" },
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
