addCommandHandler("twitter",
    function()
    
        local screenW, screenH = guiGetScreenSize()

        showCursor(true)
        
        interface = guiCreateStaticImage((screenW - 915) / 2, (screenH - 470) / 2, 915, 470, "images/interface.png", false)

        tweet = guiCreateLabel(564, 304, 244, 20, "", false, interface)
        close = guiCreateLabel(564, 334, 244, 20, "", false, interface)    
    end
)

function tweetInterface()
    local screenW, screenH = guiGetScreenSize()
    
    tinterface = guiCreateStaticImage((screenW - 766) / 2, (screenH - 503) / 2, 766, 503, "images/tinterface.png", false)

    send = guiCreateLabel(235, 385, 49, 22, "", false, tinterface)
    tclose = guiCreateLabel(404, 435, 52, 28, "", false, tinterface)    
    editbox = guiCreateEdit(0.28, 0.37, 0.44, 0.24, "", true, tinterface)
    guiEditSetMaxLength(editbox, 65535)    
end

addEventHandler('onClientGUIClick', getRootElement(),
    function()
        if source == close then
            destroyElement(interface)
            showCursor(false)
        end

        if source == tweet then
            destroyElement(interface)
            tweetInterface()
        end

        if source == tclose then
            destroyElement(tinterface)
            showCursor(false)
        end

        if source == send then
            local text = guiGetText(editbox)
            outputChatBox('Yeni bir tweet oluşturdu! ('..getPlayerName(localPlayer)..')', 30, 144, 255, true)
            outputChatBox(text, 255, 255, 255)
        end
    end
)