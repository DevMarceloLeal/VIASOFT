unit Model.Logs;

interface

uses
  System.SysUtils,
  Auxiliar.Variaveis.Globais;

type
  TModelLogs = class
  public
    constructor Create;
    destructor Destroy; override;
    class function New: TModelLogs;
    function EfetuarLancamentos(Notificacao: TNotificacao): String;
  end;

implementation

{ TModelLogs }

constructor TModelLogs.Create;
begin
end;

destructor TModelLogs.Destroy;
begin
  inherited;
end;

class function TModelLogs.New: TModelLogs;
begin
  Result := Self.Create;
end;

function TModelLogs.EfetuarLancamentos(Notificacao: TNotificacao): String;
begin
  Result := Format('Um Centro de Custo %s no VALOR DE %s foi adicionado', [Notificacao.CentroCustos, FormatFloat('###,##0.00', Notificacao.Valor)]);
end;

end.
