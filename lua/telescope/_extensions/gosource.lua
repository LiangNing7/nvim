-- Telescope extension for browsing Go standard library source code
local telescope = require("telescope")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values
local fn = vim.fn

local golang_source = function()
	local root
	local result = {}
	local os_name = vim.loop.os_uname().sysname

	if os_name == "Darwin" then
		if fn.isdirectory("/usr/local/go") == 1 then
			root = "/usr/local/go/src/"
		else
			root = fn.globpath("/usr/local/Cellar/go", "*") .. "/libexec/src/"
		end
	elseif os_name == "Linux" then
		if fn.isdirectory("/usr/local/go") == 1 then
			root = "/usr/local/go/src/"
		elseif fn.isdirectory("/usr/lib/go") == 1 then
			root = "/usr/lib/go/src/"
		end
	elseif os_name == "Windows_NT" then
		-- Windows Go installation paths
		local goroot = os.getenv("GOROOT")
		if goroot then
			root = goroot .. "\\src\\"
		else
			-- Try common Windows Go installation paths
			if fn.isdirectory("C:\\Go\\src") == 1 then
				root = "C:\\Go\\src\\"
			elseif fn.isdirectory("C:\\Program Files\\Go\\src") == 1 then
				root = "C:\\Program Files\\Go\\src\\"
			end
		end
	end

	if not root or root == "" then
		vim.notify("Go source directory not found", vim.log.levels.WARN)
		return result
	end

	local dicts = fn.split(fn.globpath(root, "*"))

	for _, dict in pairs(dicts) do
		local f = fn.split(fn.globpath(dict, "*.go"))
		if next(f) ~= nil then
			for _, val in pairs(f) do
				table.insert(result, val)
			end
		end
	end

	return result
end

local gosource = function(opts)
	opts = opts or {}
	local results = golang_source()

	if #results == 0 then
		vim.notify("No Go source files found", vim.log.levels.WARN)
		return
	end

	pickers
		.new(opts, {
			prompt_title = "Find In Go Root",
			results_title = "Go Source Code",
			finder = finders.new_table({
				results = results,
				entry_maker = make_entry.gen_from_file(opts),
			}),
			previewer = conf.file_previewer(opts),
			sorter = conf.file_sorter(opts),
		})
		:find()
end

return telescope.register_extension({
	exports = {
		gosource = gosource,
	},
})
