
export const Speed = () => {
  return Widget.Label({
    class_name: "bar_item",
    label: speed.bind(),
  })
}

const interval = 2000;
const command = './.config/ags/components/Bar/scripts/speed.sh';

const transform = (out) => {
	console.log(out)
	//   const lines = out.split('\n');
	//   const cpuLine = lines.find(line => line.includes('Cpu(s)'));
	//   const cpuUsageString = cpuLine.split(/\s+/)[1];
	// return cpuUsageString
	return out
};

const speed = Variable('', { poll: [interval, command, transform] })
