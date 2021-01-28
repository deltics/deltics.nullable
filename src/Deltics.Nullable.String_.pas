
{$i deltics.nullable.inc}

  unit Deltics.Nullable.String_;


interface

{$ifNdef Generics}

  type
    NullableString = object
    private
      fHasValue: String;
      fValue: String;
      function get_IsNull: Boolean;
      function get_Value: String;
      procedure set_IsNull(const aValue: Boolean);
      procedure set_Value(const aValue: String);
    public
      procedure Clear;
      property IsNull: Boolean read get_IsNull write set_IsNull;
      property Value: String read get_Value write set_Value;
    end;

{$endif}



implementation

{$ifNdef Generics}

  uses
    Deltics.Nullable.Utils;


{ NullableString -------------------------------------------------------------------------------- }

  function NullableString.get_IsNull: Boolean;
  begin
    GetIsNull(fHasValue, result);
  end;


  function NullableString.get_Value: String;
  begin
    CheckHasValue(fHasValue);
    result := fValue;
  end;


  procedure NullableString.set_IsNull(const aValue: Boolean);
  begin
    SetNullIfTrue(aValue, fHasValue);
  end;


  procedure NullableString.set_Value(const aValue: String);
  begin
    SetHasValue(fHasValue);
    fValue := aValue;
  end;

  procedure NullableString.Clear;
  begin
    IsNull := TRUE;
  end;

{$endif}



end.
