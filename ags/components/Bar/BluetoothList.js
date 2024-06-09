const Bluetooth = await Service.import('bluetooth')

const BluetoothList = () => Widget.Box({
  hexpand: true,
  vertical: true,
})
  .hook(Bluetooth, box => {
    box.children = [
      Widget.Box({
        children: [
          Widget.Label({ label: 'Bluetooth' }),
          Widget.Switch({
            active: Bluetooth.enabled,
            onActivate: () => {
              Bluetooth.enabled = !Bluetooth.enabled
            }
          })]
      }),
      Widget.Revealer({
        transition: 'slide_right',
        child: Devices(),
        reveal_child: Bluetooth.enabled,
      })
    ];
  });

const Devices = () => {
  return Widget.Box({
    vertical: true,
    children: Bluetooth.devices.map(device => {
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
export default BluetoothList;
