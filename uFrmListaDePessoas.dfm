object FrmListaDePessoas: TFrmListaDePessoas
  Left = 0
  Top = 0
  Caption = 'Lista de atendentes'
  ClientHeight = 390
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 635
    Height = 57
    Align = alTop
    Caption = 'Filtro'
    TabOrder = 0
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 57
    Width = 635
    Height = 333
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      DataController.DataSource = DM.DSAtendentes
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Styles.ContentEven = DMRes.cxEven
      Styles.ContentOdd = DMRes.cxOdd
      object cxGrid1DBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Options.Editing = False
      end
      object cxGrid1DBTableView1ATENDENTE: TcxGridDBColumn
        DataBinding.FieldName = 'ATENDENTE'
      end
      object cxGrid1DBTableView1ATIVO: TcxGridDBColumn
        DataBinding.FieldName = 'ATIVO'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Width = 64
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
