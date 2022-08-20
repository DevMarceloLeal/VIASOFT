unit Auxiliar.Forms;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Controls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.DBGrids;

  procedure ClearEdits(pFrame: TFrame);
  procedure SetFoco(pFrame: TFrame; pNomeComponente: String);
  function GetValor(pFrame: TFrame; pNomeComponente: String; pTexto: String = ''; pZerar: Boolean = False): String;
  function Componente(pFrame: TFrame; pTag: Integer): TComponent;
  procedure PressionaTecla(pTecla: Integer);

implementation

///####################################################################################################################
/// Função   : ClearEdits()
/// Objetivo : Responsável Pela Limpeza dos Edit´s no Form
///####################################################################################################################
procedure ClearEdits(pFrame: TFrame);
var
  i: Integer;

begin
  for i := pFrame.ComponentCount - 1 downto 0 do
    begin
      if (pFrame.Components[i] is TCustomEdit) then
         (pFrame.Components[i] as TCustomEdit).Clear
      else if (pFrame.Components[i] is TLabel) and (String((pFrame.Components[i] as TLabel).Name).Contains('edt')) then
         (pFrame.Components[i] as TLabel).Caption := '';
    end;
end;

///####################################################################################################################
/// Função   : SetFoco()
/// Objetivo : Responsável Pela Mudança de Comportamento do Componente
///####################################################################################################################
procedure SetFoco(pFrame: TFrame; pNomeComponente: String);
var
  Componente: TComponent;

begin
  Componente := pFrame.FindComponent(pNomeComponente);
  if (Componente is TCustomButton) then
     begin
       TCustomButton(Componente).SetFocus;
     end
  else if (Componente is TCustomEdit) then
     begin
       TEdit(Componente).SetFocus;
     end
  else if (Componente is TDBGrid) then
     begin
       TDBGrid(Componente).SetFocus;
     end
  else if (Componente is TDateTimePicker) then
     begin
       TDateTimePicker(Componente).SetFocus;
     end
  else if (Componente is TComboBox) then
     begin
       TComboBox(Componente).SetFocus;
     end;
end;

///####################################################################################################################
/// Função   : GetValor()
/// Objetivo : Responsável Por Preencher ou Recuperar Valores de Componentes
///####################################################################################################################
function GetValor(pFrame: TFrame; pNomeComponente: String; pTexto: String = ''; pZerar: Boolean = False): String;
var
  Componente: TComponent;

begin
  Componente := pFrame.FindComponent(pNomeComponente);
  if (Componente is TEdit) then
     begin
       if (pTexto <> '') or (pZerar) then
         (Componente as TEdit).Text := pTexto;
       Result := (Componente as TEdit).Text
     end
  else if (Componente is TLabel) then
     begin
       if (pTexto <> '') or (pZerar) then
          (Componente as TLabel).Caption := pTexto;
       Result := (Componente as TLabel).Caption;
     end;
end;

///####################################################################################################################
/// Função   : Form_Componente()
/// Objetivo : Responsável Por Retornar o Componente do Formulário
///####################################################################################################################
function Componente(pFrame: TFrame; pTag: Integer): TComponent;
var
  i: Integer;

begin
  Result := nil;
  for i := 0 to pFrame.ComponentCount - 1 do
    begin
      if (pFrame.Components[i].Tag = pTag) then
         Result := (pFrame.Components[i] as TComponent);
    end;
end;

///####################################################################################################################
/// Função   : PressionaTecla()
/// Objetivo : Responsável Por Emular o Pressionamento de Teclas
///####################################################################################################################
procedure PressionaTecla(pTecla: Integer);
begin
  keybd_event(pTecla, 0, 0, 0);
end;

end.
