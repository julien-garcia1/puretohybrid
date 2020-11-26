import Quagga from 'quagga'
const orderByOccurrence = (arr) => {
  var counts = {};
  arr.forEach(function(value){
      if(!counts[value]) {
          counts[value] = 0;
      }
      counts[value]++;
  });
  const foo = Object.keys(counts).sort(function(curKey,nextKey) {
      return counts[nextKey] - counts[curKey];
  });
  return foo;
}
const quaggaScanner = () => {
  const scanDiv = document.querySelector('#barcode-scanner');
  if (scanDiv && navigator.mediaDevices && typeof navigator.mediaDevices.getUserMedia === 'function') {
    console.log('init')
    Quagga.init({
      inputStream : {
        name : "Live",
        type : "LiveStream",
        target: scanDiv,  // Or '#yourElement' (optional)
      },
      decoder : {
        // readers : ["code_128_reader", "ean_reader", "ean_8_reader", "code_39_reader", "code_39_vin_reader", "codabar_reader", "upc_reader", "upc_e_reader", "i2of5_reader", "2of5_reader","code_93_reader"],
        readers : ["ean_reader"],
        debug: {
          drawBoundingBox: true,
          drawScanline: true,
          showPattern: true
        }
      }
    }, function(err) {
        if (err) {
          console.log(err);
          return
        }
        console.log("Initialization finished. Ready to start");
        Quagga.start();
    });
    var last_result = [];
    document.addEventListener('turbolinks:load', function(){
          Quagga.stop();
        })
    Quagga.onDetected(function(result) {
      let last_code = result.codeResult.code;
      last_result.push(last_code);
      console.log(last_code);
      if (last_result.length > 35) {
        var barcode = orderByOccurrence(last_result)[0];
        last_result = [];
        console.log(barcode);
        Quagga.stop();
          window.location.href = `https://www.alltricks.fr/Acheter/${barcode}`
      }
    });
  }
};
export { quaggaScanner }
export { orderByOccurrence }