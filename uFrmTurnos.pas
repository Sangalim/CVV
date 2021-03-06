unit uFrmTurnos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.ExtCtrls, Vcl.Menus,
  cxButtons, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TModoOperador = (TMOpOff, TMOpOn);

type
  TFrmTurnos = class(TForm)
    cxCMBAtivos: TcxComboBox;
    Label1: TLabel;
    ActionList1: TActionList;
    LblClok: TLabel;
    Timer1: TTimer;
    ActMais: TAction;
    ActMenos: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActIniciar: TAction;
    ActFinalizar: TAction;
    LblTxtIniciado: TLabel;
    LblInicio: TLabel;
    LblTxtEncerrado: TLabel;
    LblEncerrado: TLabel;
    LblTxtAtendimentos: TLabel;
    LblNroAtendimentos: TLabel;
    BindingsList1: TBindingsList;
    LblTxtDuracao: TLabel;
    LblDuracao: TLabel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActIniciarUpdate(Sender: TObject);
    procedure ActIniciarExecute(Sender: TObject);
    procedure ActMenosUpdate(Sender: TObject);
    procedure ActMaisUpdate(Sender: TObject);
    procedure ActMaisExecute(Sender: TObject);
    procedure ActMenosExecute(Sender: TObject);
    procedure ActFinalizarUpdate(Sender: TObject);
    procedure ActFinalizarExecute(Sender: TObject);
  private
    { Private declarations }
    FInicio: TDateTime;
    FTermino: TDateTime;
    FEstado: TModoOperador;
    FNroAtendimentos: Integer;
    class var FInstancia: TFrmTurnos;
    class function Instancia: TFrmTurnos;
  public
    { Public declarations }
    class procedure Exibe;
  end;

implementation

{$R *.dfm}

uses uDM, uDMRes;

{ TFrmTurnos }

procedure TFrmTurnos.ActFinalizarExecute(Sender: TObject);
begin
  if MessageDlg('Confirma encerrar este turno?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    FTermino := Now;
    DM.InsereTurno(FInicio,
                   FTermino,
                   cxCMBAtivos.Properties.Items[cxCMBAtivos.ItemIndex],
                   FNroAtendimentos);
    FEstado                         := TMOpOff;
    FInicio                         := 0;
    FTermino                        := 0;
    FNroAtendimentos                := 0;
    LblDuracao.Caption              := '--:--:--';
    LblInicio.Caption               := '--:--:--';
    LblEncerrado.Caption            := '--:--:--';
    LblNroAtendimentos.Caption      := '0';
    cxCMBAtivos.Properties.ReadOnly := False;
  end;
end;

procedure TFrmTurnos.ActFinalizarUpdate(Sender: TObject);
begin
  ActFinalizar.Enabled := FEstado = TMOpOn;
end;

procedure TFrmTurnos.ActIniciarExecute(Sender: TObject);
begin
  cxCMBAtivos.Properties.ReadOnly := True;
  FNroAtendimentos                := 0;
  FInicio                         := Now;
  LblTxtIniciado.Visible          := True;
  LblTxtEncerrado.Visible         := True;
  LblTxtAtendimentos.Visible      := True;
  LblNroAtendimentos.Visible      := True;
  LblInicio.Visible               := True;
  LblTxtEncerrado.Visible         := True;
  LblInicio.Caption               := FormatDateTime('hh:nn:ss', FInicio);
  FEstado                         := TMOpOn;
end;

procedure TFrmTurnos.ActIniciarUpdate(Sender: TObject);
begin
  ActIniciar.Enabled := (FEstado = TMOpOff) and (cxCMBAtivos.ItemIndex > -1);
end;

procedure TFrmTurnos.ActMaisExecute(Sender: TObject);
begin
  Inc(FNroAtendimentos);
  LblNroAtendimentos.Caption := IntToStr(FNroAtendimentos);
end;

procedure TFrmTurnos.ActMaisUpdate(Sender: TObject);
begin
  ActMais.Enabled := FEstado = TMOpOn;
end;

procedure TFrmTurnos.ActMenosExecute(Sender: TObject);
begin
  if MessageDlg('Confirma excluir um atendimento?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    Dec(FNroAtendimentos);
    LblNroAtendimentos.Caption := IntToStr(FNroAtendimentos);
  end;
end;

procedure TFrmTurnos.ActMenosUpdate(Sender: TObject);
begin
  ActMenos.Enabled := (FEstado = TMOpOn) and (FNroAtendimentos > 0)
end;

class procedure TFrmTurnos.Exibe;
begin
  Instancia.ShowModal;
end;

procedure TFrmTurnos.FormShow(Sender: TObject);
begin
  DM.CarregaSLAtivos(cxCMBAtivos.Properties.Items);
  cxCMBAtivos.ItemIndex := -1;
  FEstado := TMOpOff;
end;

class function TFrmTurnos.Instancia: TFrmTurnos;
begin
  if not(Assigned(FInstancia)) then
  begin
    FInstancia := TFrmTurnos.Create(Application);
  end;
  Result := FInstancia;
end;

procedure TFrmTurnos.Timer1Timer(Sender: TObject);
begin
  LblClok.Caption := FormatDateTime('hh:nn:ss', Now);
  if FEstado = TMOpOn then
  begin
    LblDuracao.Caption := FormatDateTime('hh:nn:ss', Now - FInicio);
  end;
end;

end.
