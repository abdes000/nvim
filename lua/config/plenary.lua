local async = require "plenary.async"

local uv = vim.loop

local read_file = function(path, callback)
  uv.fs_open(path, "r", 438, function(err, fd)
    assert(not err, err)
    uv.fs_fstat(fd, function(err, stat)
      assert(not err, err)
      uv.fs_read(fd, stat.size, 0, function(err, data)
        assert(not err, err)
        uv.fs_close(fd, function(err)
          assert(not err, err)
          callback(data)
        end)
      end)
    end)
  end)
end

local a = require'plenary.async'
local tx, rx = a.control.channel.oneshot()

a.run(function()
    local ret = long_running_fn()
    tx(ret)
end)

local ret = rx()

local a = require'plenary.async'
local sender, receiver = a.control.channel.mpsc()

a.run(function()
  sender.send(10)
  sender.send(20)
end)

a.run(function()
  sender.send(30)
  sender.send(40)
end)

for _ = 1, 4 do
  local value = receiver.recv()
  print('received:', value)
end

local Job = require'plenary.job'

Job:new({
  command = 'rg',
  args = { '--files' },
  cwd = '/usr/bin',
  env = { ['a'] = 'b' },
  on_exit = function(j, return_val)
    print(return_val)
    print(j:result())
  end,
}):sync() -- or start()

local scan = require'plenary.scandir'
scan.scan_dir('.', { hidden = true, depth = 2 })


local with = context_manager.with
local open = context_manager.open

local result = with(open("README.md"), function(reader)
  return reader:read()
end)

assert(result == "# plenary.nvim")

