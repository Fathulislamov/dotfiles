const bluetooth = await Service.import('bluetooth')

export const Bluetooth = () => Widget.Box({
  hexpand: true,
  vertical: true,
})
  .hook(bluetooth, box => {
    box.children = [
      Widget.Box({
        children: [
          Widget.Label({ label: 'Bluetooth' }),
          Widget.Switch({
            active: bluetooth.enabled,
            onActivate: () => {
              bluetooth.enabled = !bluetooth.enabled
            }
          })]
      }),
      Widget.Revealer({
        transition: 'slide_right',
        child: Devices(),
        reveal_child: bluetooth.enabled,
      })
    ];
  });

const Devices = () => {
  return Widget.Box({
    vertical: true,
    children: bluetooth.devices.map(device => {
      return Widget.Box({
        children: [
          Widget.Icon(device.icon_name + "-symbolic"),
          Widget.Label(device.name),
          Widget.Box({ hexpand: true }),
          device.connecting ?
            Widget.Spinner({
              active: true
            })
            :
            Widget.Switch({
              active: device.connected,
              onActivate: ({ active }) => {
                if (active !== device.connected)
                  device.setConnection(active);
              }
            })
        ],
      })
    })
  })
}
