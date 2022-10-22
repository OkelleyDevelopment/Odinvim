local okay, gitsigns = pcall(require, "gitsigns")
if not okay then
    return
end
gitsigns.setup()
