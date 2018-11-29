local cURL = require("cURL")
print("cURL")
-- returns size and reader
local function make_stream(ch, n, m)
  local size = n * m
  local i = -1
  return size, function()
    i = i + 1
    if i < m then 
      return (tostring(ch)):rep(n - 2) .. '\r\n'
    end
  end
end
print("easy_init")
c = cURL.easy_init()

c:setopt_url("http://posttestserver.com/post.php")

c:setopt_post(true)

local length, reader = make_stream("a", 10, 4)

c:post{-- post file from private read function
  -- Lua-cURL compatiable
  -- allows only one stream
  name = {
    file="stream.txt",
    stream_length=length,
    type="text/plain",
  }
}
print("perform")
c:perform{readfunction = reader}


local length, reader = make_stream("b", 10, 4)
c:post{-- post file from private read function
  -- define stream callback
  name = {
    file          = "stream.txt",
    type          = "text/plain",
    stream_length = length,
    stream        = reader,
  }
}
print("perform")
c:perform{}

print("Done")
