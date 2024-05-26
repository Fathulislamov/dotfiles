import { Window } from "./Window.js"

const battery = await Service.import("battery")
const icon = battery.bind("percent").as(p => `battery-level-${Math.floor(p / 10) * 10}-symbolic`)
const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0)

export const Battery = () => {
  return Widget.Box({
    class_name: "battery",
    visible: battery.bind("available"),
    children: [
      ButtonBattery()
    ],
  })
}

const ButtonBattery = () => {
  return Widget.Button({
    on_clicked: () => App.toggleWindow('kj'),
    child: BatteryIcon(),
  })
}

const BatteryIcon = () => {
  return Widget.Icon({
    icon,
    class_name: 'battery-icon'
  })
}

const DescriptionWindow = () => {
  return Widget.LevelBar({
    widthRequest: 140,
    vpack: "center",
    value,
  })
}

Window('kj', DescriptionWindow())
