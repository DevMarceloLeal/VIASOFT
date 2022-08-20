unit Model.Saldos;

interface

uses
  System.SysUtils,
  Auxiliar.Variaveis.Globais;

type
  TModelSaldos = class
  private
    FTotalGeral: Real;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: TModelSaldos;
    function EfetuarLancamentos(Notificacao: TNotificacao): String;
  end;

implementation

{ TModelSaldos }

constructor TModelSaldos.Create;
begin
  FTotalGeral := 0.00;
end;

destructor TModelSaldos.Destroy;
begin
  inherited;
end;

class function TModelSaldos.New: TModelSaldos;
begin
  Result := Self.Create;
end;

function TModelSaldos.EfetuarLancamentos(Notificacao: TNotificacao): String;
begin
  FTotalGeral := FTotalGeral + Notificacao.Valor;
  Result := FormatFloat('###,##0.00', FTotalGeral);
end;

end.
