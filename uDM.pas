unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.IOUtils, FireDAC.Stan.StorageBin;

type
  TDM = class(TDataModule)
    MTurnos: TFDMemTable;
    MTurnosUSUARIO: TStringField;
    MTurnosINICIO: TDateTimeField;
    MTurnosTERMINO: TDateTimeField;
    MTurnosDURACAO: TTimeField;
    MAtendentes: TFDMemTable;
    MAtendentesATENDENTE: TStringField;
    MAtendentesATIVO: TBooleanField;
    MAtendentesID: TAutoIncField;
    DSTurnos: TDataSource;
    DSAtendentes: TDataSource;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    MTurnosATENDIMENTOS: TIntegerField;
    procedure MTurnosCalcFields(DataSet: TDataSet);
    procedure MAtendentesAfterInsert(DataSet: TDataSet);
    procedure MAtendentesBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    /// <summary>
    ///   Pasta do arquivo da lista de pessoas
    /// </summary>
    function ArqListaDePessoas: string;
  public
    { Public declarations }
    /// <summary>
    ///   A pasta do funcionamento do sistema
    /// </summary>
    function PastaBase: string;
    /// <summary>
    ///   D� o nome do arquivo para o dia de hoje
    /// </summary>
    function BaseDeHoje: string;
    /// <summary>
    ///   D� o nome do arquivo para o dia informado.
    /// </summary>
    function BaseDoDia(const D0: TDateTime): string;
    /// <summary>
    ///   Abre ou cria atendentes
    /// </summary>
    procedure AbreAtendentes;
    /// <summary>
    ///   Salva o dataset de atendentes
    /// </summary>
    procedure SalvaAtendentes;
    /// <summary>
    ///   Carrega a lista de atendentes ativos
    /// </summary>
    procedure CarregaSLAtivos(SL: TStrings);
    /// <summary>
    ///   Abre ou cria arquivos do dia
    /// </summary>
    procedure AbreTurnos(const D0: TDateTime);
    /// <summary>
    ///   Abre ou cria arquivos do dia
    /// </summary>
    procedure InsereTurno(const Inicio, Termino: TDateTime; const
      Atendente: string; const NroAtendimentos: Integer);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.AbreAtendentes;
begin
  if not(MAtendentes.Active) then
  begin
    if not(FileExists(ArqListaDePessoas)) then
    begin
      ForceDirectories(PastaBase);
      MAtendentes.CreateDataSet;
    end
    else begin
      MAtendentes.LoadFromFile(ArqListaDePessoas);
    end;
  end;
end;

procedure TDM.AbreTurnos(const D0: TDateTime);
begin
  if not(FileExists(BaseDoDia(D0))) then
  begin
    ForceDirectories(PastaBase);
    MTurnos.CreateDataSet;
  end
  else begin
    MTurnos.LoadFromFile(BaseDoDia(D0));
  end;
end;

function TDM.ArqListaDePessoas: string;
begin
  Result := PastaBase + 'Atendentes.BIN';
end;

function TDM.BaseDeHoje: string;
begin
  Result := BaseDoDia(Date);
end;

function TDM.BaseDoDia(const D0: TDateTime): string;
begin
  Result := PastaBase + FormatDateTime('YYYYMMDD', D0) + '.BIN';
end;

procedure TDM.CarregaSLAtivos(SL: TStrings);
var
  ID: Integer;
begin
  SL.Clear;
  AbreAtendentes;
  if MAtendentes.RecordCount > 0 then
  begin
    ID := MAtendentesID.AsInteger;
    MAtendentes.DisableControls;
    try
      while not(MAtendentes.Eof) do
      begin
        if MAtendentesATIVO.AsBoolean then
        begin
          SL.Append(MAtendentesATENDENTE.AsString);
        end;
        MAtendentes.Next;
      end;
    finally
      MAtendentes.EnableControls;
      MAtendentes.Locate(MAtendentesID.FieldName, ID, []);
    end;
  end;
end;

procedure TDM.InsereTurno(const Inicio, Termino: TDateTime; const
  Atendente: string; const NroAtendimentos: Integer);
begin
  AbreTurnos(Inicio);
  MTurnos.Append;
  MTurnosUSUARIO.AsString       := Atendente;
  MTurnosINICIO.AsDateTime      := Inicio;
  MTurnosTERMINO.AsDateTime     := Termino;
  MTurnosATENDIMENTOS.AsInteger := NroAtendimentos;
  MTurnos.Post;
  MTurnos.SaveToFile(BaseDoDia(Inicio));
end;

procedure TDM.MAtendentesAfterInsert(DataSet: TDataSet);
begin
  MAtendentesATIVO.AsBoolean := True;
end;

procedure TDM.MAtendentesBeforePost(DataSet: TDataSet);
begin
  MAtendentesATENDENTE.AsString := Trim(MAtendentesATENDENTE.AsString);
end;

procedure TDM.MTurnosCalcFields(DataSet: TDataSet);
begin
  if not(MTurnosINICIO.IsNull or MTurnosTERMINO.IsNull) then
  begin
    MTurnosDURACAO.AsDateTime := MTurnosTERMINO.AsDateTime - MTurnosINICIO.AsDateTime;
  end
  else begin
    MTurnosDURACAO.Clear;
  end;
end;

function TDM.PastaBase: string;
begin
  Result := ExtractFileName(ParamStr(0));
  Result := Copy(Result, 1, Length(Result) - 4);
  Result := TPath.GetSharedDocumentsPath + System.SysUtils.PathDelim + Result +
            System.SysUtils.PathDelim;
end;

procedure TDM.SalvaAtendentes;
begin
  MAtendentes.SaveToFile(ArqListaDePessoas);
end;

end.
