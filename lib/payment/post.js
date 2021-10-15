const https = require('https')
const params = JSON.stringify({
    "email": "customer@email.com",
    "amount": "20000"
})
const options = {
    hostname: 'api.paystack.co',
    port: 443,
    path: '/transaction/initialize',
    method: 'POST',
    headers: {
        Authorization: 'sk_live_e254ed422fe4630adc2765efd594b3952edec808',
        'Content-Type': 'application/json'
    }
}
const req = https.request(options, res => {
    let data = ''
    res.on('data', (chunk) => {
        data += chunk
    });
    res.on('end', () => {
        console.log(JSON.parse(data))
    })
}).on('error', error => {
    console.error(error)
})
req.write(params)
req.end()