# guess-indent 

> 源码位于：[guess-indent](../../lua/plugins/guess-indent.lua)

```lua
return {
    'nmac427/guess-indent.nvim',
    priority = 1000, -- 确保优先加载
    config = function()
        require('guess-indent').setup {}
    end,
}
```

**自动推断文件的缩进风格**（比如是用 `tab` 还是 `space`，以及缩进宽度是 2 还是 4）
