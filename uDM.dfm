object DM: TDM
  OldCreateOrder = False
  Height = 464
  Width = 682
  object MTurnos: TFDMemTable
    OnCalcFields = MTurnosCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 32
    Top = 64
    object MTurnosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 80
    end
    object MTurnosINICIO: TDateTimeField
      FieldName = 'INICIO'
    end
    object MTurnosTERMINO: TDateTimeField
      FieldName = 'TERMINO'
    end
    object MTurnosATENDIMENTOS: TIntegerField
      FieldName = 'ATENDIMENTOS'
    end
    object MTurnosDURACAO: TTimeField
      FieldKind = fkCalculated
      FieldName = 'DURACAO'
      Calculated = True
    end
  end
  object MAtendentes: TFDMemTable
    AfterInsert = MAtendentesAfterInsert
    BeforePost = MAtendentesBeforePost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 32
    Top = 16
    object MAtendentesID: TAutoIncField
      FieldName = 'ID'
    end
    object MAtendentesATENDENTE: TStringField
      FieldName = 'ATENDENTE'
      Size = 80
    end
    object MAtendentesATIVO: TBooleanField
      FieldName = 'ATIVO'
    end
  end
  object DSTurnos: TDataSource
    DataSet = MTurnos
    Left = 104
    Top = 64
  end
  object DSAtendentes: TDataSource
    DataSet = MAtendentes
    Left = 104
    Top = 16
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 584
    Top = 16
  end
end
