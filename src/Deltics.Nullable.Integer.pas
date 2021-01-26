
{$i deltics.nullable.inc}

  unit Deltics.Nullable.Integer;


interface

{$ifNdef Generics}

  type
    NullableInteger = object
    private
      fHasValue: String;
      fValue: Integer;
      function get_IsNull: Boolean;
      function get_Value: Integer;
      procedure set_IsNull(const aValue: Boolean);
      procedure set_Value(const aValue: Integer);
    public
      procedure Clear;
      property IsNull: Boolean read get_IsNull write set_IsNull;
      property Value: Integer read get_Value write set_Value;
    end;

{$endif}



implementation

{$ifNdef Generics}

  uses
    Deltics.Nullable.Utils;


{ NullableInteger -------------------------------------------------------------------------------- }

  procedure NullableInteger.Clear;
  begin
    IsNull := TRUE;
  end;


  function NullableInteger.get_IsNull: Boolean;
  begin
    GetIsNull(fHasValue, result);
  end;


  function NullableInteger.get_Value: Integer;
  begin
    CheckHasValue(fHasValue);
    result := fValue;
  end;


  procedure NullableInteger.set_IsNull(const aValue: Boolean);
  begin
    SetNullIfTrue(aValue, fHasValue);
  end;


  procedure NullableInteger.set_Value(const aValue: Integer);
  begin
    SetHasValue(fHasValue);
    fValue := aValue;
  end;

{$endif}



end.
