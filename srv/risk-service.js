
const cds = require('@sap/cds')

/**
 * Implementation for Risk Management service defined in ./risk-service.cds
 */
module.exports = cds.service.impl(async function() {
    const api = await cds.connect.to('API.Challenge.SAP');

    this.on('READ', 'EnviaLote', async req => {
        return api.get('/challengeSap/sap/enviaLote')
    });

    this.on('UPDATE', 'ConfirmaPagto', async req => {
        return api.post('/challengeSap/sap/confirmaPagto', req.data)
    });

    this.after('READ', 'Risks', risksData => {
        const risks = Array.isArray(risksData) ? risksData : [risksData];
        risks.forEach(risk => {
            if (risk.impact >= 100000) {
                risk.criticality = 1;
            } else {
                risk.criticality = 2;
            }
        });
    });
});