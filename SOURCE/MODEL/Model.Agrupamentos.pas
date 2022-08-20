unit Model.Agrupamentos;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Datasnap.DBClient,
  Auxiliar.Forms,
  Auxiliar.DataGrid,
  Auxiliar.Validacoes,
  Auxiliar.Variaveis.Globais;

type
  TModelAgrupamentos = class
  private
    FFrame: TFrame;
    FDBGridPai, FDBGridFilho: TDBGrid;
    FCdsPai, FCdsFilho: TClientDataSet;
    FDtsPai, FDtsFilho: TDataSource;
    function CriaTabela: TClientDataSet;
    function CriaDataSource(pCdsData: TClientDataSet): TDataSource;
    procedure DataGrid(pDbg: TDBGrid; pCds: TClientDataSet; pDts: TDataSource);
    procedure LancarDados(pDbg: TDBGrid; pCds: TClientDataSet; Notificacao: TNotificacao);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: TModelAgrupamentos;
    function Formulario(pFrame: TFrame): TModelAgrupamentos;
    function Dados: TModelAgrupamentos;
    procedure EfetuarLancamentos(Notificacao: TNotificacao);
  end;

const
  // Configura��o do DBGrid
  aFields  : array[0..1] of String     = ('CENTROCUSTOS', 'VALOR');
  aHeaders : array[0..1] of String     = ('C�digo', 'Valor R$');
  aWidths  : array[0..1] of Integer    = ( 70, 100);
  aAligns  : array[0..1] of String     = ('Center', 'Right');
  aTipos   : array[0..1] of TFieldType = (ftString, ftFloat);
  aTamanho : array[0..1] of Integer    = ( 6, 0);

implementation

{ TModelAgrupamentos }

constructor TModelAgrupamentos.Create;
begin
  FCdsPai   := CriaTabela;
  FCdsFilho := CriaTabela;
  FDtsPai   := CriaDataSource(FCdsPai);
  FDtsFilho := CriaDataSource(FCdsFilho);
end;

destructor TModelAgrupamentos.Destroy;
begin
  inherited;
end;

function TModelAgrupamentos.CriaTabela: TClientDataSet;
var
  cdsData: TClientDataSet;
  I: Integer;

begin
  cdsData := TClientDataSet.Create(nil);
  for I := 0 to Length(aFields) - 1 do
    cdsData.FieldDefs.Add(aFields[I], aTipos[I], aTamanho[I]);

  cdsData.CreateDataSet;
  cdsData.EmptyDataSet;
  cdsData.Active := True;
  Result := cdsData;
end;

function TModelAgrupamentos.CriaDataSource(pCdsData: TClientDataSet): TDataSource;
var
  dtsData: TDataSource;

begin
  dtsData         := TDataSource.Create(nil);
  dtsData.DataSet := pCdsData;
  Result          := dtsData;
end;

procedure TModelAgrupamentos.DataGrid(pDbg: TDBGrid; pCds: TClientDataSet; pDts: TDataSource);
begin
  pDbg.DataSource := pDts;
  MontarGrid(pDbg, aFields, aHeaders, aAligns, aWidths);
  FormataDataSet(pCds);
end;

procedure TModelAgrupamentos.LancarDados(pDbg: TDBGrid; pCds: TClientDataSet; Notificacao: TNotificacao);
var
  FCodigo: String;
  FValor: Real;

begin
  FCodigo := iif(String(pDbg.Name).Contains('Pai'),  Copy(Notificacao.CentroCustos, 1, 2), Copy(Notificacao.CentroCustos, 3, 4));
  FValor  := Notificacao.Valor;

  // Localiza o Centro de Custo para somar o valor j� lan�ado anteriormente
  if pCds.Locate(aFields[0], FCodigo, []) then
     begin
       pCds.Edit;
       pCds.FieldByName(aFields[1]).AsFloat := pCds.FieldByName(aFields[1]).AsFloat + FValor;
       pCds.Post;
       pCds.First;
     end
  else
     begin
       pCds.AppendRecord([FCodigo, FValor]);
       if pCds.RecordCount = 2 then
          DimensionarGrid(pDbg);
     end;
end;

class function TModelAgrupamentos.New: TModelAgrupamentos;
begin
  Result := Self.Create;
end;

function TModelAgrupamentos.Formulario(pFrame: TFrame): TModelAgrupamentos;
begin
  Result       := Self;
  FFrame       := pFrame;
  FDBGridPai   := TDBGrid(Componente(FFrame, 40));
  FDBGridFilho := TDBGrid(Componente(FFrame, 41));
end;

function TModelAgrupamentos.Dados: TModelAgrupamentos;
begin
  Result := Self;
  DataGrid(FDBGridPai, FCdsPai, FDtsPai);
  DataGrid(FDBGridFilho, FCdsFilho, FDtsFilho);
end;

procedure TModelAgrupamentos.EfetuarLancamentos(Notificacao: TNotificacao);
begin
  LancarDados(FDBGridPai, FCdsPai, Notificacao);
  LancarDados(FDBGridFilho, FCdsFilho, Notificacao);
end;

end.
