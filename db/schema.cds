namespace br.com.fiap.challenge.sap;
using { managed } from '@sap/cds/common';

entity Risks : managed {
  key ID      : UUID  @(Core.Computed : true);
  title       : String(100);
  prio        : String(5);
  descr       : String;
  miti        : Association to Mitigations;
  impact      : Integer;
  criticality : Integer;
}

entity Mitigations : managed {
  key ID       : UUID  @(Core.Computed : true);
  description  : String;
  owner        : String;
  timeline     : String;
  risks        : Association to many Risks on risks.miti = $self;
}

using { API.Challenge.SAP as external } from '../srv/external/API_CHALLENGE_SAP';

type Lote: {
  noLote: Integer;
  noPagamento: Integer;
  valorPagamento: String;
  agencia: Integer;
  conta: Integer;
  digito: Integer;
  CNPJ: String;
  eParcelado: Integer;
  noParcela: Integer;
  qtdParcela: Integer;
  valorParcela: String;
}

entity EnviaLote: managed {
  status: Integer;
  lotes: many Lote;
}

type LotePagto: {
  noLote: Integer;
  noPagamento: Integer;
  valorPagamento: Double;
  status: Integer;
}

entity ConfirmaPagto: managed {
  lotes: many LotePagto;
}