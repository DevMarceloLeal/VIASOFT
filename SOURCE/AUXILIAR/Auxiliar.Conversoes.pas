unit Auxiliar.Conversoes;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.StdCtrls;

  procedure Moeda(const Objeto: TObject);
  function StrToAlignment(const Alignment: String ): TAlignment;

implementation

///####################################################################################################################
/// Função   : Moeda()
/// Objetivo : Responsável Pela Conversão de Variáveis em Formato MOEDA
///####################################################################################################################
procedure Moeda(const Objeto: TObject);
begin
  if TEdit(Objeto).Text <> '' then
     TEdit(Objeto).Text := FormatFloat('###,##0.00', StrToFloat(TEdit(Objeto).Text))
  else
     TEdit(Objeto).Text := '0,00';
end;

///####################################################################################################################
/// Função   : StrToAlignment()
/// Objetivo : Responsável Por Converter Strings em TAlignment
///####################################################################################################################
function StrToAlignment(const Alignment: String ): TAlignment;
begin
  if (Alignment = 'Right') or (Alignment = 'taRight') then
     Result := TAlignment.taRightJustify
  else if (Alignment = 'Left') or (Alignment = 'taLeft') then
     Result := TAlignment.taLeftJustify
  else
     Result := TAlignment.taCenter;
end;

end.
