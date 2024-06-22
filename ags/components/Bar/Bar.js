import { Battery } from "./Battery.js"
import { BtnSetting } from "./BtnSettings.js"
import { Clock } from "./Clock.js"
import { CPU } from "./Cpu.js"
import { Keyboard } from "./Keyboard.js"
import { Memory } from "./Memory.js"
import { Speed } from "./Speed.js"
import { SysTray } from "./Systray.js"
import { Temp } from "./Temp.js"
import { Title } from "./Title.js"
import { Workspaces } from "./Workspaces.js"

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
    ],
  })
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
      SysTray(),
			Speed(),
      Temp(),
      CPU(),
      Memory(),
      Battery(),
      Keyboard(),
      BtnSetting()
    ],
  })
}


