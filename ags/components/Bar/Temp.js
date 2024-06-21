const interval = 2000;
const command = 'sensors';
const transform = (out) => {
  const lines = out.split('\n');
  const cpuLine = lines.find(line => line.includes('CPU:'));
  const cpuTempString = cpuLine.split(/\s+/)[1]; // '+65.0°C'
  const cpuTempNumber = parseInt(cpuTempString.replace(/[^\d]/g, ''), 10) / 10; // 65
  return `${cpuTempNumber}°С`
};

const temp = Variable('0', { poll: [interval, command, transform] })

export const Temp = () => Widget.Box({
	class_name: 'bar_item',
  children: [
    Widget.Icon({
      icon: 'temperature-symbolic',
      size: 20,
    }),
    Widget.Label({
      label: temp.bind(),
    })
  ]

})


