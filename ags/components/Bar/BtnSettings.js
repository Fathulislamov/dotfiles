App.addIcons(`${App.configDir}/assets`)
import { isOpenMenu } from '../SystemMenu/SystemMenu.js'

export const BtnSetting = () => {
  return Widget.Button({
		class_name: 'bar_item, bar_btn',
    on_clicked: () => isOpenMenu.setValue(!isOpenMenu.value),
    child: Widget.Icon({
      icon: 'settings-symbolic',
      size: 25,
    })
  })
}
