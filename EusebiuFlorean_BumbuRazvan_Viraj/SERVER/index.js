const Websocket = require('ws')

const wss = new Websocket.Server({ port: 8080 })
wss.on('connection', (ws) => {
  const fs = require('fs')
  console.log('A new client is connected')
  ws.on('message', (data) => {

    const filePath = 'output.txt';

    fs.writeFile(filePath, '', (err) => {
      if (err) {
        console.error('Error:', err);
      } else {
        console.log('File content removed successfully.');
      }
    });

    var exec = require('child_process').exec;


    exec("sed -i 's/441/1800/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
      exec("sed -i 's/315/1800/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
        exec("sed -i 's/360/1800/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
          exec("sed -i 's/scenario2/scenario1/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
            exec("sed -i 's/scenario3/scenario1/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
              exec("sed -i 's/scenario4/scenario1/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
                switch (data.toString()) {
                  case 'sc2':
                    exec("sed -i 's/1800/441/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
                    exec("sed -i 's/scenario1/scenario2/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
                      exec(`clips -f "../VIRAJ/go" `, function (error, stdout, stderr) {
                        console.log(stdout);
                        console.error(stderr);
                        if (error !== null) {
                          console.error(`Error: ${error}`);
                        }
                      });
                    });
                    });
                    break;

                  case 'sc3':
                    exec("sed -i 's/1800/315/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
                    exec("sed -i 's/scenario1/scenario3/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
                      exec(`clips -f "../VIRAJ/go" `, function (error, stdout, stderr) {
                        console.log(stdout);
                        console.error(stderr);
                        if (error !== null) {
                          console.error(`Error: ${error}`);
                        }
                      });
                    });
                    });
                    break;
                  
                    case 'sc4':
                    exec("sed -i 's/1800/360/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
                    exec("sed -i 's/scenario1/scenario4/g' ../VIRAJ/headers.clp", function (error, stdout, stderr) {
                      exec(`clips -f "../VIRAJ/go" `, function (error, stdout, stderr) {
                        console.log(stdout);
                        console.error(stderr);
                        if (error !== null) {
                          console.error(`Error: ${error}`);
                        }
                      });
                    });
                    });
                    break;

                  default:
                    exec(`clips -f "../VIRAJ/go" `, function (error, stdout, stderr) {
                    });                    
                    break;
                }
              });
            });
          });
        });
      });
    });
    setTimeout(() => {
      fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
          console.error('Error:', err);
        } else {
          ws.send(data);
        }
      });     }, 1000);
  })
})

