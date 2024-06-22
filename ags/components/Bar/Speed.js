
export const Speed = () => {

  return Widget.Box({
    class_name: 'bar_item',
    children: [
      Widget.Icon({
        icon: 'network_speed',
        size: 20,
      }),
      Widget.Label({
        class_name: "bar_item",
        label: speed.bind(),
      })
    ]
  })
}

const interval = 2000;
const command = './.config/ags/components/Bar/scripts/speed.sh';

const transform = (out) => {
  let [down, up] = out.split(' ').map(el => {
    const num = parseFloat(el)
    return Math.round(num)
  })
  let measurement = 'K'
  if (down > 1024 || up > 1024) {
    down = Math.round(down / 1024)
    up = Math.round(up / 1024)
    measurement = 'M'
  }
  return `  ${down} / ${up} ${measurement}`
};

const speed = Variable('', { poll: [interval, command, transform] })
