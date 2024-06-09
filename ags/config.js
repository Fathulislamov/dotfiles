App.addIcons(`${App.configDir}/assets`)

import { SysTray } from './components/Bar/Systray.js'
import { Battery } from './components/Bar/Battery.js'
import { Title } from './components/Bar/Title.js'
import { Workspaces } from './components/Bar/Workspaces.js'
// import { Volume } from './components/Bar/Volume.js'
import { Clock } from './components/Bar/Clock.js'
import { Bluetooth } from './components/Bar/Bluetooth.js'
import { Network } from './components/Bar/Network.js'
import { Keyboard } from './components/Bar/Keyboard.js'
import { cpuProgress } from './components/Bar/Cpu.js'
import { Memory } from './components/Bar/Memory.js'
import { Temp } from './components/Bar/Temp.js'
import { Brightness } from './components/Bar/Brightness.js'
import { BtnSetting } from './components/Bar/BtnSettings.js'
import { SystemMenu } from './components/SystemMenu/SystemMenu.js'
// const notifications = await Service.import("notifications")
// const mpris = await Service.import("mpris")
//


// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it




// we don't need dunst or any other notification daemon
// because the Notifications module is a notification daemon itself
// function Notification() {
//     const popups = notifications.bind("popups")
//     return Widget.Box({
//         class_name: "notification",
//         visible: popups.as(p => p.length > 0),
//         children: [
//             Widget.Icon({
//                 icon: "preferences-system-notifications-symbolic",
//             }),
//             Widget.Label({
//                 label: popups.as(p => p[0]?.summary || ""),
//             }),
//         ],
//     })
// }


// function Media() {
//     const label = Utils.watch("", mpris, "player-changed", () => {
//         if (mpris.players[0]) {
//             const { track_artists, track_title } = mpris.players[0]
//             return `${track_artists.join(", ")} - ${track_title}`
//         } else {
//             return "Nothing is playing"
//         }
//     })
//
//     return Widget.Button({
//         class_name: "media",
//         on_primary_click: () => mpris.getPlayer("")?.playPause(),
//         on_scroll_up: () => mpris.getPlayer("")?.next(),
//         on_scroll_down: () => mpris.getPlayer("")?.previous(),
//         child: Widget.Label({ label }),
//     })
// }


App.config({
  style: './style.css',
  windows: [
    Bar(),
		SystemMenu()
  ]
})

function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    // monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  })
}





// layout of the bar
function Left() {
  return Widget.Box({
    spacing: 8,
    children: [
      Workspaces(),
    ],
  })
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [
      // Media(),
      // Notification(),
      Title(),
    ],
  })
}
//
function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
      Temp(),
      Brightness(),
      Keyboard(),
      cpuProgress(),
      // cpuProgressCircular()
      Memory(),
      Network(),
      Bluetooth(),
      Battery(),
      Clock(),
      SysTray(),
			BtnSetting()
    ],
  })
}



export { }
