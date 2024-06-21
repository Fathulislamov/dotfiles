
const divide = ([total, free]) => Math.round((free / total) * 100)
const interval = 2000;
const command = 'free';

const transform = (out) => {
  const lines = out.split('\n');
  const memLine = lines.find(line => line.includes('Mem:'));
  const memParts = memLine.split(/\s+/);
  const memValues = memParts.splice(1, 2);
  return divide(memValues).toString();
};

const memory = Variable(0, { poll: [interval, command, transform] })

export const Memory = () => Widget.Box({
	class_name: 'bar_item',
  children: [
    Widget.Icon({
      icon: 'memory-symbolic',
      size: 20,
    }),
    Widget.Label({
      label: memory.bind().as(value => ' ' + value + '%'),
    })
  ]

})

