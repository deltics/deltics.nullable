
{$i deltics.nullable.inc}

  unit Deltics.Nullable.String_;


interface

{$ifNdef Generics}

  uses
    Deltics.Nullable.Base;


  type
    NullableString = object(Nullable)
    private
      fValue: String;
      function get_Value: String;
      procedure set_Value(const aValue: String);
    protected
      procedure GetValue(var aValue);
      procedure SetValue(const aValue);
    public
      property Value: String read get_Value write set_Value;
    end;

{$endif}



implementation


{$ifNdef Generics}

{ NullableString --------------------------------------------------------------------------------- }

  procedure NullableString.GetValue(var aValue);
  begin
    inherited;

    String(aValue) := fValue;
  end;


  procedure NullableString.SetValue(const aValue);
  begin
    inherited;

    fValue := String(aValue);
  end;


  function NullableString.get_Value: String;
  begin
    GetValue(result);
  end;


  procedure NullableString.set_Value(const aValue: String);
  begin
    SetValue(aValue);
  end;

{$endif}



end.
