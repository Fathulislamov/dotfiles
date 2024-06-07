
const openSetting = Variable(true)

// import Widget from "resource:///com/github/Aylur/ags/widget.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import BluetoothList from "./BluetoothList.js";


// export const openSetting = Variable(true)

// const PopupRevealer = (windowName, transition, child) => {
//
//   console.log(openSetting)
//   return Widget.Revealer({
//     // transition,
//     child,
//     // transition_duration: 350,
//     reveal_child: openSetting.bind(),
//   })
// }
// //   .hook(App, (revealer, name, visible) => {
// //     console.log(revealer)
// //     // revealer.reveal_child = true;
// //     if (name === windowName)
// //       revealer.reveal_child = visible;
// //   }
// //   )
//
export const PopupWindow = ({ name, child, ...rest }) =>
  Widget.Window({
    css: 'padding: 1px;',
    name,
    anchor: ['top', 'right'],
    margins: [80, 20],
    visible: openSetting.bind(),
    // setup: self => self.hook(openSetting, () => {
    //   console.log(openSetting)
    //   self.visible = openSetting.value
    //   // }, "changed")
    // }),
    child: Widget.Revealer({
      // css: 'padding: 1px;',
      // transition: "crossfade",
      // transitionDuration: 5000,
      transition: 'slide_right',
      // child: Widget.Box({ child }),
      child: BluetoothList(),
      reveal_child: true,
      setup: self => self.hook(openSetting, () => {
        self.child_revealed = openSetting.value
        // }, "changed")
      }),
      // child: Widget.Label({
      //   label: 'kjlkjlkjlkfdsa',
      // }),
    })
  })




export const Settings = () => {
  return PopupWindow({ name: 'test_window', child: testLabel() })
}

export const BtnSetting = () => {
  const icon = Icon('settings', 25)
  return Btn(icon, () => {
    // openSetting.value = !openSetting.value
    console.log(openSetting)
    openSetting.setValue(!openSetting.value)
  })
}


const Btn = (child, callback, ...rest) =>
  Widget.Button({
    css: 'padding: 1px;',
    on_clicked: callback,
    child,
    ...rest
  })

const Icon = (icon, size = 50, color = '') => {
  const fontColor = color ? `color: ${color};` : color
  return Widget.Icon({
    icon,
    size,
    // class_name: 'my-test',
    css: fontColor,
  })
}
const Box = (child, vertical = false, spacing = 8, homogeneous = false) => {
  const children = Array.isArray(child) ? child : [child]
  return Widget.Box({
    css: 'padding: 1px;',
    spacing,
    homogeneous,
    vertical,
    children
  })
}

const menuItem = (icon, callback) => {
  const iconItem = Icon(icon)
  return Btn(iconItem, callback)
}

const testLabel = () => {
  const menu = []
  menu.push(menuItem('bluetooth', () => { console.log('hello') }))
  menu.push(menuItem('signal_wifi_4', () => { console.log('hello') }))
  menu.push(menuItem('volume_up', () => { console.log('hello') }))
  menu.push(menuItem('brightness_5', () => { console.log('hello') }))
  return Box(menu)

}

