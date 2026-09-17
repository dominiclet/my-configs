-- copy-path.lua copies the current file's path and line number(s) to the clipboard
-- Normal mode copies a single line, visual mode copies the selected line range

local function relative_path()
    return vim.fn.expand("%:.")
end

local function copy_and_notify(text)
    vim.fn.setreg("+", text)
    print("Copied: " .. text)
end

local function copy_normal()
    local line = vim.fn.line(".")
    copy_and_notify(string.format("%s:%d", relative_path(), line))
end

local function copy_visual()
    -- Exiting visual mode sets the '< and '> marks to the selection bounds
    vim.cmd("normal! \27")
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    local path = relative_path()
    if start_line == end_line then
        copy_and_notify(string.format("%s:%d", path, start_line))
    else
        copy_and_notify(string.format("%s:%d-%d", path, start_line, end_line))
    end
end

vim.keymap.set("n", "<leader>cl", copy_normal, { noremap = true, desc = "Copy file path with line number" })
vim.keymap.set("x", "<leader>cl", copy_visual, { noremap = true, desc = "Copy file path with line range" })
