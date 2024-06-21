const battery = await Service.import("battery")
export const Battery = () => {
  return Widget.Box({
    class_name: "battery bar_item",
    visible: battery.bind("available"),
    setup: self => self.hook(battery, () => {
      const value = battery.percent
      const charging = battery.charging
      const Icon = BatteryIcon(value, charging)
      self.children = [
        Icon,
        Widget.Label({
          label: battery.bind('percent').as(el => `${el}%`)
        })
      ]
    }, 'changed')
  })
}

const BatteryIcon = (percent = 0, charging = false) => {
  const icon = `battery${charging ? '_charging' : ''}_${Math.floor(percent / 10) * 10}`
  return Widget.Icon({
    icon,
    class_name: 'battery-icon'
  })
}

