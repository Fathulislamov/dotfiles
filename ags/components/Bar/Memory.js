
const divide = ([total, free]) => Math.round((free / total) * 100)
const interval = 2000;
const command = 'free';
const transform = (out) => {
  // Разбиваем вывод команды на строки
  const lines = out.split('\n');

  // Находим строку, содержащую информацию о памяти
  const memLine = lines.find(line => line.includes('Mem:'));

  // Разбиваем строку на части
  const memParts = memLine.split(/\s+/);

  // Извлекаем нужные части (второй и третий элементы)
  const memValues = memParts.splice(1, 2);

  // Вызываем функцию divide с извлеченными значениями
  return divide(memValues).toString();
};
const memory = Variable(0, { poll: [interval, command, transform] })

export const Memory = () => Widget.Label({
  // label: cpu.bind().emitter.value.toString()
  label: memory.bind().as(value => value.toString())
})
