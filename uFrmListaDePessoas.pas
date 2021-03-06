unit uFrmListaDePessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCheckBox, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxToggleSwitch;

type
  TFrmListaDePessoas = class(TForm)
    GroupBox1: TGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1ATENDENTE: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    class var FInstancia: TFrmListaDePessoas;
    class function Instancia: TFrmListaDePessoas;
  public
    { Public declarations }
    class procedure Exibe;
  end;

implementation

{$R *.dfm}

uses uDM, uDMRes;

{ TFrmListaDePessoas }

class procedure TFrmListaDePessoas.Exibe;
begin
  Instancia.ShowModal;
end;

procedure TFrmListaDePessoas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.SalvaAtendentes;
end;

procedure TFrmListaDePessoas.FormShow(Sender: TObject);
begin
  DM.AbreAtendentes;
end;

class function TFrmListaDePessoas.Instancia: TFrmListaDePessoas;
begin
  if not(Assigned(FInstancia)) then
  begin
    FInstancia := TFrmListaDePessoas.Create(Application);
  end;
  Result := FInstancia;
end;

end.
