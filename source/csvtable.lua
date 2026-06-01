local csvtable = {}

local function split(line)
  local t = {}
  for field in line:gmatch("([^,]+)") do
    t[#t+1] = field
  end

  return t
end

function  csvtable.render(filename)
  local rows = {}

  for line in io.lines(filename) do
    rows[#rows+1] = split(line)
  end

  local ncols = #rows[1]
  context(string.format("\\bTABLE[width=%.5f\\textwidth]", 1/ncols))

    for r, row in ipairs(rows) do
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

return csvtable
