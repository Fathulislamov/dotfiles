
// const cpu = Variable(0, {
//    poll: [2000, 'top -b -n 1', out => divide([100, out.split('\n').find(line => line.includes('Cpu(s)')).split(/\s+/)[1].replace(',', '.')])],
// })
//
const interval = 2000;
const command = 'top -b -n 1';

const transform = (out) => {
  const lines = out.split('\n');
  const cpuLine = lines.find(line => line.includes('Cpu(s)'));
  const cpuUsageString = cpuLine.split(/\s+/)[1];
	return cpuUsageString
};

const cpu = Variable(0, { poll: [interval, command, transform] })

// export const CPU =() => Widget.Label({
// 	label: cpu.bind(),
// } )


export const CPU = () => Widget.Box({
	class_name: 'bar_item',
  children: [
    Widget.Icon({
      icon: 'cpu-symbolic',
      size: 20,
    }),
    Widget.Label({
      label: cpu.bind().as(el => el+'%'),
    })
  ]

})

