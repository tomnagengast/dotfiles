local snowflake = {}

function snowflake.canonicalize(url)
  url = string.gsub(url, "^[^:]*:/=/@!", "snowflake:///")
  return vim.fn['db#url#absorb_params'](url, {
    user = 'user',
    password = 'password',
    host = 'host',
    port = 'port',
    dbname = 'database'
  })
end

function snowflake.interactive(url, args)
  local short = string.match(url, "^[^:]*:(///)=([^/?#]*)$")
  local cmd = vim.tbl_extend('force', {'psql', '-w'}, args or {}, {'--dbname', (#short > 0) and short or url})
  return cmd
end

function snowflake.filter(url)
  local columns = vim.api.nvim_get_option('columns')
  return snowflake.interactive(url, {'-P', 'columns=' .. columns, '-v', 'ON_ERROR_STOP=1'})
end

function snowflake.input(url, input)
  return vim.tbl_extend('force', snowflake.filter(url), {'-f', input})
end

local function parse_columns(output, index)
  local rows = vim.tbl_map(function(val)
    return vim.split(val, '|')
  end, output)

  if index then
    return vim.tbl_map(function(val)
      return val[index + 1]
    end, vim.tbl_filter(function(val)
      return #val > index
    end, rows))
  else
    return rows
  end
end

function snowflake.complete_database(url)
  local cmd = vim.tbl_extend('force', {'psql', '--no-psqlrc', '-wltAX'}, {string.gsub(url, "/[^/]*$", "/postgres")})
  return parse_columns(vim.fn['db#systemlist'](cmd))
end

function snowflake.complete_opaque(_)
  return snowflake.complete_database('')
end

function snowflake.tables(url)
  local cmd = vim.tbl_extend('force', snowflake.filter(url), {'--no-psqlrc', '-tA', '-c', '\\dtvm'})
  return parse_columns(vim.fn['db#systemlist'](cmd), 1)
end

return snowflake

