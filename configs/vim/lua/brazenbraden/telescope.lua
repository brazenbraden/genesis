local actions = require("telescope.actions")
local previewers = require('telescope.previewers')
local Job = require('plenary.job')

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  filepath = vim.fn.expand(filepath)

  Job:new({
    command = 'file',
    args = { '--mime-type', '-b', filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], '/')[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
        end)
      end
    end
  }):sync()

  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 10000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require("telescope").setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    file_ignore_patterns = { "node_modules", "erd.dot" },
    buffer_previewer_maker = new_maker,

    winblend = 20,
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 140,
      },
      vertical = {
        preview_cutoff = 40,
        prompt_position = "bottom",
      },
      horizontal = {
        width = 0.9,
        height = 0.8,
      },
    },

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<esc>"] = actions.close,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
  -- https://gitter.im/nvim-telescope/community?at=6113b874025d436054c468e6 Fabian David Schmidt
  -- find_files = {
  --   on_input_filter_cb = function(prompt)
  --     local find_colon = string.find(prompt, ":")
  --     if find_colon then
  --       local ret = string.sub(prompt, 1, find_colon - 1)
  --       vim.schedule(function()
  --         local prompt_bufnr = vim.api.nvim_get_current_buf()
  --         local picker = action_state.get_current_picker(prompt_bufnr)
  --         local lnum = tonumber(prompt:sub(find_colon + 1))
  --         if type(lnum) == "number" then
  --           local win = picker.previewer.state.winid
  --           local bufnr = picker.previewer.state.bufnr
  --           local line_count = vim.api.nvim_buf_line_count(bufnr)
  --           vim.api.nvim_win_set_cursor(win, { math.max(1, math.min(lnum, line_count)), 0 })
  --         end
  --       end)
  --       return { prompt = ret }
  --     end
  --   end,
  --   attach_mappings = function()
  --     actions.select_default:enhance({
  --       post = function()
  --         -- if we found something, go to line
  --         local prompt = action_state.get_current_line()
  --         local find_colon = string.find(prompt, ":")
  --         if find_colon then
  --           local lnum = tonumber(prompt:sub(find_colon + 1))
  --           vim.api.nvim_win_set_cursor(0, { lnum, 0 })
  --         end
  --       end,
  --     })
  --     return true
  --   end,
  -- },
})

require("telescope").load_extension("fzy_native")

local M = {}

-- Revert to find_files if not in a git directory
M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

-- M.search_dotfiles = function()
--   require("telescope.builtin").find_files({
--     prompt_title = "< VimRC >",
--     cwd = vim.env.DOTFILES,
--     hidden = true,
--   })
-- end

return M
