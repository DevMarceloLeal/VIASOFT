unit Controller.Interfaces;

interface

uses
  Vcl.Forms,
  Auxiliar.Variaveis.Globais;

type
  iObserver = interface
    ['{5E225016-49C4-4352-9781-61A70C0D6005}']
    procedure Atualizar(Notificacao: TNotificacao);
  end;

  iSubject = interface
    ['{071EB7A2-7138-48A9-9BF2-F38279039996}']
    procedure Adicionar(Observer: iObserver);
    procedure Remover(Observer: iObserver);
    procedure Notificar(Notificacao: TNotificacao);
  end;

  iModel = interface
    ['{6646EEF5-2310-4E81-A359-500811FC9C0C}']
    function Observer(pObserver: iSubject): iModel;
    function Formulario(pFrame: TFrame): iModel;
    procedure EfetuarLancamentos;
  end;

  iController = interface
    ['{30495038-D615-43AB-9EEB-B329C2664652}']
    function Observer: iSubject;
    Function Operacoes: iModel;
  end;

implementation

end.
