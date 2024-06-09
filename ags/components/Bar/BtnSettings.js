import { isOpenMenu } from '../SystemMenu/SystemMenu.js'

export const BtnSetting = () => {
  return Widget.Button({
    on_clicked: () => isOpenMenu.setValue(!isOpenMenu.value),
    child: Widget.Icon({
      icon: 'settings',
      size: 25,
    })
  })
}
