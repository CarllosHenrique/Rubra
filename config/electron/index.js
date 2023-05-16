const { app, BrowserWindow } = require('electron')
const path = require('path')
const { spawn } = require('child_process')

let mainWindow

function createWindow () {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
    }
  })

  mainWindow.loadURL('http://127.0.0.1:4567/');

  const appProcess = spawn('bundle', ['exec', 'ruby', 'main.rb'])
  appProcess.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`)
  })
  appProcess.stderr.on('data', (data) => {
    console.error(`stderr: ${data}`)
  })
}

app.whenReady().then(() => {
  createWindow()

  app.on('activate', function () {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})
