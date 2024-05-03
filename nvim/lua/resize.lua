-- resize.lua allows the split resize keys to be repeated easily
-- Implements a "resize mode" that is triggered when a resize command is made
-- In "resize mode", resizing operations can be continued by repeatedly pressing the same key

-- 0.5 second
WAIT_THRESHOLD = 500000000
-- 0.6 seconds to allow some buffer between WAIT_THRESHOLD
DEFER_MS = 600

time_monotonic = 0

local function update_timestamp()
    time_monotonic = vim.loop.hrtime()
end

local function exit_resize_mode()
    local curr_mono_time = vim.loop.hrtime()
    -- If WAIT_THRESHOLD ns has passed, then exit resize mode
    if (curr_mono_time - time_monotonic >= WAIT_THRESHOLD) then
        print("Exit resize mode")
        vim.cmd("silent! nunmap >")
        vim.cmd("silent! nunmap <")
        vim.cmd("silent! nunmap +")
        vim.cmd("silent! nunmap -")
    end
end

local function vert_resize(larger)
    if (larger) then
        vim.cmd("vertical resize +2<CR>")
    else
        vim.cmd("vertical resize -2<CR>")
    end
    update_timestamp()
    vim.defer_fn(exit_resize_mode, DEFER_MS)
end

local function horizontal_resize(larger)
    if (larger) then
        vim.cmd("resize +2<CR>")
    else
        vim.cmd("resize -2<CR>")
    end
    update_timestamp()
    vim.defer_fn(exit_resize_mode, DEFER_MS)

end

local function enter_resize_mode()
    print("Enter resize mode")
    vim.keymap.set('n', '>', function()
        vert_resize(true)
    end, {})
    vim.keymap.set('n', '<', function()
        vert_resize(false)
    end, {})
    vim.keymap.set('n', '+', function()
        horizontal_resize(true)
    end, {})
    vim.keymap.set('n', '-', function()
        horizontal_resize(false)
    end, {})
end

vim.keymap.set('n', '<C-W>>', function()
    enter_resize_mode()
    vert_resize(true)
end, { noremap = true })

vim.keymap.set('n', '<C-W><', function()
    enter_resize_mode()
    vert_resize(false)
end, { noremap = true })

vim.keymap.set('n', '<C-W>+', function()
    enter_resize_mode()
    horizontal_resize(true)
end, { noremap = true })

vim.keymap.set('n', '<C-W>-', function()
    enter_resize_mode()
    horizontal_resize(false)
end, { noremap = true })
