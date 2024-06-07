
// const cpu = Variable(0, {
//    poll: [2000, 'top -b -n 1', out => divide([100, out.split('\n').find(line => line.includes('Cpu(s)')).split(/\s+/)[1].replace(',', '.')])],
// })
//
const interval = 2000;
const command = 'top -b -n 1';
const transform = (out) => {
  // Разбиваем вывод команды на строки
  const lines = out.split('\n');

  // Находим строку, содержащую информацию о загрузке процессора
  const cpuLine = lines.find(line => line.includes('Cpu(s)'));

  // Разбиваем строку на части и выбираем процент использования процессора
  const cpuUsageString = cpuLine.split(/\s+/)[1];

  // Заменяем запятую на точку для корректного преобразования в число
  // const cpuUsage = cpuUsageString.replace(',', '.');

  // Преобразуем строку в число
  // const cpuUsageNumber = parseFloat(cpuUsage);

  // Вычисляем отношение 100 к проценту использования процессора
  // return divide([100, cpuUsageNumber]);
	return cpuUsageString
};

// const poll = [interval, command, transform];
const cpu = Variable(0, { poll: [interval, command, transform] })




// const ram = Variable(0, {
    // poll: [2000, 'free', out => divide(out.split('\n').find(line => line.includes('Mem:'))
    //     .split(/\s+/)
    //     .splice(1, 2))],
// })
//
// export const cpuProgress = () => Widget.Label({
//   label: `${cpu.bind().emitter.value}`
//
//   // value: 0.8
// })
// export const cpuProgressCircular=() => Widget.CircularProgress({
// 	value: cpu.bind()
// })
export const cpuProgress=() => Widget.Label({
	// label: cpu.bind().emitter.value.toString()
	label: cpu.bind(),
} )

// export const ramProgress = Widget.CircularProgress({
//     value: ram.bind()
// })

