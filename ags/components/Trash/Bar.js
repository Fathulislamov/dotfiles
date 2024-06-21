import { Battery } from "./Battery.js"
import { BtnSetting } from "./BtnSettings.js"
import { Clock } from "./Clock.js"
import { CPU } from "./Cpu.js"
import { Keyboard } from "./Keyboard.js"
import { Memory } from "./Memory.js"
import { SysTray } from "./Systray.js"
import { Temp } from "./Temp.js"
import { Title } from "./Title.js"
import { Workspaces } from "./Workspaces.js"


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

export const Bar = (monitor = 0) => {
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
      Title(),
    ],
  })
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [
      Clock(),
      // Media(),
      // Notification(),
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
      CPU(),
      Memory(),
      // Network(),
      // Bluetooth(),
      Battery(),
      Keyboard(),
      SysTray(),
      BtnSetting()
    ],
  })
}


