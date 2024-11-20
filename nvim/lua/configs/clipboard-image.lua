local present, cImage = pcall(require, "clipboard-image")
if not present then return end

local config = {
  -- Default configuration for all filetype
  default = {
    img_dir = "img",
    img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
    affix = "\\begin{center} \n \\includegraphics[width=4.3 cm]{%s}\n \\end{center} \n" -- Multi lines affix
  },
  -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
  -- Missing options from `markdown` field will be replaced by options from `default` field
  markdown = {
    img_dir = {"src", "assets", "images"}, -- Use table for nested dir (New feature form PR #20)
    img_dir_txt = "/assets/images",
    img_handler = function(img) -- New feature from PR #22
      local script = string.format('./image_compressor.sh "%s"', img.path)
      os.execute(script)
    end,
  }
}

cImage.setup(config)

