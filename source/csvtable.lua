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

local function	csvloadtable(filename)
	local rows = parse(filename)

	local ncols = #rows[1]
	context(string.format("\\bTABLE[width=%.5f\\textwidth]", 1/ncols))

	for _, row in ipairs(rows) do
		context("\\bTR")

		for _, cell in ipairs(row) do
			context("\\bTD ")
			context.math(cell)
			context(" \\eTD")
		end

		context("\\eTR")
	end

	context("\\eTABLE")
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
	arguments = "string",
	public = true,
	actions = csvloadtable
}

interfaces.implement {
	name = "csvloadplot",
	arguments = "string",
	public = true,
	actions = csvloadplot
}
