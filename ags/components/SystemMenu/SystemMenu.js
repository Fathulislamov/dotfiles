import { Audio } from "./Audio/Audio.js"
import { Bluetooth } from "./Bluetooth/Bluetooth.js"
import { Brightness } from "./Brightness/Brightness.js"
import { Media } from "./Media/Media.js"
import WifiList from "./Wifi/NetworkList.js"

export const isOpenMenu = Variable(false)

export const SystemMenu = () => {
  return Widget.Window({
    name: 'system_menu',
    class_name: 'system_menu',
    anchor: ['top', 'right'],
    margins: [10, 10],
    setup: self => self.hook(isOpenMenu, () => {
      self.visible = isOpenMenu.value
    }),
    child: Widget.Box({
      class_name: 'wrap_system_menu',
      children: [
        Audio(),
        Bluetooth(),
        WifiList(),
        Brightness(),
        Media()
      ]
    })

  })
}
