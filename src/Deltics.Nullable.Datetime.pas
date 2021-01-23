
{$i deltics.nullable.inc}

  unit Deltics.Nullable.Datetime;


interface

{$ifNdef Generics}

  uses
    Deltics.Nullable.Base;

  type
    NullableDatetime = object(Nullable)
    private
      fValue: TDatetime;
      function get_Value: TDatetime;
      procedure set_Value(const aValue: TDatetime);
    protected
      procedure GetValue(var aValue);
      procedure SetValue(const aValue);
    public
      property Value: TDatetime read get_Value write set_Value;
    end;

{$endif}


implementation


{$ifNdef Generics}

{ NullableDatetime ------------------------------------------------------------------------------- }

  procedure NullableDatetime.GetValue(var aValue);
  begin
    inherited;

    TDatetime(aValue) := fValue;
  end;


  procedure NullableDatetime.SetValue(const aValue);
  begin
    inherited;

    fValue := TDatetime(aValue);
  end;


  function NullableDatetime.get_Value: TDatetime;
  begin
    GetValue(result);
  end;


  procedure NullableDatetime.set_Value(const aValue: TDatetime);
  begin
    SetValue(aValue);
  end;

{$endif}



end.

