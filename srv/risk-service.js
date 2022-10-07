
const cds = require('@sap/cds')

/**
 * Implementacao dos servicos que se integram a API de pagamentos criada para o Challenge SAP da Fiap
 */
module.exports = cds.service.impl(async function() {
    const api = await cds.connect.to('API.Challenge.SAP');

    this.on('READ', 'EnviaLote', async req => {
        return api.get('/challengeSap/sap/enviaLote')
    });

    this.on('UPDATE', 'ConfirmaPagto', async req => {
        return api.post('/challengeSap/sap/confirmaPagto', req.data)
    });
});