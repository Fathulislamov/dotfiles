import { SystemMenu } from './components/SystemMenu/SystemMenu.js'
import { Bar } from './components/Bar/Bar.js'

App.config({
  style: './style.css',
  windows: [
    Bar(),
		SystemMenu()
  ]
})

