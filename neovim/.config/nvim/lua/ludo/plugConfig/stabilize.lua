local status_ok, stabilize = pcall(require, "stabilize")
if not status_ok then
  return
end

stabilize.setup()
