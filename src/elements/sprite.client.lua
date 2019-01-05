--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

--
Sprite = function(data)

    local self = {}
    self._textureDict = ''
    self.visible = true

    --
    self.SetTextureDict = function(value)
        self._textureDict = value
    end

    self.GetTextureDict = function()
        return self._textureDict
    end

end

