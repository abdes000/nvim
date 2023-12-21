vim.g.cryptoprice_base_currency = "usd"
vim.g.cryptoprice_crypto_list = {"bitcoin", "ethereum"} 
vim.g.cryptoprice_window_width = 60
vim.g.cryptoprice_window_height = 10

require("cryptoprice").setup{
    base_currency="usd",
    crypto_list={"bitcoin", "ethereum"},
    window_height=10,
    window_width=60
}