unit Model.Observer;

interface

uses
  System.Generics.Collections,
  Controller.Interfaces,
  Auxiliar.Variaveis.Globais;

type
  TModelObserver = class(TInterfacedObject, iSubject)
  private
    FObservers: TList<iObserver>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iSubject;
    procedure Adicionar(Observer: iObserver);
    procedure Remover(Observer: iObserver);
    procedure Notificar(Notificacao: TNotificacao);
  end;

implementation

{ TModelObserver }

constructor TModelObserver.Create;
begin
  FObservers := TList<iObserver>.Create;
end;

destructor TModelObserver.Destroy;
begin
  FObservers.Free;
  inherited;
end;

class function TModelObserver.New: iSubject;
begin
  Result := Self.Create;
end;

procedure TModelObserver.Adicionar(Observer: iObserver);
begin
  FObservers.Add(Observer);
end;

procedure TModelObserver.Remover(Observer: iObserver);
begin
  FObservers.Delete(FObservers.IndexOf(Observer));
end;

procedure TModelObserver.Notificar(Notificacao: TNotificacao);
var
  Observer: iObserver;

begin
  for Observer in FObservers do
    Observer.Atualizar(Notificacao);
end;

end.
