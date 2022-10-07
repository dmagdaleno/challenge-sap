using {sap.ui.riskmanagement as my} from '../db/schema';

@path : 'service/challenge/sap'
service RiskService {
    entity Risks @(restrict : [
        {
            grant : ['READ'],
            to    : ['RiskViewer']
        },
        {
            grant : ['*'],
            to    : ['RiskManager']
        }
    ]) as projection on my.Risks;

    annotate Risks with @odata.draft.enabled;

    entity Mitigations @(restrict : [
        {
            grant : ['READ'],
            to    : ['RiskViewer']
        },
        {
            grant : ['*'],
            to    : ['RiskManager']
        }
    ]) as projection on my.Mitigations;

    annotate Mitigations with @odata.draft.enabled;

    @readonly
    entity EnviaLote @(restrict : [{
        grant : ['READ'],
        to    : ['RiskViewer', 'RiskManager']
    }]) as projection on my.EnviaLote;

    entity ConfirmaPagto @(restrict : [
        {
            grant : ['READ'],
            to    : ['RiskViewer']
        },
        {
            grant : ['*'],
            to    : ['RiskManager']
        }
    ]) as projection on my.ConfirmaPagto;
}
