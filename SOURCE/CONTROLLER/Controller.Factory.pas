unit Controller.Factory;

interface

uses
  Controller.Interfaces,
  Model.Observer,
  Model.Operacoes;

type
  TController = class(TInterfacedObject, iController)
  private
    FObserver: iSubject;
    FOperacoes: iModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iController;
    function Observer: iSubject;
    Function Operacoes: iModel;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  FObserver     := TModelObserver.New;
  FOperacoes    := TModelOperacoes.New.Observer(FObserver);
end;

destructor TController.Destroy;
begin
  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Observer: iSubject;
begin
  Result := FObserver;
end;

function TController.Operacoes: iModel;
begin
  Result := FOperacoes;
end;

end.

