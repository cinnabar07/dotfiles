local M = {}
local api = vim.api
local fn = vim.fn
local cmd = api.nvim_command
--

M.delete_buffer = function()
    local buflisted = fn.getbufinfo({buflisted = 1})
    local cur_winnr, cur_bufnr = fn.winnr(), fn.bufnr()
    if #buflisted < 2 then
        cmd 'confirm qall'
        return
    end
    for _, winid in ipairs(fn.getbufinfo(cur_bufnr)[1].windows) do
        cmd(string.format('%d wincmd w', fn.win_id2win(winid)))
        cmd(cur_bufnr == buflisted[#buflisted].bufnr and 'bp' or 'bn')
    end
    cmd(string.format('%d wincmd w', cur_winnr))
    local is_terminal = fn.getbufvar(cur_bufnr, '&buftype') == 'terminal'
    cmd(is_terminal and 'bd! #' or 'silent! confirm bd #')
end

M.get_v8_url = function (need_copy, need_commit)
  -- Get the current file path and line number
  local filepath = fn.expand('%:p')  -- Absolute path of current file
  local line_number = fn.line('.')

  -- Search for "v8" directory in current or parent directories
  local v8_dir = filepath:match("(.*/v8/)") or filepath:match("(.*)/v8/")
  if not v8_dir then
    print("v8 directory not found in current or parent directories")
    return
  end

  -- Get the current Git commit hash
  local commit = "main"

  if need_commit then
    commit = fn.systemlist("git rev-parse HEAD")[1]
    if not commit then
      print("Failed to retrieve Git commit hash")
      return
    end
  end

  -- Construct the relative path from "v8/" to current file
  local relative_path = filepath:sub(#v8_dir)
  local final_path = "v8" .. relative_path

  -- Construct the URL
  local url = string.format("https://source.chromium.org/chromium/chromium/src/+/%s:%s;l=%d", commit, final_path, line_number)

  -- Copy the URL to clipboard
  if need_copy then
    fn.setreg('+', url)
    print("URL copied to clipboard:", url)
  end
  return url
end

-- Function to open the URL in the browser
M.open_v8_url = function (need_commit)
  local url = M.get_v8_url(false, need_commit) -- Get the URL from clipboard
  if url and url:match("^https://") then
    -- Open in the default web browser
    -- TODO: @An change this if needed
    print("URL opened:", url)
    fn.jobstart({ "xdg-open", url }, { detach = true })
  else
    print("No valid URL to open")
  end
end

return M
