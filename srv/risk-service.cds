using {br.com.fiap.challenge.sap as my} from '../db/schema';

@path : 'service/challenge/sap'
service RiskService {
    @readonly
    entity EnviaLote @(restrict : [{
        grant : ['READ'],
        to    : ['Viewer', 'Manager']
    }]) as projection on my.EnviaLote;

    entity ConfirmaPagto @(restrict : [
        {
            grant : ['READ'],
            to    : ['Viewer']
        },
        {
            grant : ['*'],
            to    : ['Manager']
        }
    ]) as projection on my.ConfirmaPagto;
}
