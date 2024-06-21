const Hyprland = await Service.import("hyprland")

export const Keyboard = () => Widget.Box({
  class_name: 'bar_item',
  children: [
    Widget.Icon({
      icon: 'language',
      size: 19,
    }),
    Widget.Label({
      class_name: 'bar_item',
      setup: self => self.hook(Hyprland, (label, kbName, layoutName) => {
        label.label = kbName ? (layoutName === 'English (US)' ? ' US' : ' RU') : ' US';
      }, 'keyboard-layout'),
    })
  ]

})
