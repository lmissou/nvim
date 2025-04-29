---------- bookmarks

local M = {
  'tomasky/bookmarks.nvim',
  dependencies = {
    'folke/snacks.nvim' -- use snacks picker
  },
  event = "VeryLazy",
  opts = {
    -- sign_priority = 8,  --set bookmark sign priority to cover other sign
    save_file = vim.fn.stdpath('data') .. '/.bookmarks', -- bookmarks save file path
    keywords = {
      ["@t"] = " ", -- mark annotation startswith @t ,signs this icon as `Todo`
      ["@w"] = " ", -- mark annotation startswith @w ,signs this icon as `Warn`
      ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
      ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
    },
  },
  keys = {
    { '<leader>m',  desc = 'Bookmark' },
    -- add or remove bookmark at current line
    { '<leader>mm', mode = 'n',       function() require('bookmarks').bookmark_toggle() end,    desc = 'Bookmark Toggle' },
    -- add or edit mark annotation at current line
    { '<leader>mM', mode = 'n',       function() require('bookmarks').bookmark_ann() end,       desc = 'Bookmark Ann', },
    -- clean all marks in local buffer
    { '<leader>mc', mode = 'n',       function() require('bookmarks').bookmark_clean() end,     desc = 'Bookmark Clean', },
    -- clean all bookmarks
    { '<leader>mC', mode = 'n',       function() require('bookmarks').bookmark_clear_all() end, desc = 'Bookmark Clear All', },
    -- jump to next mark in local buffer
    { '<leader>mn', mode = 'n',       function() require('bookmarks').bookmark_next() end,      desc = 'Bookmark Next', },
    -- jump to previous mark in local buffer
    { '<leader>mp', mode = 'n',       function() require('bookmarks').bookmark_prev() end,      desc = 'Bookmark Prev', },
    -- show marked file list
    { '<leader>ml', mode = 'n',       function() require('snacks.picker').bookmarks() end,      desc = 'Bookmark List', },
  },
  config = function(_, opts)
    require('bookmarks').setup(opts)
    local picker = require('snacks.picker')
    picker.sources.bookmarks = {
      format = function(item, picker)
        local bookmark_config = require('bookmarks.config').config
        local picker_format = require('snacks.picker.format')
        local ret = picker_format.filename(item, picker)
        local tag = item.info.tag
        if tag ~= nil and tag ~= '' then
          local tag_icon = bookmark_config.keywords[string.sub(tag, 1, 2)]
          if tag_icon ~= nil then
            tag = tag_icon .. string.sub(tag, 3, #tag)
          end
          ret[#ret + 1] = { " | " }
          ret[#ret + 1] = { string.format("%s", tag), "BookmarkTag" }
        end
        return ret
      end,
      finder = function(opts, ctx)
        local cache_data = require('bookmarks.config').config.cache.data
        local items = {}
        for file_name, file_bookmarks in pairs(cache_data) do
          for line, bookmark in pairs(file_bookmarks) do
            local info = {
              file = file_name,
              pos = { tonumber(line), 0 },
              tag = bookmark.a or '',
              line_preview = bookmark.m or '',
            }
            table.insert(items, {
              file = info.file,
              pos = info.pos,
              text = info.tag .. info.line_preview .. file_name,
              info = info,
            })
          end
        end
        return ctx.filter:filter(items)
      end
    }
  end,
}

return M
