local plugin = "My Awesome Plugin"

vim.notify = require("notify")

vim.notify("This is an error message.\nSomething went wrong!", "error", {
	title = plugin,
	on_open = function()
		vim.notify("Attempting recovery.", vim.log.levels.WARN, {
			title = plugin,
		})
		local timer = vim.loop.new_timer()
		timer:start(2000, 0, function()
			vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
				title = plugin,
				timeout = 3000,
				on_close = function()
					vim.notify("Problem solved", nil, { title = plugin })
					vim.notify("Error code 0x0395AF", 1, { title = plugin })
				end,
			})
		end)
	end,
})

-- -- Utility functions shared between progress reports for LSP and DAP
--
-- local client_notifs = {}
--
-- local function get_notif_data(client_id, token)
--  if not client_notifs[client_id] then
--    client_notifs[client_id] = {}
--  end
--
--  if not client_notifs[client_id][token] then
--    client_notifs[client_id][token] = {}
--  end
--
--  return client_notifs[client_id][token]
-- end
--
--
-- local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
--
-- local function update_spinner(client_id, token)
--  local notif_data = get_notif_data(client_id, token)
--
--  if notif_data.spinner then
--    local new_spinner = (notif_data.spinner + 1) % #spinner_frames
--    notif_data.spinner = new_spinner
--
--    notif_data.notification = vim.notify(nil, nil, {
--      hide_from_history = true,
--      icon = spinner_frames[new_spinner],
--      replace = notif_data.notification,
--    })
--
--    vim.defer_fn(function()
--      update_spinner(client_id, token)
--    end, 100)
--  end
-- end
--
-- local function format_title(title, client_name)
--  return client_name .. (#title > 0 and ": " .. title or "")
-- end
--
-- local function format_message(message, percentage)
--  return (percentage and percentage .. "%\t" or "") .. (message or "")
-- end
