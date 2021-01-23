
{$i deltics.nullable.inc}

  unit Deltics.Nullable.Integer;


interface

{$ifNdef Generics}

  uses
    Deltics.Nullable.Base;


  type
    NullableInteger = object(Nullable)
    private
      fValue: Integer;
      function get_Value: Integer;
      procedure set_Value(const aValue: Integer);
    protected
      procedure GetValue(var aValue);
      procedure SetValue(const aValue);
    public
      property Value: Integer read get_Value write set_Value;
    end;

{$endif}



implementation


{$ifNdef Generics}

{ NullableInteger -------------------------------------------------------------------------------- }

  procedure NullableInteger.GetValue(var aValue);
  begin
    inherited;

    Integer(aValue) := fValue;
  end;


  procedure NullableInteger.SetValue(const aValue);
  begin
    inherited;

    fValue := Integer(aValue);
  end;


  function NullableInteger.get_Value: Integer;
  begin
    GetValue(result);
  end;


  procedure NullableInteger.set_Value(const aValue: Integer);
  begin
    SetValue(aValue);
  end;

{$endif}



end.
