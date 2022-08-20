unit Auxiliar.Validacoes;

interface

  function iif(Condicao, ParteTRUE, ParteFALSE: Variant): Variant;

implementation

///####################################################################################################################
/// Função   : iif()
/// Objetivo : Responsável Por Pequenos e Rápidos Testes
///####################################################################################################################
function iif(Condicao, ParteTRUE, ParteFALSE: Variant): Variant;
begin
  if Condicao then
     Result := ParteTRUE
  else
     Result := ParteFALSE;
end;

end.
