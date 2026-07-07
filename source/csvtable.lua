local function parse(filename)
	local rows = {}

	for line in io.lines(filename) do
		local t = {}

		for field in line:gmatch("([^,]+)") do
			t[#t+1] = field
		end

		rows[#rows+1] = t
	end

	return rows
end

local function csvloadplot(filename)
	local points = {}

	local rows = parse(filename)

	for i = 2, #rows do
		points[i - 1] = string.format("(%s, %s)", rows[i][1], rows[i][2])
	end

	context(table.concat(points, "--"))
end

interfaces.implement {
	name = "csvloadtable",
	arguments = { "string", "string"},
	public = true,
	actions = function (file, width)
		local rows = parse(file)
		local width_count = 1

		for w in string.gmatch(width, "[^,]+") do
			context(string.format("\\setupTABLE[c][%s][width=%s]", width_count, w))
			width_count = width_count + 1
		end

		local ncols = #rows[1]
		context("\\bTABLE")
		-- context(string.format("\\bTABLE[width=%.5f\\textwidth]", 1/ncols))

		for _, row in ipairs(rows) do
			context("\\bTR")

			for _, cell in ipairs(row) do
				context("\\bTD ")
				context(cell)
				context(" \\eTD")
			end

			context("\\eTR")
		end

		context("\\eTABLE")
	end,
}

interfaces.implement {
	name = "csvloadplot",
	arguments = "string",
	public = true,
	actions = csvloadplot
}

interfaces.implement {
	name = "MyMacroB",
	public = true,
	arguments = { "string", "integer", "boolean", "dimen" },
	actions = function(s,i,b,d)
		context("<%s> <%i> <%l> <%p>",s,i,b,d)
	end,
}
